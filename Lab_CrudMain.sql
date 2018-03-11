alter PROCEDURE CrudMain
AS
BEGIN

	delete from Campaigns where CampaignID > 50
	declare @res varchar(20)
	exec CrudCampaigns 'Name', 'Substance', 1, 1, 100, @res output
	print(@res)

	delete from ProjectManagers where ManagerID > 50
	EXEC CrudManagers 'Manager', 'Dept', 100, @res output
	print(@res)

	delete from Companies where CUI > 50
	exec CrudCompanies 'Company Test', 200, 'Drugs', 100, @res output
	print(@res)

	DELETE FROM Pharmacists where PharmacistID > 50
	EXEC CrudPharmacists 'Testing', '2018-01-01', 'UMF Testing', 100, @res output
	print(@res)

	delete from Reviews
	EXEC CrudReviews 3, 'OK', 7, 100, @res output
	print(@res)
END
GO

exec CrudMain
