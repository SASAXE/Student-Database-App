@echo off
echo === Phase 6 Student-Course Relationships Test ===
echo.
echo This will test ALL student-course relationship operations:
echo 1. Setup: Add test students and courses
echo 2. Assign students to courses
echo 3. View students in a course
echo 4. View courses for a student
echo 5. Remove student from course
echo.

echo Setting up test data...

REM Add test students
(
echo 1
echo 1
echo Alice Johnson
echo alice@university.edu
echo 555-1001
echo 1
echo Bob Wilson
echo bob@university.edu
echo 555-1002
echo 6
echo 2
echo 1
echo Computer Science 101
echo Introduction to programming concepts and problem solving
echo 1
echo Mathematics 101  
echo Calculus and linear algebra fundamentals
echo 6
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main >temp_setup.txt 2>&1

echo Test data created. Running relationship tests...
echo.

(
echo 3
echo 1
echo 1
echo 1
echo yes
echo 1
echo 1
echo 2
echo yes
echo 1
echo 2
echo 1
echo yes
echo 2
echo 1
echo 3
echo 1
echo 4
echo 1
echo 2
echo yes
echo 5
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

del temp_setup.txt >nul 2>&1

echo.
echo === Phase 6 Test Completed ===