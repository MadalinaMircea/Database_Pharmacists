USE Lab1_Code;

--1.The name of the pharmacies, their owners, the pharmacist and the pharmacist's studies where there are pharmacists with studies at UMF Cluj
SELECT p.Name as [Pharmacy Name], o.Name AS [Owner Name], ph.Name AS [Pharmacist Name], ph.Studies as [Pharmacist Studies]
FROM Pharmacies p
INNER JOIN Owners o ON o.OwnerID = p.OwnerId
INNER JOIN Employments e ON p.PharmacyID = e.PharmacyID
INNER JOIN Pharmacists ph ON ph.PharmacistID = e.PharmacistID
WHERE ph.Studies LIKE 'UMF Cluj';

--2.Show the grades and the number of each grade greater than 5
SELECT r.Grade, COUNT(r.grade) AS [Number of Grades]
FROM Reviews r
GROUP BY r.Grade
HAVING r.Grade > 5

--3.Show the campaign name, company name and pharmacist name for each entry in the reviews table where the comment is null
SELECT ca.Name AS [Campaign Name], c.Name as [Company Name], p.Name as [Pharmacist Name]
FROM Pharmacists p
INNER JOIN Reviews r ON r.PharmacistID = p.PharmacistID
INNER JOIN Campaigns ca ON ca.CampaignID = r.CampaignID
INNER JOIN Companies c ON c.CUI = ca.CompanyID
WHERE r.Comment LIKE 'No Comment.'

--4.Shows the pharmacy name, pharmacist name and campaign name where a pharmacist who is currently employed posted a review on a campaign
--left outer join for the employments and the pharmacies to get all the reviews
SELECT ph.Name AS [Pharmacy Name], p.Name AS [Pharmacist Name], c.Name AS [Campaign Name]
FROM Pharmacists p
INNER JOIN Reviews r ON r.PharmacistID = p.PharmacistID
INNER JOIN Employments e ON e.PharmacistID = p.PharmacistID
INNER JOIN Pharmacies ph ON ph.PharmacyID = e.PharmacyID
INNER JOIN Campaigns c ON c.CampaignID = r.CampaignID
ORDER BY ph.Name

--5.Shows the companies that had campaigns that were reviewed by pharmacists working in Targu Mures
SELECT c.Name AS [Company Name], ca.Name AS [Campaign Name], ph.Name AS [Pharmacy Name], p.Name AS [Pharmacist Name]
FROM Companies c
INNER JOIN Campaigns ca on ca.CompanyID = c.CUI
INNER JOIN Reviews r on r.CampaignID = ca.CampaignID
INNER JOIN Pharmacists p on p.PharmacistID = r.PharmacistID
INNER JOIN Employments e on e.PharmacistID = p.PharmacistID
INNER JOIN Pharmacies ph on ph.PharmacyID = e.PharmacyID
WHERE ph.City LIKE 'Targu Mures'

--6.Companies in descending order by the average grade of the reviews of their campaigns
SELECT c.Name, AVG(r.Grade) AS [Average Grade]
FROM Companies c
INNER JOIN Campaigns ca ON ca.CompanyID = c.CUI
LEFT OUTER JOIN Reviews r ON r.CampaignID = ca.CampaignID
GROUP BY c.Name
ORDER BY [Average Grade] DESC

--7.Name and number of reviews of campaigns with number of reviews greater than or equal to 2
SELECT c.Name, COUNT(c.Name) AS [Number of Reviews]
FROM Campaigns c
LEFT OUTER JOIN Reviews r ON r.CampaignID = c.CampaignID
GROUP BY c.Name
HAVING Count(c.Name) >= 2

--8.All the dates when a pharmacist left a review after August 1st
SELECT DISTINCT v.Date
FROM Views v
INNER JOIN Pharmacists p ON v.PharmacistID = p.PharmacistID
WHERE v.Date > '2017-08-01'

--9.The CEOs of the companies that has campaigns for medication with substances ending in 'ina'
SELECT c.Name AS [CEO], ca.Substance
FROM CEOs c
INNER JOIN Companies co ON co.CUI = c.CompanyID
INNER JOIN Campaigns ca ON ca.CompanyID = co.CUI
WHERE ca.Substance LIKE '%ina'

--10.All the distinct owners and the people they have employed
SELECT DISTINCT o.Name AS [Owner], p.Name AS [Pharmacist]
FROM Pharmacists p
INNER JOIN Employments e ON e.PharmacistID = p.PharmacistID
INNER JOIN Pharmacies ph ON ph.PharmacyID = e.PharmacyID
INNER JOIN Owners o ON o.OwnerID = ph.OwnerId
ORDER BY o.Name