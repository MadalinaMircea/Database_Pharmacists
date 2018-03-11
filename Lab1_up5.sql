CREATE PROCEDURE up5
AS
BEGIN
	ALTER TABLE Groups
	ADD CONSTRAINT fk_Groups FOREIGN KEY(Leader) REFERENCES Pharmacists(PharmacistID)
	PRINT 'Foreign Key constraint added for table Groups, column Leader'
END
