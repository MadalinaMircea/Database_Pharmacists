CREATE PROCEDURE down5
AS
BEGIN
	ALTER TABLE Groups
	DROP CONSTRAINT fk_Groups
	PRINT 'Dropped foreign key constraint'
END
GO
