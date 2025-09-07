@echo off
echo === Phase 7 Enhanced UI Demo ===
echo.
echo This demo showcases the enhanced user interface:
echo ? Beautiful box-drawing characters
echo ? Emoji icons for better visual appeal
echo ? System statistics integration
echo ? Enhanced error handling and feedback
echo ? Professional welcome message
echo.

echo === PART 1: Welcome Screen and Main Menu ===
(
echo 4
echo.
echo 5
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === PART 2: Enhanced Sub-Menus ===
echo Showing enhanced student menu:
(
echo 1
echo 6
echo 2
echo 6
echo 3
echo 6
echo 5
) | java -cp "lib/*;out;src/main/resources" com.studentmanagement.Main

echo.
echo === Demo Complete ===
echo ? Professional UI with box drawing characters
echo ? System statistics displayed in main menu
echo ? Enhanced sub-menus with counts and icons
echo ? Better error handling and user feedback
echo ? Improved success and warning messages