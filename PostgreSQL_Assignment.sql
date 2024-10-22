-- Active: 1729184422674@@127.0.0.1@5432@postgres
-- Create university database
CREATE DATABASE university_db;


-- Create students table
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    frontend_mark INT,
    backend_mark INT,
    status VARCHAR(50)
);

