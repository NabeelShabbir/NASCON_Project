create database NASCON_MS;

use NASCON_MS;


--drop table AllUsers;
--drop table Participants;
--drop table Sponsors;
--drop table StudentExecutives;
--drop table FacultyMentors;
--drop table Administrators;
--drop table Categories;
--drop table Events;
--drop table StudentBodies;

CREATE TABLE AllUsers (
	userID INT UNIQUE IDENTITY(1, 1) NOT NULL,
	username VARCHAR(40) PRIMARY KEY,
	fullname VARCHAR(40) NOT NULL,
	password VARCHAR(40) NOT NULL,
	email VARCHAR(40),
	phone VARCHAR(40),
	userRole INT NOT NULL,
);

CREATE TABLE Administrators (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES AllUsers(username),
);

CREATE TABLE Participants (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	roll_no VARCHAR(40) NOT NULL,
	FOREIGN KEY (username) REFERENCES AllUsers(username),
);

--CREATE TABLE StudentBodies (
--	studentBodyID INT PRIMARY KEY,
--);

--CREATE TABLE StudentExecutives (
--	username VARCHAR(40) PRIMARY KEY NOT NULL,
--	assignedevent VARCHAR(40) NOT NULL,
--	batch INT NOT NULL, --can be 19, 20, 21, 22 etc.
--	studentRole VARCHAR(40) NOT NULL,
--	studentBodyID INT, -- Add a foreign key reference to the StudentBodies table
--    FOREIGN KEY (username) REFERENCES AllUsers(username),
--    FOREIGN KEY (studentBodyID) REFERENCES StudentBodies(studentBodyID)
--);
CREATE TABLE StudentExecutives (
    username VARCHAR(40) PRIMARY KEY,
    studentRole VARCHAR(40),
    studentBodyID INT, -- Foreign key reference to StudentBodies table
    FOREIGN KEY (studentBodyID) REFERENCES StudentBodies(studentBodyID)
);
CREATE TABLE StudentBodies (
    studentBodyID INT PRIMARY KEY,
    categoryName VARCHAR(40),
	FOREIGN KEY (categoryName) REFERENCES Categories(categoryName),
);
CREATE TABLE StudentBodyMembers (
    studentBodyID INT,
    username VARCHAR(40),
    studentRole VARCHAR(40), -- Role within the student body (e.g., President, Vice President, Secretary, Member)
    FOREIGN KEY (studentBodyID) REFERENCES StudentBodies(studentBodyID),
    FOREIGN KEY (username) REFERENCES StudentExecutives(username)
);
CREATE TABLE Events (
    eventID INT PRIMARY KEY,
    eventName VARCHAR(100) UNIQUE,
    date DATE NOT NULL,
    timing TIME NOT NULL,
    venue VARCHAR(100) NOT NULL,
    headUsername VARCHAR(40), -- Username of the head of the event
	mentorUsername VARCHAR(40),
    categoryName VARCHAR(40), -- Foreign key reference to Categories table
    FOREIGN KEY (headUsername) REFERENCES StudentExecutives(username),
    FOREIGN KEY (categoryName) REFERENCES Categories(categoryName),
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


CREATE TABLE FacultyMentors (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES AllUsers(username),

);

CREATE TABLE Sponsors (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	company VARCHAR(40) NOT NULL,
	cnic VARCHAR(13) NOT NULL,
	category VARCHAR(40) NOT NULL,
	package VARCHAR(10) NOT NULL,
	FOREIGN KEY (username) REFERENCES AllUsers(username),
	FOREIGN KEY (category) REFERENCES Categories(categoryname),
);

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

SELECT * FROM AllUsers ORDER BY userID;
SELECT * FROM Administrators;
SELECT * FROM Participants;
SELECT * FROM FacultyMentors;
SELECT * FROM Sponsors;
SELECT * FROM StudentExecutives;
SELECT * FROM StudentBodies;
SELECT * FROM StudentBodyMembers;
SELECT * FROM Categories;
SELECT * FROM Events;


-- Insert into Admin before doing anything.
INSERT AllUsers (username, fullname, password, email, phone, userRole) VALUES ('Admin1', 'Amir Rehman', 'amirAdmin123', 'amir@nu.edu.pk', '0123789456', 1);
INSERT Administrators (username) VALUES ('Admin1');

-- INSERT AllUsers (username, fullname, password, email, phone) VALUES ();