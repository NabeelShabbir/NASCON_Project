create database NASCON_MS;

use NASCON_MS;


--drop table AllUsers;
--drop table Participants;
--drop table Sponsors;
--drop table StudentExecutives;
--drop table FacultyMentors;
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
	username VARCHAR(40) NOT NULL,
	FOREIGN KEY (username) REFERENCES AllUsers(username),
);

CREATE TABLE Participants (
	username VARCHAR(40) NOT NULL,
	FOREIGN KEY (username) REFERENCES AllUsers(username),
	
);

CREATE TABLE StudentExecutives (
	username VARCHAR(40) NOT NULL,
	studentRole VARCHAR(40),
	FOREIGN KEY (username) REFERENCES AllUsers(username),
);

CREATE TABLE FacultyMentors (
	username VARCHAR(40) NOT NULL,
	FOREIGN KEY (username) REFERENCES AllUsers(username),

);

CREATE TABLE Sponsors (
	username VARCHAR(40) NOT NULL,
	company VARCHAR(40),
	cnic VARCHAR(13),
	FOREIGN KEY (username) REFERENCES AllUsers(username),
);

-- SELECT * FROM AllUsers INNER JOIN Participants ON AllUsers.username = Participants.username WHERE AllUsers.username = 'hishhasan' AND AllUsers.password = 'hasan123';

SELECT * FROM AllUsers ORDER BY userID;
SELECT * FROM Administrators;
SELECT * FROM Sponsors;
SELECT * FROM StudentExecutives;
SELECT * FROM FacultyMentors;
SELECT * FROM Participants;


-- Insert into Admin before doing anything.
INSERT AllUsers (username, fullname, password, email, phone, userRole) VALUES ('Admin1', 'Amir Rehman', 'amirAdmin123', 'amir@nu.edu.pk', '0123789456', 1);
INSERT Administrators (username) VALUES ('Admin1');

-- INSERT AllUsers (username, fullname, password, email, phone) VALUES ();