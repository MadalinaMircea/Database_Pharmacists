CREATE PROCEDURE down4
AS
BEGIN
	ALTER TABLE Groups
	DROP COLUMN Leader
	PRINT 'Dropped column Leader for Groups'
END
