CREATE VIEW OneTableView
AS
	SELECT PharmacistID, Name
	FROM Pharmacists

CREATE VIEW TwoTablesView
AS
	SELECT p.Name AS PharmacistName, ph.Name PharmacyName, e.Start as StartDate
	FROM Pharmacists p
	INNER JOIN Employments e ON e.PharmacistID = p.PharmacistID
	INNER JOIN Pharmacies ph ON ph.PharmacyID = e.PharmacyID

CREATE VIEW GroupByView
AS
	SELECT r.Grade, COUNT(r.Grade) AS NumberOfGrade
	FROM Campaigns ca
	INNER JOIN Companies c ON c.CUI = ca.CompanyID
	INNER JOIN Reviews r ON r.CampaignID = ca.CampaignID
	GROUP BY r.Grade