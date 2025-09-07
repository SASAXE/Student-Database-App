@echo off
echo === Student Management System ===

if not exist "out\com\studentmanagement\Main.class" (
    echo Compiling...
    javac -cp "lib/*;." -d out src/main/java/com/studentmanagement/*.java
    if %errorlevel% neq 0 (
        echo Compilation failed!
        pause
        exit /b 1
    )
)

echo Starting application...
java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

pause