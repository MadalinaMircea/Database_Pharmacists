alter procedure CrudReviews
	@CampaignID INT,
	@Comment VARCHAR(200),
	@grade TINYINT,
	@number varchar(10),
	@r varchar(20) output
as
BEGIN
	DECLARE @nr INT
	SET @nr = dbo.toNumber(@number)
	IF @nr = 0
	begin
		PRINT('Invalid number')
		set @r = 'Reviews Failed'
	end
	ELSE
	BEGIN
		if dbo.ValidGrade(@grade) = 0
		begin
			print('Grade not valid.')
			set @r = 'Reviews Failed'
		end
		else
		begin
			declare @testID INT
			select @testID = CampaignID from dbo.ValidCampaignID(@CampaignID)
			if @testID IS NULL
			begin
				print('Campaign ID not valid')
				set @r = 'Reviews Failed'
			end
			else
			begin
				declare @pharmacistId int
				exec InsertPharmacists @nr
				select @pharmacistId = max(PharmacistID) from Pharmacists
				set @pharmacistId = @pharmacistId - @nr

				select * from Reviews

				declare @i int
				set @i = @nr
				while @i > 0
				begin
					insert into Reviews values (@pharmacistId + @i, @CampaignID, @Comment, @grade)
					set @i = @i - 1
				end

				select * from Reviews

				update Reviews set Comment = 'UPDATED COMMENT' where PharmacistID > @pharmacistId + (@nr / 2)

				select * from Reviews

				delete from Reviews where PharmacistID > @pharmacistId + (@nr / 2)

				select * from Reviews

				set @r = 'Reviews Successful'
			end
		end
	END
END
GO