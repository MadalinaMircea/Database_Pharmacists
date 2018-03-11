alter procedure CrudCompanies
	@Name VARCHAR(50),
	@NoOfEmployees INT,
	@Activity VARCHAR(100),
	@nr int,
	@r varchar(20) output
AS
BEGIN
	if dbo.ValidActivity(@Activity) = 0
	begin
		print('Invalid activity')
		set @r = 'Companies Failed'
	end
	else
	begin
		select * from Companies

		declare @i int
		set @i = 1
		while @i <= @nr
		begin
			insert into Companies values (@Name + convert(varchar(10), @i), @NoOfEmployees, @Activity)
			set @i = @i + 1
		end

		select * from Companies

		update Companies set NoOfEmployees = 1 where Name like @Name + '%'

		select * from Companies

		delete from Companies where NoOfEmployees = 1

		select * from Companies
		set @r = 'Companies Successful'
	end
END
GO