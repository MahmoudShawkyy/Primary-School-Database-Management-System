# Primary-School-Database-Management-System

## Project Overview
The School Management System is a database-driven application designed to manage essential school operations, such as student and instructor records, class assignments, attendance tracking, and grading. The database schema and stored procedures are designed to ensure data integrity, scalability, and performance.

## Features

### Student Management :-

Add and update student records.

Assign students to specific classes.

### Instructor Management :-

Add and update instructor records.

Assign instructors to specific courses.

### Attendance Management :-

Record attendance for all students in a specific class on a specific date.

Retrieve attendance records by date, class, and course.

### Course and Class Management :-

Maintain class and course data, linking them to semesters and instructors.

### Grading System :-

Track exams and grades for students.

## Database Schema

### Key Entities -:

#### Students -:

Stores student details (e.g., Name, Age, Class Number).

Linked to Classes for class-specific operations.

#### Instructors -:

Stores instructor details (e.g., Name, Contact Information, Courses).

#### Classes -:

Represents distinct classes, each linked to a semester.

#### Courses -:

Maintains course details and links them to instructors and semesters.

#### Attendance -:

Tracks attendance records for students in specific classes.

#### AttendanceStatus -:

Provides detailed attendance status (e.g., Present, Absent, Late).

#### Exams -:

Tracks exams linked to courses.

#### Grades -:

Stores grades for students in specific exams.

## Stored Procedures


### 1. Student Management -:

AddStudent: Adds a new student to the database.

UpdateStudent: Updates an existing student's details.

### 2. Instructor Management :-

AddInstructor: Adds a new instructor to the database.

UpdateInstructor: Updates an existing instructor's details.

DeleteInstructor: Deletes an instructor from the database.

GetInstructor: Retrieves details of a specific instructor.

### 3. Attendance Management ;-

RecordAttendance: Records attendance for all students in a specific class on a given date.

GetAttendanceRecords: Retrieves attendance records for a specific combination of date, class, and course.

