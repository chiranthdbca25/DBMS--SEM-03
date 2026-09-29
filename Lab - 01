CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(10),
    date_of_birth DATE,
    gender VARCHAR(10),
    department_id INT
);

INSERT INTO Student VALUES(2001, 'Aarav Sharma', 'aaravsharma@rvu.edu.in','9876543210' , '2006-11-14', 'Male', 20101);
INSERT INTO Student VALUES(2002, 'Ananya Rao', 'ananyarao@rvu.edu.in', '9123456789', '2007-02-19', 'Female', 20102);
INSERT INTO Student VALUES(2003, 'Rohan Mehta', 'rohanmehta@rvu.edu.in', '9456789123', '2007-09-23', 'Male', 20103);
INSERT INTO Student VALUES(2004, 'Priya Nair', 'priyanair@rvu.edu.in', '9789012345', '2006-12-04', 'Female', 20104);
INSERT INTO Student VALUES(2005, 'Karthik Verma', 'karthikverma@rvu.edu.in', '9345678901', '2007-04-12', 'Male', 20105);

SELECT * FROM Student;

ALTER TABLE Student
ADD address VARCHAR(200);

UPDATE Student SET address = 'Bangalore' WHERE student_id = 2001;
UPDATE Student SET address = 'Mangalore' WHERE student_id = 2002;
UPDATE Student SET address = 'Mandya' WHERE student_id = 2003;
UPDATE Student SET address = 'Raichur' WHERE student_id = 2004;
UPDATE Student SET address = 'Ramanagara' WHERE student_id = 2005;

SELECT * FROM Student;

ALTER TABLE Student
MODIFY phone VARCHAR(15);
UPDATE Student SET phone = '13456846486325' WHERE student_id = 2001;
UPDATE Student SET phone = '00586846486325' WHERE student_id = 2002;
UPDATE Student SET phone = '00586840010325' WHERE student_id = 2003;
UPDATE Student SET phone = '0011854976220' WHERE student_id = 2004;
UPDATE Student SET phone = '0056789105611' WHERE student_id = 2005;

SELECT * FROM Student;

ALTER TABLE Student
RENAME COLUMN phone TO phone_number;
SELECT * FROM Student;

ALTER TABLE Student
DROP COLUMN address;

SELECT * FROM Student;

DROP TABLE Student;
SHOW TABLES;
