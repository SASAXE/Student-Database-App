# Student Management System - Setup Instructions

## Phase 1 & 2 Implementation Complete

This project implements Phase 1 (Project Setup) and Phase 2 (Database Setup) from the app.md specification.

## Prerequisites

1. **Java Development Kit (JDK) 8 or higher**
2. **MySQL Server** installed and running
3. **MySQL JDBC Driver** (see step 3 below)

## Setup Steps

### 1. Database Setup
- Install MySQL Server on your system
- Start MySQL service
- Default connection uses:
  - Host: `localhost:3306`
  - Username: `root`
  - Password: `password`

### 2. Configure Database Connection
Edit `src/main/resources/database.properties` to match your MySQL setup:
```properties
db.url=jdbc:mysql://localhost:3306/student_management_db
db.username=your_username
db.password=your_password
```

### 3. Download MySQL JDBC Driver
Download MySQL Connector/J from:
- https://dev.mysql.com/downloads/connector/j/
- Or directly: https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar

Place the JAR file in the `lib/` directory.

### 4. Compile and Run

#### Windows:
```cmd
compile_and_run.bat
```

#### Linux/Mac:
```bash
# Compile
javac -cp "lib/*:." -d out src/main/java/com/studentmanagement/*.java src/test/java/*.java

# Test database connection
java -cp "lib/*:out:src/main/resources" DatabaseTest

# Run main application
java -cp "lib/*:out:src/main/resources" com.studentmanagement.Main
```

## Project Structure
```
StudentDatabaseApp/
├── src/
│   ├── main/
│   │   ├── java/com/studentmanagement/
│   │   │   ├── Main.java                 # Main application with menus
│   │   │   └── DatabaseConnection.java   # Database utility class
│   │   └── resources/
│   │       └── database.properties       # Database configuration
│   └── test/java/
│       └── DatabaseTest.java            # Database connection test
├── sql/
│   ├── create_database.sql              # Database creation script
│   ├── create_tables.sql                # Table creation script
│   └── sample_data.sql                  # Sample data for testing
├── lib/
│   └── README.txt                       # JDBC driver instructions
└── out/                                 # Compiled classes (auto-created)
```

## Features Implemented

### Phase 1: Project Setup ✅
- ✅ Java project with proper folder structure
- ✅ JDBC driver dependency setup
- ✅ Database connection configuration file
- ✅ Main class with basic menu structure

### Phase 2: Database Setup ✅
- ✅ Database connection utility class
- ✅ SQL scripts for creating tables
- ✅ Method to initialize database tables
- ✅ Database connection testing

## Database Schema

### Tables Created:
1. **students** - `id, name, email, phone, created_at, updated_at`
2. **courses** - `course_id, course_name, description, created_at, updated_at`
3. **student_courses** - `student_id, course_id, enrollment_date` (junction table)

### Features:
- Auto-increment primary keys
- Foreign key constraints
- Unique constraints on email
- Indexes for performance
- Timestamps for audit trail

## Next Steps
The system is ready for Phase 3 (Student Model and Basic Operations) implementation.

## Troubleshooting

1. **Connection Failed**: Check MySQL service is running and credentials in database.properties
2. **JDBC Driver Not Found**: Ensure mysql-connector-java-X.X.XX.jar is in lib/ directory  
3. **Permission Denied**: Check MySQL user has CREATE DATABASE and CREATE TABLE privileges