CREATE PROCEDURE InsertPharmacists
	@param VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @nr INT
	IF(ISNUMERIC(@param) = 1)
	BEGIN
		SET @nr = CONVERT(INT, @param)
		IF(@nr <= 0)
		BEGIN
			PRINT 'Invalid parameter'
		END
		ELSE
		BEGIN
			DECLARE @prev INT
			DECLARE @id INT
			SELECT @prev = COUNT(PharmacistID) FROM Pharmacists
			IF @prev = 0
			BEGIN
				SET @id = 1
			END
			ELSE
			BEGIN
				SELECT @id = MAX(PharmacistID) FROM Pharmacists
				SET @id = @id + 1
			END
			DECLARE @i INT
			DECLARE @studies VARCHAR(4)
			SET @studies = 'Univ'
			DECLARE @dob DATE
			SET @dob = '1990-01-01'
			DECLARE @name VARCHAR(20)
			SET @i = 1
			WHILE @i <= @nr
			BEGIN
				SET @name = 'Name' + CONVERT(VARCHAR(10), @id + @i)
				INSERT INTO Pharmacists VALUES (@id + @i, @name, @dob, @studies)
				SET @i = @i + 1
			END
			SELECT * FROM Pharmacists
		END
	END
	ELSE
	BEGIN
		PRINT 'Invalid parameter'
	END
END