USE Lab1_code

CREATE TABLE Pharmacists
(
	PharmacistID INT PRIMARY KEY,
	Name VARCHAR(50) DEFAULT 'TBA',
	DOB date,
	Studies VARCHAR(50)
);

CREATE TABLE Owners
(
	OwnerID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50),
	DOB date,
	Studies VARCHAR(50)
);

CREATE TABLE Pharmacies
(
	PharmacyID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50),
	City VARCHAR(50),
	OwnerId INT,
	CONSTRAINT fk_phOwner FOREIGN KEY(OwnerId) REFERENCES Owners(OwnerID) ON DELETE CASCADE
);

CREATE TABLE Employments
(
	PharmacistID INT,
	PharmacyID INT,
	Start DATE,
	ContractNo INT NOT NULL,
	CONSTRAINT pk_Employments PRIMARY KEY(PharmacistID, PharmacyID),
	CONSTRAINT fk_phID FOREIGN KEY(PharmacistID) REFERENCES Pharmacists(PharmacistID) ON DELETE CASCADE,
	CONSTRAINT fk_phyID FOREIGN KEY(PharmacyID) REFERENCES Pharmacies(PharmacyID) ON DELETE CASCADE
);

CREATE TABLE ProjectManagers
(
	ManagerID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50),
	Department VARCHAR(50)
);

CREATE TABLE Companies
(
	CUI INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50),
	NoOfEmployees INT DEFAULT 1,
	ObjOfActivity VARCHAR(100)
);

CREATE TABLE Campaigns
(
	CampaignID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50) DEFAULT 'TBA',
	Substance VARCHAR(50),
	ManagerID INT,
	CompanyID INT,
	CONSTRAINT fk_maID FOREIGN KEY(ManagerID) REFERENCES ProjectManagers(ManagerID),
	CONSTRAINT fk_compID FOREIGN KEY(CompanyID) REFERENCES Companies(CUI)
);

CREATE TABLE Reviews
(
	PharmacistID INT,
	CampaignID INT,
	Comment VARCHAR(200) DEFAULT 'No comment.',
	Grade TINYINT DEFAULT 0 CHECK(Grade >= 0 AND Grade <= 10),
	CONSTRAINT pk_Reviews PRIMARY KEY(PharmacistID, CampaignID),
	CONSTRAINT fk_Reviews_ph FOREIGN KEY (PharmacistID) REFERENCES Pharmacists(PharmacistID) ON DELETE CASCADE,
	CONSTRAINT fk_Reviews_c FOREIGN KEY (CampaignID) REFERENCES Campaigns(CampaignID) ON DELETE CASCADE
);

CREATE TABLE Watched
(
	ViewID INT PRIMARY KEY IDENTITY,
	Date DATE,
	Time TIME,
	PharmacistID INT,
	CONSTRAINT fk_views FOREIGN KEY (PharmacistID) REFERENCES Pharmacists(PharmacistID) ON DELETE CASCADE
);


CREATE TABLE CEOs
(	
	CompanyID INT FOREIGN KEY REFERENCES Companies(CUI),
	Name VARCHAR(50),
	CONSTRAINT pk_Ceos PRIMARY KEY(CompanyID),
);

DROP TABLE CEOs;
DROP TABLE Views;
DROP TABLE Reviews;
DROP TABLE Contracts;
DROP TABLE Campaigns;
DROP TABLE Companies;
DROP TABLE ProjectManagers;
DROP TABLE Employments;
DROP TABLE Pharmacies;
DROP TABLE Owners;
DROP TABLE Pharmacists;

