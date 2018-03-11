CREATE FUNCTION dbo.toNumber(@x varchar(4))
RETURNS int
AS
BEGIN
	DECLARE @r int;
	IF ISNUMERIC(@x) = 1
	BEGIN
		SET @r = CONVERT(int, @x)
		IF @r < 0
			SET @r = 0
	END
	ELSE
		SET @r = 0
	RETURN @r;
END;

CREATE FUNCTION dbo.ValidStudies(@studies VARCHAR(50))
RETURNS bit
as
begin
	declare @r bit
	if @studies like 'UMF%'
		set @r = 1
	else
		set @r = 0
	return @r
end

alter function dbo.ValidActivity(@act varchar(50))
returns bit
as
begin
	declare @r bit
	if @act like '%Drugs%' or @act like '%Suplements%' or @act like '%Medicine%'
		set @r = 1
	else
		set @r = 0
	return @r
end

CREATE FUNCTION dbo.ValidCampaignID(@id int)
RETURNS table
as
return
(	select *
	from Campaigns
	where CampaignID = @id
)

create function dbo.ValidGrade(@grade int)
returns bit
as
begin
	declare @r bit
	if @grade >= 0 and @grade <= 10
		set @r = 1
	else
		set @r = 0
	return @r
end

CREATE FUNCTION dbo.ValidDepartment(@department VARCHAR(50))
RETURNS bit
as
begin
	declare @r bit
	if @department like 'D%' or @department like '%Dept.'
		set @r = 1
	else
		set @r = 0
	return @r
end

create function dbo.ValidManager(@manager int)
returns int
as
begin
	declare @r int
	if @manager != 0
	begin
		select @r = count(*) from ProjectManagers where ManagerID = @manager
		if @r != 0
			set @r = @manager
	end
	else
	begin
		select @r = count(*) from ProjectManagers
		if @r != 0
			select @r = max(ManagerID) from ProjectManagers
	end
	return @r
end

alter function dbo.ValidCompany(@company int)
returns table
as
return
(
	select CUI from Companies where CUI = @company
)