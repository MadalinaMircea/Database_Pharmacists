CREATE PROCEDURE down1
AS
BEGIN
	ALTER TABLE Employments
	ALTER COLUMN ContractNo INT NOT NULL
	PRINT 'Changed column type from TINYINT to INT for ContractNo in Employments'
END
