INSERT INTO Tables VALUES (1, 'Pharmacists')
INSERT INTO Tables VALUES (2, 'Pharmacies')
INSERT INTO Tables VALUES (3, 'Employments')

SELECT * FROM Tables

INSERT INTO Views VALUES (1, 'OneTableView')
INSERT INTO Views VALUES (2, 'TwoTablesView')
INSERT INTO Views VALUES (3, 'GroupByView')


SELECT * FROM Views

INSERT INTO Tests VALUES(1, 'Test1')
INSERT INTO Tests VALUES(2, 'Test2')
INSERT INTO Tests VALUES(3, 'Test3')

SELECT * FROM Tests

--Testing table Pharmacists for 100 rows and OneTableView
INSERT INTO TestTables VALUES (1, 1, 100, 1)
INSERT INTO TestViews VALUES (1, 1)
--Testing table Employments for 1000 rows and TwoTablesView
INSERT INTO TestTables VALUES (2, 3, 1000, 4)
INSERT INTO TestViews VALUES (2, 2)
--Testing table Pharmacies for 500 rows and GroupByView
INSERT INTO TestTables VALUES (3, 2, 500, 2)
INSERT INTO TestViews VALUES (3, 3)

SELECT * FROM TestTables
SELECT * FROM TestViews
