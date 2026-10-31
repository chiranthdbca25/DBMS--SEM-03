-- Create Employee table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary INT
);

-- Create Log table
CREATE TABLE Employee_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    Action_Type VARCHAR(30),
    Emp_ID INT
);

-- 1. BEFORE INSERT Trigger - Validation
DELIMITER //

CREATE TRIGGER Before_Insert_Employee
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF NEW.Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;


-- 2. AFTER INSERT Trigger
DELIMITER //

CREATE TRIGGER After_Insert_Employee
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Log(Action_Type, Emp_ID)
    VALUES ('INSERT', NEW.Emp_ID);
END //

DELIMITER ;


-- 3. BEFORE UPDATE Trigger - Validation
DELIMITER //

CREATE TRIGGER Before_Update_Employee
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;


-- 4. AFTER UPDATE Trigger
DELIMITER //

CREATE TRIGGER After_Update_Employee
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Log(Action_Type, Emp_ID)
    VALUES ('UPDATE', NEW.Emp_ID);
END //

DELIMITER ;


-- 5. BEFORE DELETE Trigger
DELIMITER //

CREATE TRIGGER Before_Delete_Employee
BEFORE DELETE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.Salary > 100000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee with salary above 100000 cannot be deleted';
    END IF;
END //

DELIMITER ;


-- 6. AFTER DELETE Trigger
DELIMITER //

CREATE TRIGGER After_Delete_Employee
AFTER DELETE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Log(Action_Type, Emp_ID)
    VALUES ('DELETE', OLD.Emp_ID);
END //

DELIMITER ;


-- Test INSERT
INSERT INTO Employee
VALUES (101, 'Rahul', 50000);

-- Test UPDATE
UPDATE Employee
SET Salary = 60000
WHERE Emp_ID = 101;

-- Test DELETE
DELETE FROM Employee
WHERE Emp_ID = 101;

-- Display log
SELECT * FROM Employee_Log;
