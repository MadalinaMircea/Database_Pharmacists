USE Lab1_code;

INSERT INTO Owners(Name,DOB,Studies)
VALUES ('Mircea Madalina','1997-11-19','UBB');
INSERT INTO Owners(Name,DOB,Studies)
VALUES ('Mircea Ioana','1972-11-28','UMF');
INSERT INTO Owners(Name,DOB,Studies)
VALUES ('Mircea Doru','1972-10-14','UMF');
INSERT INTO Owners(Name,DOB,Studies)
VALUES ('Bilc Irina','1997-04-20','UBB');
INSERT INTO Owners(Name,DOB,Studies)
VALUES ('Blaga Cristian','1998-01-20','UTCN');
INSERT INTO Owners(Name,DOB,Studies)
VALUES ('Istrate Silvia','1945-04-27','UMF');

INSERT INTO Pharmacies(Name, City, OwnerID)
VALUES ('EcoFarmacia 1','Targu Mures','2');
INSERT INTO Pharmacies(Name, City, OwnerID)
VALUES ('ElmaFarm Iulius','Cluj','1');
INSERT INTO Pharmacies(Name, City, OwnerID)
VALUES ('Tei','Bucuresti','6');
INSERT INTO Pharmacies(Name, City, OwnerID)
VALUES ('Rio','Targu Mures','6');
INSERT INTO Pharmacies(Name, City, OwnerID)
VALUES ('Richter 5','Timisoara','2');

INSERT INTO Companies(Name, NoOfEmployees, ObjOfActivity)
VALUES ('Tilman','275','Natural Suplements');
INSERT INTO Companies(Name, NoOfEmployees, ObjOfActivity)
VALUES ('GSK','1000','Drugs and Medication');
INSERT INTO Companies(Name, NoOfEmployees, ObjOfActivity)
VALUES ('Mylan','7250','Drugs and Medication');
INSERT INTO Companies(Name, NoOfEmployees, ObjOfActivity)
VALUES ('Johnson&Johnson','300','Drugs and Medication');
INSERT INTO Companies(Name, NoOfEmployees, ObjOfActivity)
VALUES ('Amniocen','50','Natural Suplements');

INSERT INTO Pharmacists(PharmacistID, Name, DOB, Studies)
VALUES ('430','Mihai Alice','1977-10-16','UMF Iasi');
INSERT INTO Pharmacists(PharmacistID, Name, DOB, Studies)
VALUES ('711','Popescu Ion', '1965-03-02', 'None');
INSERT INTO Pharmacists(PharmacistID, Name, DOB, Studies)
VALUES ('2','Voiculescu Vasile', '1980-01-01', 'UMF Cluj');
INSERT INTO Pharmacists(PharmacistID, Name, DOB, Studies)
VALUES ('79','Smith Jane', '1977-12-20', 'UMF Cluj');
INSERT INTO Pharmacists(PharmacistID, Name, DOB, Studies)
VALUES ('333','Pop Anca', '1970-09-25', 'UMF Bucuresti');
INSERT INTO Pharmacists(PharmacistID, Name, DOB, Studies)
VALUES ('960','Pop Lorelai', '1994-06-12', 'UMF Targu Mures');

INSERT INTO ProjectManagers(Name, Department)
VALUES ('Dandanache Agamemnon', 'Sales');
INSERT INTO ProjectManagers(Name, Department)
VALUES ('Johnson Cara', 'Public Relations');
INSERT INTO ProjectManagers(Name, Department)
VALUES ('Istrate Valeria', 'Marketing');
INSERT INTO ProjectManagers(Name, Department)
VALUES ('Chiorean Violeta', 'Marketing');
INSERT INTO ProjectManagers(Name, Department)
VALUES ('Simion Camelia', 'Public Relations');

