CREATE PROCEDURE down2
AS
BEGIN
	ALTER TABLE Campaigns
	DROP df_Campaigns
	PRINT 'Dropped default constraint for Substance in Campaigns'
END
