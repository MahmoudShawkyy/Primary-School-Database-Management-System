-- Creating Semesters Table
CREATE TABLE Semesters (
    SemesterNumber INT PRIMARY KEY,
    Status VARCHAR(50) NOT NULL
);

-- Creating Classes Table
CREATE TABLE Classes (
    ClassNumber INT PRIMARY KEY,
    SemesterNumber INT NOT NULL,
    FOREIGN KEY (SemesterNumber) REFERENCES Semesters(SemesterNumber)
);

-- Creating Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    ClassNumber INT NOT NULL
    FOREIGN KEY (ClassNumber) REFERENCES Classes(ClassNumber)
);

-- Creating Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    SemesterNumber INT NOT NULL,
    FOREIGN KEY (SemesterNumber) REFERENCES Semesters(SemesterNumber)
);

-- Creating Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(50) NOT NULL UNIQUE,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Creating Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    Date DATE NOT NULL,
    ClassNumber INT NOT NULL,
    FOREIGN KEY (ClassNumber) REFERENCES Classes(ClassNumber)
);

-- Creating AttendanceStatus Table
CREATE TABLE AttendanceStatus (
    StudentID INT NOT NULL,
    AttendanceID INT NOT NULL,
    Status VARCHAR(50) NOT NULL,
    PRIMARY KEY (StudentID, AttendanceID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (AttendanceID) REFERENCES Attendance(AttendanceID)
);

-- Creating Exams Table
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Creating Grades Table
CREATE TABLE Grades (
    StudentID INT NOT NULL,
    ExamID INT NOT NULL,
    Grade INT NOT NULL,
    PRIMARY KEY (StudentID, ExamID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);
