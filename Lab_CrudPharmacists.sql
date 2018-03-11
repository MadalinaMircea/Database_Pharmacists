alter PROCEDURE CrudPharmacists
	@name VARCHAR(45),
	@date date,
	@studies VARCHAR(50),
	@number VARCHAR(10),
	@r varchar(20) output
AS
BEGIN
	DECLARE @nr INT
	SET @nr = dbo.toNumber(@number)
	IF @nr = 0
	begin
		PRINT('Invalid number')
		set @r = 'Pharmacists failed'
	end
	ELSE
	BEGIN
		if dbo.ValidStudies(@studies) = 0
			print('Studies not valid.')
		else
		begin
			select * from Pharmacists
			declare @i int
			set @i = @nr
			declare @id int
			select @id = count(*) from Pharmacists
			if @id > 0
				select @id = max(PharmacistID) from Pharmacists
			while @i > 0
			begin
				insert into Pharmacists values(@id + @i, @name + convert(varchar(10),@i), @date, @studies)
				set @i = @i - 1
			end
			select * from Pharmacists
			update Pharmacists set Name = 'UPDATED NAME' where PharmacistID > @id + (@nr / 2)
			select * from Pharmacists
			delete from Pharmacists where Name like 'UPDATED NAME'
			select * from Pharmacists
			print('Completed successfully')
			set @r = 'Pharm. Successful'
		end
	END
END
GO
