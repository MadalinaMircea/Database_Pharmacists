CREATE PROCEDURE up4
AS
BEGIN
	ALTER TABLE Groups
	ADD Leader INT
	PRINT 'Added column Leader for Groups'
END
