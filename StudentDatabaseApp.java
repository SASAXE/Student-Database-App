import java.sql.*;
import java.util.Scanner;

public class StudentDatabaseApp {
     
    private static final String URL = "jdbc:mysql://localhost:3306/testdb";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "SASAKAWA12@a";  
    
    private static Connection connection;
    private static Scanner scanner = new Scanner(System.in);
    
    public static void main(String[] args) {
        try {
 
            connectToDatabase();
            
 
            createStudentsTable();
            
 
            showMenu();
            
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        } finally {
            closeConnection();
        }
    }
    
 
    private static void connectToDatabase() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("✅ Connected to database successfully!");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL driver not found!");
        }
    }
    
 
    private static void createStudentsTable() throws SQLException {
        String sql = "CREATE TABLE IF NOT EXISTS students (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT," +
                    "name VARCHAR(100) NOT NULL," +
                    "age INT NOT NULL," +
                    "email VARCHAR(100) UNIQUE NOT NULL" +
                    ")";
        
        Statement stmt = connection.createStatement();
        stmt.executeUpdate(sql);
        System.out.println("✅ Students table ready!");
    }
    
 
    private static void showMenu() throws SQLException {
        while (true) {
            System.out.println("\n🎓 STUDENT DATABASE MANAGEMENT SYSTEM");
            System.out.println("=====================================");
            System.out.println("1. Add New Student");
            System.out.println("2. View All Students");
            System.out.println("3. Update Student");
            System.out.println("4. Delete Student");
            System.out.println("5. Exit");
            System.out.print("Choose an option (1-5): ");
            
            int choice = scanner.nextInt();
            scanner.nextLine();  
            
            switch (choice) {
                case 1:
                    addStudent();
                    break;
                case 2:
                    viewAllStudents();
                    break;
                case 3:
                    updateStudent();
                    break;
                case 4:
                    deleteStudent();
                    break;
                case 5:
                    System.out.println("👋 Goodbye!");
                    return;
                default:
                    System.out.println("❌ Invalid choice! Please try again.");
            }
        }
    }
    
 
    private static void addStudent() throws SQLException {
        System.out.println("\n➕ ADD NEW STUDENT");
        System.out.println("==================");
        
        System.out.print("Enter student name: ");
        String name = scanner.nextLine();
        
        System.out.print("Enter student age: ");
        int age = scanner.nextInt();
        scanner.nextLine();  
        
        System.out.print("Enter student email: ");
        String email = scanner.nextLine();
        
        String sql = "INSERT INTO students (name, age, email) VALUES (?, ?, ?)";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setInt(2, age);
        pstmt.setString(3, email);
        
        try {
            int rows = pstmt.executeUpdate();
            System.out.println("✅ Student added successfully! (" + rows + " record inserted)");
        } catch (SQLException e) {
            if (e.getMessage().contains("Duplicate entry")) {
                System.out.println("❌ Error: Email already exists!");
            } else {
                System.out.println("❌ Error adding student: " + e.getMessage());
            }
        }
    }
    
 
    private static void viewAllStudents() throws SQLException {
        System.out.println("\n👥 ALL STUDENTS");
        System.out.println("===============");
        
        String sql = "SELECT * FROM students ORDER BY id";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        
        if (!rs.next()) {
            System.out.println("No students found in database.");
            return;
        }
        
        System.out.printf("%-5s %-20s %-5s %-30s%n", "ID", "NAME", "AGE", "EMAIL");
        System.out.println("--------------------------------------------------------");
        
 
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int age = rs.getInt("age");
            String email = rs.getString("email");
            
            System.out.printf("%-5d %-20s %-5d %-30s%n", id, name, age, email);
        }
    }
    
 
    private static void updateStudent() throws SQLException {
        System.out.println("\n✏️ UPDATE STUDENT");
        System.out.println("=================");
        
        System.out.print("Enter student ID to update: ");
        int id = scanner.nextInt();
        scanner.nextLine();  
        
 
        if (!studentExists(id)) {
            System.out.println("❌ Student with ID " + id + " not found!");
            return;
        }
        
        System.out.print("Enter new name: ");
        String name = scanner.nextLine();
        
        System.out.print("Enter new age: ");
        int age = scanner.nextInt();
        scanner.nextLine(); 
        
        System.out.print("Enter new email: ");
        String email = scanner.nextLine();
        
        String sql = "UPDATE students SET name = ?, age = ?, email = ? WHERE id = ?";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setInt(2, age);
        pstmt.setString(3, email);
        pstmt.setInt(4, id);
        
        try {
            int rows = pstmt.executeUpdate();
            System.out.println("✅ Student updated successfully! (" + rows + " record updated)");
        } catch (SQLException e) {
            if (e.getMessage().contains("Duplicate entry")) {
                System.out.println("❌ Error: Email already exists!");
            } else {
                System.out.println("❌ Error updating student: " + e.getMessage());
            }
        }
    }
    
 
    private static void deleteStudent() throws SQLException {
        System.out.println("\n🗑️ DELETE STUDENT");
        System.out.println("=================");
        
        System.out.print("Enter student ID to delete: ");
        int id = scanner.nextInt();
        scanner.nextLine(); 
        
 
        if (!studentExists(id)) {
            System.out.println("❌ Student with ID " + id + " not found!");
            return;
        }
        
        System.out.print("Are you sure you want to delete this student? (y/n): ");
        String confirm = scanner.nextLine();
        
        if (confirm.toLowerCase().startsWith("y")) {
            String sql = "DELETE FROM students WHERE id = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            int rows = pstmt.executeUpdate();
            System.out.println("✅ Student deleted successfully! (" + rows + " record deleted)");
        } else {
            System.out.println("❌ Delete operation cancelled.");
        }
    }
    
 
    private static boolean studentExists(int id) throws SQLException {
        String sql = "SELECT COUNT(*) FROM students WHERE id = ?";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setInt(1, id);
        
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        return rs.getInt(1) > 0;
    }
    
 
    private static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("🔌 Database connection closed.");
            }
        } catch (SQLException e) {
            System.out.println("Error closing connection: " + e.getMessage());
        }
    }
}