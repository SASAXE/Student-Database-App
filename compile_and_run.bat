@echo off
echo === Student Management System - Compile and Run ===

echo.
echo Step 1: Compiling Java files...
javac -cp "lib/*;." -d out src/main/java/com/studentmanagement/*.java src/test/java/*.java

if %errorlevel% neq 0 (
    echo Compilation failed! Make sure MySQL JDBC driver is in lib/ directory.
    echo Download from: https://dev.mysql.com/downloads/connector/j/
    pause
    exit /b 1
)

echo Compilation successful!

echo.
echo Step 2: Available options:
echo 1. Run Database Test
echo 2. Run Main Application
echo 3. Exit

set /p choice="Choose option (1-3): "

if "%choice%"=="1" (
    echo.
    echo Running Database Test...
    java -cp "lib/*;out;src/main/resources" DatabaseTest
) else if "%choice%"=="2" (
    echo.
    echo Running Main Application...
    java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main
) else (
    echo Exiting...
    exit /b 0
)

pause