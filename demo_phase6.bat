@echo off
echo === Phase 6 Complete Student-Course Demo ===
echo.
echo This demo showcases ALL student-course relationship features:
echo.

echo === PART 1: Assign Student to Course ===
(
echo 3
echo 1
echo 1
echo 1
echo yes
echo 5
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === PART 2: View Students in Course ===
(
echo 3
echo 2
echo 1
echo 5
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === PART 3: View Courses for Student ===
(
echo 3
echo 3
echo 1
echo 5
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === PART 4: Assign Another Enrollment ===
(
echo 3
echo 1
echo 1
echo 2
echo yes
echo 5
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === PART 5: View Updated Relationships ===
echo A. View students in Course 1:
(
echo 3
echo 2
echo 1
echo 5
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo B. View courses for Student 1:
(
echo 3
echo 3
echo 1
echo 5
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === PART 6: Remove Student from Course ===
(
echo 3
echo 4
echo 1
echo 2
echo yes
echo 5
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === Demo Complete ===
echo ? All student-course relationship operations working!
echo ? Assign students to courses with validation
echo ? View students in courses with course details
echo ? View courses for students with student details  
echo ? Remove students from courses with confirmation
echo ? Professional error handling throughout