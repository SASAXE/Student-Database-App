@echo off
echo === Phase 5 Course Management Test ===
echo.
echo This will test ALL course operations:
echo 1. Add courses
echo 2. View all courses
echo 3. Search by ID
echo 4. Search by term
echo 5. Update course
echo 6. Delete course (with confirmation)
echo.

(
echo 2
echo 1
echo Introduction to Programming
echo Learn the fundamentals of programming using Java, including variables, loops, and functions.
echo 1
echo Database Systems
echo Comprehensive introduction to database design, SQL, and database management systems.
echo 1
echo Web Development
echo Full-stack web development covering HTML, CSS, JavaScript, and modern web frameworks.
echo 2
echo 3
echo 1
echo 1
echo 3
echo 2
echo Java
echo 4
echo 2
echo Database Systems Advanced
echo Advanced topics in database systems including indexing, transactions, and optimization.
echo 5
echo 3
echo yes
echo 2
echo 6
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === Phase 5 Test Completed ===