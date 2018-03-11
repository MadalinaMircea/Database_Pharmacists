ALTER procedure [dbo].[CrudCampaigns]
	@Name VARCHAR(45),
	@Substance VARCHAR(50),
	@ManagerID INT = 0,
	@Company INT = 0,
	@nr int,
	@r varchar(20) output
AS
BEGIN
	DECLARE @result INT
	declare @CompanyNr int
	set @ManagerID = dbo.ValidManager(@ManagerID)
	select @CompanyNr = count(*) from dbo.ValidCompany(@Company)
	if @ManagerID = 0 or @CompanyNr = 0
	begin
		print('No data.')
		set @r = 'Campaigns Failed'
	end
	else
	begin
		declare @CompanyID int
		select @CompanyID = CUI from dbo.ValidCompany(@Company)
		select * from Campaigns
		while @nr > 0
		begin
			insert into Campaigns values(@Name + convert(varchar(5), @nr), @Substance, @ManagerID, @CompanyID)
			set @nr = @nr - 1
		end

		select * from Campaigns
		update Campaigns set Substance = 'NEW SUBSTANCE' where Name like @Name + '%0' or Name like @Name + '%5'

		select * from Campaigns

		delete from Campaigns where Substance = 'NEW SUBSTANCE'
		select * from Campaigns
		set @r = 'Campaigns Successful'
	end
END