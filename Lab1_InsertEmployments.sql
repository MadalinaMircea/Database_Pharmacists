CREATE PROCEDURE InsertEmployments
	@param VARCHAR(10)
AS
BEGIN
	IF ISNUMERIC(@param) = 1
	BEGIN
		DECLARE @nr INT
		SET @nr = CONVERT(INT, @param)
		IF @nr <= 0
		BEGIN
			PRINT 'Invalid parameter'
		END
		ELSE
		BEGIN
			EXEC InsertPharmacies @nr
			EXEC InsertPharmacists @nr
			DECLARE @pharmacistId INT
			SELECT @pharmacistId = MAX(PharmacistID) FROM Pharmacists
			SET @pharmacistId = @pharmacistId - @nr + 1
			DECLARE @pharmacyId INT
			SELECT @pharmacyId = MAX(PharmacyID) FROM Pharmacies
			SET @pharmacyId = @pharmacyId - @nr + 1
			DECLARE @i INT
			SET @i = 1
			WHILE @i <= @nr
			BEGIN
				INSERT INTO Employments VALUES (@pharmacistId, @pharmacyId, '2017-01-02', '12345')
				SET @pharmacistId = @pharmacistId + 1
				SET @pharmacyId = @pharmacyId + 1
				SET @i = @i + 1
			END
			SELECT * FROM Employments
		END
	END
	ELSE
	BEGIN
		PRINT 'Invalid parameter'
	END
END