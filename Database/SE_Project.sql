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

CREATE TABLE Administrators (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES AllUsers(username),
);

-- Insert into Admin before doing anything.
INSERT AllUsers (username, fullname, password, email, phone, userRole) VALUES ('Admin1', 'Amir Rehman', 'amirAdmin123', 'amir@nu.edu.pk', '0123789456', 1);
INSERT Administrators (username) VALUES ('Admin1');


CREATE TABLE Participants (
	username VARCHAR(40) NOT NULL PRIMARY KEY,
	roll_no VARCHAR(40) NOT NULL,
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


-- Make All the 5 Categories first: EE, CS, Business, Social, Sports.
INSERT Categories (categoryName) VALUES ('Social');






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

DELETE FROM AllUsers WHERE username = '0presi';


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
