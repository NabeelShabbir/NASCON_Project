create database NASCON_MS;

use NASCON_MS;


--drop table AllUsers;
--drop table Participants;
--drop table Sponsors;
--drop table FacultyMentors;
--drop table Administrators;
--drop table Categories;
--drop table Events;
--drop table StudentBodies;
--drop table StudentExecutives;
--drop table StudentBodyMembers;




CREATE TABLE AllUsers (
	userID INT UNIQUE IDENTITY(1, 1) NOT NULL,
	username VARCHAR(40) PRIMARY KEY,
	fullname VARCHAR(40) NOT NULL,
	password VARCHAR(40) NOT NULL,
	email VARCHAR(40),
	phone VARCHAR(40),
	userRole INT NOT NULL, 
);
--User Role Values:
-- 1 : Admin 
-- 2 : Student Exec
-- 3 : Faculty 
-- 4 : Sponsor
-- 5 : Participant
CREATE TABLE Administrators (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES AllUsers(username),
);

-- Insert into Admin before doing anything.
INSERT AllUsers (username, fullname, password, email, phone, userRole) VALUES ('Admin1', 'Amir Rehman', 'amirAdmin123', 'amir@nu.edu.pk', '0123789456', 1);
INSERT Administrators (username) VALUES ('Admin1');


CREATE TABLE Participants (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	cnic VARCHAR(13),
	FOREIGN KEY (username) REFERENCES AllUsers(username),
);

CREATE TABLE FacultyMentors (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES AllUsers(username),

);

CREATE TABLE Categories (
    categoryName VARCHAR(40) PRIMARY KEY,
	mentorUsername VARCHAR(40),
    secretaryUsername VARCHAR(40), -- Username of the secretary responsible for the category
    --FOREIGN KEY (secretaryUsername) REFERENCES StudentExecutives(username),
    FOREIGN KEY (mentorUsername) REFERENCES FacultyMentors(username),
);
ALTER TABLE Categories 
ADD CONSTRAINT FK_secretaryUName
FOREIGN KEY (secretaryUsername) REFERENCES StudentExecutives(username);

-- Important to do before anything
-- Make All the 5 Categories first: EE, CS, Business, Social, Sports.
INSERT Categories (categoryName) VALUES 
('CS'),
('EE'),
('Business'),
('Sports'),
('Social');


CREATE TABLE StudentBodies (
    studentBodyID INT PRIMARY KEY,
    categoryName VARCHAR(40),
	FOREIGN KEY (categoryName) REFERENCES Categories(categoryName),
);
CREATE TABLE StudentExecutives (
    username VARCHAR(40) PRIMARY KEY,
    studentRole VARCHAR(40),
    studentBodyID INT, -- Foreign key reference to StudentBodies table
    FOREIGN KEY (studentBodyID) REFERENCES StudentBodies(studentBodyID)
);

CREATE TABLE StudentBodyMembers (
    studentBodyID INT,
    username VARCHAR(40),
    studentRole VARCHAR(40), -- Role within the student body (e.g., President, Vice President, Secretary, Member)
    FOREIGN KEY (studentBodyID) REFERENCES StudentBodies(studentBodyID),
    FOREIGN KEY (username) REFERENCES StudentExecutives(username)
);
--INSERT StudentBodies (studentBodyID, categoryName) VALUES (0, 'EE');
--INSERT StudentExecutives (username, studentBodyID, studentRole) VALUES ('hisham', 0, 'President');
--INSERT StudentBodyMembers (studentBodyID, username, studentRole) VALUES (0, 'hisham', 'President');
CREATE TABLE Sponsors (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	company VARCHAR(40),
	cnic VARCHAR(13),
	category VARCHAR(40),
	package VARCHAR(10),
	FOREIGN KEY (username) REFERENCES AllUsers(username),
	FOREIGN KEY (category) REFERENCES Categories(categoryname),
);



CREATE TABLE Events (
    eventID INT PRIMARY KEY IDENTITY,
    eventName VARCHAR(100) UNIQUE,
    date DATE NOT NULL,
    timing TIME NOT NULL,
    venue VARCHAR(100) NOT NULL,
    headUsername VARCHAR(40), -- Username of the head of the event
	mentorUsername VARCHAR(40),
    categoryName VARCHAR(40), -- Foreign key reference to Categories table
    FOREIGN KEY (headUsername) REFERENCES StudentExecutives(username),
    FOREIGN KEY (categoryName) REFERENCES Categories(categoryName)
);


CREATE TABLE Tickets (
    ticketID INT PRIMARY KEY IDENTITY(1,1),
    eventID INT,
    username VARCHAR(40),
    registrationDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (eventID) REFERENCES Events(eventID),
    FOREIGN KEY (username) REFERENCES AllUsers(username)
);

CREATE TABLE FoodDeals(
    username VARCHAR(40),
	dealNumber INT
);

