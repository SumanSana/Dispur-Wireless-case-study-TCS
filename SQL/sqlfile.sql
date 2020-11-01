CREATE DATABASE IF NOT EXISTS dispurwireless;
use dispurwireless;

CREATE TABLE Profile(
regId int PRIMARY KEY,
FirstName VARCHAR(40) NOT NULL,
LastName VARCHAR(40) NOT NULL,
Address VARCHAR(200) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
ContactNumber VARCHAR(10)
);

CREATE TABLE Account(
regId int PRIMARY KEY,
Password VARCHAR(15) NOT NULL,
Role VARCHAR(40) NOT NULL,
FOREIGN KEY(regId) REFERENCES Profile(regId) ON DELETE CASCADE
);

CREATE TABLE Plan(
PlanId int PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50) NOT NULL,
Type VARCHAR(15) NOT NULL,
Tarrif int NOT NULL,
Validity int NOT NULL,
price int NOT NULL,
Rental VARCHAR(10) NOT Null
);

CREATE TABLE BuyPlan(
regId int Not Null,
planId int Not Null,
subscriptionDate Date Not Null,
expireDate Date Not Null,
FOREIGN KEY(regId) References Profile(regId) ON DELETE CASCADE,
FOREIGN KEY(planId) References Plan(planId) ON DELETE CASCADE
);


INSERT INTO Profile Values(51219382,'Suman','Sana','Singur','sumansana@gmail.com','6290954191');
INSERT INTO Account Values(51219382,'Suman@12345','Admin');





