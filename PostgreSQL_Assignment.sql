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


-- Create courses table
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL
);

-- Create enrollment table
CREATE TABLE enrollment(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE NOT NULL,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

-- Insert sample data into the students table
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark)
VALUES
('Sameer', 21, 'sameer@example.com', 48, 60),
('Zoya', 23, 'zoya@example.com', 52, 58),
('Nabil', 22, 'nabil@example.com', 37, 46),
('Rafi', 24, 'rafi@example.com', 41, 40),
('Sophia', 22, 'sophia@example.com', 50, 52),
('Hasan', 23, 'hasan@gmail.com', 43, 39);


-- Insert sample data into the courses table
INSERT INTO courses (course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);


-- Insert sample data into the enrollment table
INSERT INTO enrollment (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);

-- Check student enrollment
SELECT students.student_id,student_name, email, course_name, credits, created_at
FROM enrollment
INNER JOIN students ON enrollment.student_id = students.student_id
INNER JOIN courses ON enrollment.course_id = courses.course_id;

-- Assignment questions started

-- Question number 01
-- Insert a new student record with the following details!
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
('MD Naim Uddin', 29, 'iamnaimuddin@yahoo.com', 100, 100, NULL);



-- Question number 02
-- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name FROM enrollment 
JOIN courses ON enrollment.course_id = courses.course_id
JOIN students ON enrollment.student_id = students.student_id
WHERE course_name = 'Next.js';