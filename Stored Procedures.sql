-- To Add New Student
CREATE PROCEDURE AddStudent
    @StudentID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Age INT,
    @ClassNumber INT
AS
BEGIN
        INSERT INTO Students (FirstName, LastName, Age, ClassNumber)
        VALUES (@FirstName, @LastName, @Age, @ClassNumber);
END;
GO

-- To Update Student Data
CREATE PROCEDURE UpdateStudent
    @StudentID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Age INT,
    @ClassNumber INT
AS
BEGIN
UPDATE Students
        SET FirstName = @FirstName,
            LastName = @LastName,
            Age = @Age,
            ClassNumber = @ClassNumber
        WHERE StudentID = @StudentID;
END;
GO

-- To Add New Instructor
CREATE PROCEDURE AddInstructor
    @InstructorID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @PhoneNumber NVARCHAR(15),
    @Email VARCHAR(100),
    @CourseID INT
AS
BEGIN
        INSERT INTO Instructors (FirstName, LastName, PhoneNumber, Email, CourseID)
        VALUES (@FirstName, @LastName, @PhoneNumber, @Email, @CourseID);
END;
GO

-- To Update Instructor Data
CREATE PROCEDURE UpdateInstructor
    @InstructorID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @PhoneNumber NVARCHAR(15),
    @Email VARCHAR(100),
    @CourseID INT
AS
BEGIN
        UPDATE Instructors
        SET FirstName = @FirstName,
            LastName = @LastName,
            PhoneNumber = @PhoneNumber,
            Email = @Email,
            CourseID = @CourseID
        WHERE InstructorID = @InstructorID;
END;
GO

-- To Delete Instructors
CREATE PROCEDURE DeleteInstructor
    @InstructorID INT
AS
BEGIN
    DELETE FROM Instructors
    WHERE InstructorID = @InstructorID;
END;
GO

-- To Search for Instructors
CREATE PROCEDURE GetInstructor
    @InstructorID INT
AS
BEGIN
    SELECT * 
    FROM Instructors
    WHERE InstructorID = @InstructorID;
END;
GO

-- To Record Attendance
CREATE PROCEDURE RecordAttendance
    @ClassNumber INT,
    @AttendanceDate DATE,
    @DefaultStatus VARCHAR(50) = 'Absent'
AS
BEGIN

    INSERT INTO AttendanceStatus (StudentID, AttendanceID, Status)
    SELECT 
        S.StudentID,
        A.AttendanceID,
        @DefaultStatus
    FROM 
        Students S
    INNER JOIN 
        Attendance A ON A.ClassNumber = @ClassNumber
    WHERE 
        A.Date = @AttendanceDate;
END;
GO

-- To Get Attendance
CREATE PROCEDURE GetAttendanceRecords
    @AttendanceDate DATE,  
    @ClassNumber INT,     
    @CourseID INT  
AS
BEGIN
    SELECT 
        A.AttendanceID,
        S.StudentID,
        A.Status,
		A.Date
    FROM 
        Attendance A
    INNER JOIN 
        Students S ON A.StudentID = S.StudentID
    INNER JOIN 
        Classes CL ON A.ClassID = CL.ClassID
    INNER JOIN 
        Courses C ON A.CourseID = C.CourseID
    WHERE 
        A.AttendanceDate = @AttendanceDate
        AND CL.ClassNumber = @ClassNumber
        AND C.CourseID = @CourseID
    ORDER BY 
        S.LastName, S.FirstName;
END;
GO
