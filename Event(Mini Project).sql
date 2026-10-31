CREATE DATABASE IF NOT EXISTS event_managementxxdb;
USE event_managementxxdb;

-- Admin users table for login authentication
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL
);

INSERT IGNORE INTO users (username, password) VALUES ('admin', 'admin123');

-- Attendees table (attendee_id is manually entered by the user)
CREATE TABLE IF NOT EXISTS attendees (
    attendee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    event_name VARCHAR(100) NOT NULL,
    ticket_type VARCHAR(50) NOT NULL
);

-- Sample initial record with manual ID 101
INSERT INTO attendees (attendee_id, name, email, phone, event_name, ticket_type) 
VALUES (101, 'Ananya Sharma', 'ananya@example.com', '9876543210', 'Tech Symposium 2026', 'General');

select *FROM event_managementxxdb;
