-- ===========================================
-- Day 1 : MySQL Basics
-- Topics: CREATE DATABASE, USE, CREATE TABLE,
-- INSERT, SELECT, WHERE, ORDER BY,
-- COUNT, UPDATE, DELETE, DESC
-- ===========================================

-- Create a database
CREATE DATABASE IF NOT EXISTS LinkedIn;

-- Select the database
USE LinkedIn;

-- Create Users table
CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Display table structure
DESC Users;

-- Insert multiple records
INSERT INTO Users (first_name, last_name, email, password)
VALUES
('Gajanand', 'Immannavar', 'student@gmail.com', 'Student@123'),
('Harshitha', 'Kumar', 'harshi@gmail.com', 'Harshi@123'),
('Rahul', 'Sharma', 'rahul@gmail.com', 'Rahul@123');

-- Display all records
SELECT * FROM Users;

-- Display selected columns
SELECT first_name, last_name
FROM Users;

-- Find a user by name
SELECT *
FROM Users
WHERE first_name = 'Gajanand';

-- Find Gmail users
SELECT *
FROM Users
WHERE email LIKE '%gmail.com';

-- Sort users by first name
SELECT *
FROM Users
ORDER BY first_name ASC;

-- Count total users
SELECT COUNT(*) AS Total_Users
FROM Users;

-- Update a user's password
UPDATE Users
SET password = 'NewPassword123'
WHERE user_id = 1;

-- Delete a specific user
DELETE FROM Users
WHERE user_id = 3;

-- Display updated records
SELECT * FROM Users;