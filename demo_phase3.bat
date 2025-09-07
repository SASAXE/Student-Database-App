@echo off
echo === Phase 3 Complete Demo ===
echo.
echo This demo will:
echo 1. Add multiple students
echo 2. Show all students in a formatted table  
echo 3. Demonstrate duplicate email handling
echo.

(
echo 1
echo 1
echo Alice Johnson
echo alice.johnson@university.edu
echo 555-0101
echo 1
echo Bob Smith
echo bob.smith@college.edu
echo 555-0102
echo 1
echo Carol Davis
echo carol.davis@school.edu
echo 555-0103
echo 1
echo David Wilson
echo alice.johnson@university.edu
echo 555-0104
echo 2
echo 6
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === Demo Completed ===
echo Phase 3 implementation includes:
echo ? Student class with validation
echo ? StudentDAO with full CRUD operations  
echo ? Add Student with input validation
echo ? View All Students with formatted table
echo ? Duplicate email prevention
echo ? Professional error handling