CREATE PROCEDURE up2
AS
BEGIN
	ALTER TABLE Campaigns
	ADD CONSTRAINT df_Campaigns DEFAULT 'None' FOR Substance
	PRINT 'Added default constraint <None> for Substance in Campaigns'
END
