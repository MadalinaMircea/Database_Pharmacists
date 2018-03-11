CREATE PROCEDURE TestRun
	@param VARCHAR(10)
AS
BEGIN
	IF ISNUMERIC(@param) = 1
	BEGIN
		--get the testId
		DECLARE @testId INT
		SET @testId = CONVERT(INT, @param)

		IF @testId < 4
		BEGIN
			DECLARE @tableId INT
			DECLARE @tableName VARCHAR(50)
			DECLARE @rowNr INT
			--obtain the tableId and nr of rows from the test with testId
			SELECT @tableId = t.TableID, @rowNr = t.NoOfRows FROM TestTables t WHERE t.TestID = @testId
			--obtain the name of the table with tableId
			SELECT @tableName = t.Name FROM Tables t WHERE t.TableID = @tableId
			--compute the procedure name
			DECLARE @insertName VARCHAR(50)
			DECLARE @deleteName VARCHAR(50)
			SET @insertName = 'Insert' + @tableName
			SET @deleteName = 'Delete' + @tableName
		
			DECLARE @viewId INT
			DECLARE @viewName VARCHAR(50)
			--obtain the viewId from the test with testId
			SELECT @viewId = t.ViewId FROM TestViews t WHERE t.TestID = @testId
			--obtain the name of the view with viewId
			SELECT @viewName = v.Name FROM Views v WHERE v.ViewID = @viewId

			DECLARE @startTime DATETIME
			DECLARE @endInsertTime DATETIME
			DECLARE @endTime DATETIME

			--get the starting time
			SET @startTime = GETDATE()

			--execute the insert and delete
			EXEC @deleteName
			EXEC @insertName @rowNr

			--get the time
			SET @endInsertTime = GETDATE()

			--evaluate the view
			exec ( 'SELECT * FROM ' + @viewName)

			--get the end time
			SET @endTime = GETDATE()

			DECLARE @count INT
			DECLARE @id INT
			SELECT @count = COUNT(*) FROM TestRuns
			IF @count = 0
			BEGIN
				SET @id = 1
			END
			ELSE
			BEGIN
				SELECT @id = MAX(TestRunID) FROM TestRuns
				SET @id = @id + 1
			END

			INSERT INTO TestRuns VALUES (@id, @tableName + @viewName, @startTime, @endTime)
			INSERT INTO TestRunTables VALUES (@id, @tableId, @startTime, @endInsertTime)
			INSERT INTO TestRunViews VALUES (@id, @viewId, @endInsertTime, @endTime)
		END
		ELSE
		BEGIN
			PRINT 'Invalid test ID'
		END
	END
	ELSE
	BEGIN
		PRINT 'Invalid parameter'
	END
END