INSERT INTO Campaigns(Name, Substance, ManagerID, CompanyID)
VALUES ('Brufen','Ibuprofen', '1', '3');
INSERT INTO Campaigns(Name, Substance, ManagerID, CompanyID)
VALUES ('Antimetil','Extract Ghimbir', '2', '1');
INSERT INTO Campaigns(Name, Substance, ManagerID, CompanyID)
VALUES ('Kreon','Pancreatina', '5', '1');
INSERT INTO Campaigns(Name, Substance, ManagerID, CompanyID)
VALUES ('Theraflu','Paracetamol', '3', '2');
INSERT INTO Campaigns(Name, Substance, ManagerID, CompanyID)
VALUES ('Hexoral','Hexetidina', '4', '4');
INSERT INTO Campaigns(Name, Substance, ManagerID, CompanyID)
VALUES ('Decasept','Propolis', '4', '5');

INSERT INTO CEOs(CompanyID, Name)
VALUES ('1', 'Marian Maria');
INSERT INTO CEOs(CompanyID, Name)
VALUES ('2', 'Ionescu Ion');
INSERT INTO CEOs(CompanyID, Name)
VALUES ('3', 'Grigorescu Grigore');
INSERT INTO CEOs(CompanyID, Name)
VALUES ('4', 'Mircea Gabriel');
INSERT INTO CEOs(CompanyID, Name)
VALUES ('5', 'Stanescu Stanca');

INSERT INTO Employments(PharmacistID, PharmacyID, Start, ContractNo)
VALUES ('430','4','2016-01-03','123');
INSERT INTO Employments(PharmacistID, PharmacyID, Start, ContractNo)
VALUES ('430','1','2017-04-20','2044');
INSERT INTO Employments(PharmacistID, PharmacyID, Start, ContractNo)
VALUES ('333','4','2016-01-03','123');
INSERT INTO Employments(PharmacistID, PharmacyID, Start, ContractNo)
VALUES ('2','2','2000-01-17','19387');
INSERT INTO Employments(PharmacistID, PharmacyID, Start, ContractNo)
VALUES ('960','3','2017-06-20','1');
INSERT INTO Employments(PharmacistID, PharmacyID, Start, ContractNo)
VALUES ('960','4','2013-03-17','10');
INSERT INTO Employments(PharmacistID, PharmacyID, Start, ContractNo)
VALUES ('79','1','2017-09-03','77777');

INSERT INTO Reviews(PharmacistID, CampaignID, Comment, Grade)
VALUES ('960', '1', 'Very good!', '10');
INSERT INTO Reviews(PharmacistID, CampaignID, Grade)
VALUES ('960', '4', '7');
INSERT INTO Reviews(PharmacistID, CampaignID, Comment, Grade)
VALUES ('333', '1', 'I will recommend it', '9');
INSERT INTO Reviews(PharmacistID, CampaignID)
VALUES ('2', '1');
INSERT INTO Reviews(PharmacistID, CampaignID, Grade)
VALUES ('960', '2', '8');
INSERT INTO Reviews(PharmacistID, CampaignID, Comment)
VALUES ('430', '1', 'Very good!');
INSERT INTO Reviews(PharmacistID, CampaignID, Grade)
VALUES ('333', '2', '10');
INSERT INTO Reviews(PharmacistID, CampaignID, Comment, Grade)
VALUES ('711', '4', 'Good', '7');
INSERT INTO Reviews(PharmacistID, CampaignID, Comment, Grade)
VALUES ('2', '5', 'Perfect!', '10');
INSERT INTO Reviews(PharmacistID, CampaignID, Comment, Grade)
VALUES ('960', '5', 'No', '2');

INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-10-20','11:20','960');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-07-11','16:35','960');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-09-22','7:29','430');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-03-03','00:01','711');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-10-20','17:22','2');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-04-20','16:20','711');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-10-19','15:15','960');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-06-11','18:59','960');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-08-14','09:09','2');
INSERT INTO Views(Date, Time, PharmacistID)
VALUES ('2017-10-17','15:59','960');