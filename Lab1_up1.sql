CREATE PROCEDURE up1
AS
BEGIN
	ALTER TABLE Employments
	ALTER COLUMN ContractNo BIGINT NOT NULL
	PRINT 'Changed column type from INT to BIGINT for ContractNo in Employments'
END