select * from FoodDeals

---------------------------------------------------------------------------
--DECLARE @tableName NVARCHAR(128) = 'StudentBodies'; -- Specify your table name here

--DECLARE @sql NVARCHAR(MAX) = '';

--SELECT @sql += 'ALTER TABLE ' + OBJECT_SCHEMA_NAME(parent_object_id) + '.' + OBJECT_NAME(parent_object_id) + 
--               ' DROP CONSTRAINT ' + name + ';' + CHAR(13)
--FROM sys.foreign_keys
--WHERE referenced_object_id = OBJECT_ID(@tableName);

--PRINT @sql; -- Optionally print the generated SQL statements for verification

---- Execute the dynamic SQL to drop the foreign key constraints
--EXEC sp_executesql @sql;
---------------------------------------------------------------------------


--CREATE TABLE Categories (
--	categoryname VARCHAR(40) PRIMARY KEY,
--	categorymentor VARCHAR(40) NOT NULL,
--	FOREIGN KEY (categorymentor) REFERENCES AllUsers (username),
--);

--CREATE TABLE Events (
--	eventname VARCHAR(40) PRIMARY KEY,
--	eventdate DATE NOT NULL,
--	eventtime TIME,
--	eventvenue VARCHAR(40) NOT NULL,
--	eventmentor VARCHAR(40) NOT NULL,
--	studenthead VARCHAR(40) NOT NULL,
--	eventcategory VARCHAR(40) NOT NULL,
--	FOREIGN KEY (eventmentor) REFERENCES AllUsers (username),
--	FOREIGN KEY (studenthead) REFERENCES AllUsers (username),
--	FOREIGN KEY (eventcategory) REFERENCES Categories (categoryname),
--);

-- SELECT * FROM AllUsers INNER JOIN Participants ON AllUsers.username = Participants.username WHERE AllUsers.username = 'hishhasan' AND AllUsers.password = 'hasan123';

SELECT * FROM AllUsers where userRole = 4 ORDER BY userID;
SELECT * FROM Administrators;
SELECT * FROM Participants;
SELECT * FROM FacultyMentors;
SELECT * FROM Sponsors;

SELECT * FROM StudentExecutives;
SELECT * FROM StudentBodies;
SELECT * FROM StudentBodyMembers;
SELECT * FROM Categories;
SELECT * FROM Events;
SELECT * FROM Tickets;

SELECT AU.username, AU.fullname, email, phone, company, cnic, category, package FROM AllUsers AU JOIN Sponsors S ON S.username = AU.username WHERE S.username = 'sp3';
--UPDATE Categories SET secretaryUsername = NULL WHERE secretaryUsername = '2secr';
--DELETE FROM AllUsers WHERE userRole = 2;
DELETE FROM AllUsers WHERE username = 'user3';
DELETE FROM Participants
--DELETE FROM StudentExecutives WHERE studentBodyID = 2;
--DELETE FROM StudentBodies where studentBodyID = 2;
--DELETE FROM StudentBodyMembers WHERE studentBodyID = 2;
DELETE FROM FacultyMentors

DELETE FROM AllUsers WHERE username = 'hishhasan';
DELETE FROM AllUsers WHERE username = '0presi';
DELETE FROM AllUsers WHERE username = 'par1';
DELETE FROM Tickets WHERE username = 'par1';
INSERT INTO Tickets (eventID, username) VALUES ('2', 'hell')



-- INSERT AllUsers (username, fullname, password, email, phone) VALUES ();

-- Inserting sample data into the AllUsers table
INSERT INTO AllUsers (username, fullname, password, email, phone, userRole)
VALUES ('user1', 'John Doe', 'password1', 'john.doe@example.com', '1234567890', 3),
       ('user2', 'Jane Smith', 'password2', 'jane.smith@example.com', '0987654321', 3),
       ('user3', 'Alice Johnson', 'password3', 'alice.johnson@example.com', '5555555555', 3);

-- Inserting sample data into the FacultyMentors table
INSERT INTO FacultyMentors (username)
VALUES ('user1'), ('user2'), ('user3');

SELECT AU.username, AU.fullname, password, email, phone, company, cnic, category, package FROM AllUsers AU, Sponsors S WHERE AU.username = 'repp_sponsed';


SELECT sbm.username, sbm.studentRole
FROM StudentBodyMembers sbm
JOIN StudentBodyMembers president ON sbm.studentBodyID = president.studentBodyID
<<<<<<< HEAD
WHERE president.username = '0presi';
=======
WHERE president.username = '0presi';
>>>>>>> 8f7c77888f4c8d7a7c84343efbc19a6a12f01036


SELECT Participants.username, fullname, email, phone, cnic FROM AllUsers JOIN Participants ON Participants.username = AllUsers.username WHERE Participants.username = 'hishhasan'