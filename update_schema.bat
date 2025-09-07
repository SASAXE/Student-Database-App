@echo off
echo === Updating Database Schema ===
echo.
echo Adding timestamp columns to existing tables...
echo.

(
echo ALTER TABLE students ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
echo ALTER TABLE students ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
echo SELECT 'Schema updated successfully' as result;
echo exit
) | mysql -u root -pSASAKAWA12@a student_management_db

echo.
echo Schema update completed!