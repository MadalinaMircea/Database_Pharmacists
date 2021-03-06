CREATE PROCEDURE Main
	@nr VARCHAR(10)
AS
BEGIN
	DECLARE @v int
	IF(ISNUMERIC(@nr)=1)
	BEGIN
		SET @v = CONVERT(INT, @nr)
		IF @v >= 1 AND @v <= 6
		BEGIN
			DECLARE @current INT
			DECLARE @call VARCHAR(10)
			SELECT TOP 1 @current = Vid FROM Version
			PRINT 'Starting version: ' + CONVERT(VARCHAR(1), @current)
			IF @current < @v
			BEGIN
				WHILE @current < @v
				BEGIN
					SET @call = 'up' + CONVERT(VARCHAR(3), @current)
					EXEC @call
					SET @current = @current + 1
				END
				UPDATE Version SET Vid = @v
			END
			ELSE
			IF @current > @v
			BEGIN
				WHILE @current > @v
				BEGIN
					SET @call = 'down' + CONVERT(VARCHAR(3), @current - 1)
					EXEC @call
					SET @current = @current - 1
				END
				UPDATE Version SET Vid = @v
			END
			SELECT TOP 1 @current = Vid FROM Version
			PRINT 'Ending version: ' + CONVERT(VARCHAR(1), @current)
		END
		ELSE
		BEGIN
			PRINT 'Invalid parameter'
		END
	END
	ELSE
	BEGIN
		PRINT 'Invalid parameter'
	END
END
GO