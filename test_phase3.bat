@echo off
echo === Phase 3 Functionality Test ===
echo.
echo Testing: Add Student and View All Students
echo.
echo Input sequence:
echo 1. Go to Student Management (1)
echo 2. Add a test student (1)
echo 3. View all students (2) 
echo 4. Return to main menu (6)
echo 5. Exit (4)
echo.

echo Test Student Data:
echo Name: John Doe
echo Email: john.doe@test.com  
echo Phone: 123-456-7890
echo.

(
echo 1
echo 1
echo John Doe
echo john.doe@test.com
echo 123-456-7890
echo 2
echo 6
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === Test Completed ===