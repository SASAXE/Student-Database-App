@echo off
echo === Phase 4 Complete CRUD Test ===
echo.
echo This will test ALL student operations:
echo 1. Add a student
echo 2. Search by ID
echo 3. Search by term
echo 4. Update student
echo 5. Delete student (with confirmation)
echo 6. View all remaining students
echo.

(
echo 1
echo 1
echo Test User Phase4
echo testuser.phase4@example.com
echo 555-9999
echo 3
echo 1
echo 5
echo 3
echo 2
echo Alice
echo 4
echo 5
echo Test User Phase4 Updated
echo testuser.updated@example.com
echo 555-8888
echo 5
echo 5
echo yes
echo 2
echo 6
echo 4
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === Phase 4 Test Completed ===