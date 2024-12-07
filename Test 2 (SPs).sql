EXEC AddStudent 
    @StudentID = 4, 
    @FirstName = 'Yasser',
    @LastName = 'Mahmoud',
    @Age = 11,
    @ClassNumber = 4;


EXEC UpdateStudent 
    @StudentID = 1,
    @FirstName = 'Yossef',
    @LastName = 'Ashraf',
    @Age = 10,
    @ClassNumber = 1;

EXEC AddInstructor 
    @InstructorID = 4,
    @FirstName = 'Sayed',
    @LastName = 'Taha',
    @PhoneNumber = '01012345678',
    @Email = 'sayedtaha10@example.com',
    @CourseID = 1;


EXEC RecordAttendance 
    @ClassNumber = 4, 
    @AttendanceDate = '2024-03-01', 
    @DefaultStatus = 'Absent';


EXEC GetInstructor 
    @InstructorID = 1;


