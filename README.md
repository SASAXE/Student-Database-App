# Student Database Management System

A console-based Java application that allows you to manage student information using JDBC and MySQL database.

## Features

- **Add Students**: Create new student records with name, age, and email
- **View All Students**: Display all students in a formatted table
- **Update Students**: Modify existing student information
- **Delete Students**: Remove student records with confirmation
- **Data Validation**: Prevents duplicate emails and validates input
- **Safe Database Operations**: Uses PreparedStatement to prevent SQL injection

## Prerequisites

Before running this application, make sure you have:

- **Java Development Kit (JDK)** 8 or higher
- **MySQL Server** installed and running
- **MySQL Connector/J** (JDBC Driver) - version 8.0 or higher

## Installation

### 1. Clone the Repository

### 2. Download MySQL Connector

- Download MySQL Connector/J from: https://dev.mysql.com/downloads/connector/j/
- Place the `.jar` file in the project directory
- Update the jar filename in the compile/run commands if different

### 3. Set Up MySQL Database

Connect to MySQL and create the database:

```sql
mysql -u root -p
CREATE DATABASE testdb;
EXIT;
```

### 4. Configure Database Connection

Open `StudentDatabaseApp.java` and update the database credentials:

```java
private static final String URL = "jdbc:mysql://localhost:3306/testdb";
private static final String USERNAME = "root";
private static final String PASSWORD = "your_mysql_password"; // Change this
```

## Quick Start

```bash
# Compile & Run (Windows)
javac -cp ".;mysql-connector-j-9.4.0.jar" StudentDatabaseApp.java
java -cp ".;mysql-connector-j-9.4.0.jar" StudentDatabaseApp

# Compile & Run (Mac/Linux)  
javac -cp ".:mysql-connector-j-9.4.0.jar" StudentDatabaseApp.java
java -cp ".:mysql-connector-j-9.4.0.jar" StudentDatabaseApp
```

## Usage

When you run the program, you'll see a menu with these options:

```
STUDENT DATABASE MANAGEMENT SYSTEM
=====================================
1. Add New Student
2. View All Students
3. Update Student
4. Delete Student
5. Exit
```

### Example Operations

**Adding a Student:**
1. Choose option 1
2. Enter student name: `Emi Wang`
3. Enter age: `22`
4. Enter email: `emi@example.com`

**Viewing Students:**
- Choose option 2 to see all students in a formatted table

**Updating a Student:**
1. Choose option 3
2. Enter the student ID you want to update
3. Enter new information

**Deleting a Student:**
1. Choose option 4
2. Enter the student ID to delete
3. Confirm the deletion

## Project Structure

```
student-database-app/
│
├── StudentDatabaseApp.java    # Main application file
├── mysql-connector-j-9.4.0.jar   # MySQL JDBC Driver
└── README.md                  # This file
```

## Database Schema

The application automatically creates a `students` table with the following structure:

| Column | Type | Constraints |
|--------|------|-------------|
| id | INT | PRIMARY KEY, AUTO_INCREMENT |
| name | VARCHAR(100) | NOT NULL |
| age | INT | NOT NULL |
| email | VARCHAR(100) | UNIQUE, NOT NULL |

## Technologies Used

- **Java** - Core programming language
- **JDBC** - Database connectivity
- **MySQL** - Database management system
- **PreparedStatement** - Safe SQL execution
- **Scanner** - User input handling

## Error Handling

The application includes comprehensive error handling for:

- Database connection failures
- Invalid user input
- Duplicate email entries
- Student not found scenarios
- SQL execution errors

## Common Troubleshooting

**"Driver not found" Error:**
- Make sure the MySQL Connector JAR file is in the same directory
- Check that the JAR filename matches the one in your compile command

**"Access Denied" Error:**
- Verify your MySQL username and password in the code
- Ensure MySQL server is running

**"Database does not exist" Error:**
- Create the `testdb` database using the SQL command provided above

**Compilation Errors:**
- Ensure you have JDK installed (not just JRE)
- Check that your JAVA_HOME environment variable is set correctly

## Future Enhancements

Potential improvements for this project:
- Add search functionality
- Implement data export/import features
- Create a graphical user interface (GUI)
- Add more student fields (phone, address, course, etc.)
- Implement user authentication
- Add data backup and restore functionality

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## License

This project is open source.

## Author

**Sasanka Hemakumara**
 - Email: 2022s19400@stu.cmb.ac.lk

## Acknowledgments

- Built as part of Advanced Programming Techniques coursework
- Uses JDBC best practices for database connectivity
- Implements CRUD operations following standard design patterns

---

**Note:** This is a learning project demonstrating fundamental database programming concepts with Java and MySQL.
