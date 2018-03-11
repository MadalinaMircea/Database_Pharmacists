alter PROCEDURE CrudManagers
	@name VARCHAR(45),
	@department varchar(50),
	@number VARCHAR(10),
	@r varchar(20) output
AS
BEGIN
	DECLARE @nr INT
	SET @nr = dbo.toNumber(@number)
	IF @nr = 0
	begin
		PRINT('Invalid number')
		set @r = 'Managers Failed'
	end
	ELSE
	BEGIN
		if dbo.ValidDepartment(@department) = 0
			print('Department not valid.')
		else
		begin
			select * from ProjectManagers
			declare @i int
			set @i = @nr
			
			while @i > 0
			begin
				insert into ProjectManagers values(@name + convert(varchar(10),@i), @department + convert(varchar(10),@i))
				set @i = @i - 1
			end
			select * from ProjectManagers

			declare @id int
			select @id = count(*) from ProjectManagers
			if @id > 0
				select @id = max(ManagerID) from ProjectManagers
			update ProjectManagers set Name = 'UPDATED' where ManagerID > @id - 50
			select * from ProjectManagers

			delete from ProjectManagers where ManagerID > @id + 50
			select * from ProjectManagers
			set @r = 'Managers successful'
		end
	END
END
GO
