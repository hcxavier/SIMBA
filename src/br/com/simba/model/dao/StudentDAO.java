package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.Student;
import br.com.simba.model.valueobject.Username;

public class StudentDAO {
    private final Connection conn;
    private final UserDAO userDAO;

    public StudentDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
        userDAO = new UserDAO();
    }

    public void insertNewStudent(Student student) {
        userDAO.createNewUser(student);

        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }

        String sql = "INSERT INTO students (user_id, enrollment_id) VALUES (?, ?);";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, student.getId());
            stmt.setInt(2, student.getEnrollmentId());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting teacher failed, no rows affected.");
            }
            System.out.println("Student inserted successfully!");
        } catch (SQLException e) {
            System.out.println("Error inserting student");
            e.printStackTrace();
        }
    }

    public void deleteStudent(String username) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        userDAO.deleteByUsername(username);
    }

    public void updatePassword(String password, Student student) {
        String updateUserSql = "UPDATE users SET hashed_password = ? WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(updateUserSql);) {
            stmt.setString(1, password);
            stmt.setInt(2, student.getId());
            stmt.executeUpdate();

            System.out.println("Student updated successfully!");
        } catch (SQLException e) {
            System.out.println("Error updating student");
            e.printStackTrace();
        }
    }

    public Student findById(int id) {
        String sql = "SELECT * FROM users join students on users.id = students.user_id WHERE students.user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                String name = rs.getString("full_name");
                String street = rs.getString("street");
                int number = rs.getInt("address_number");
                String neighborhood = rs.getString("neighborhood");
                String city = rs.getString("city");
                String stateAbbr = rs.getString("state_abbr");
                String email = rs.getString("email");
                String password = rs.getString("hashed_password");
                int enrollment_id = rs.getInt("enrollment_id");

                return new Student(id, username, name, street, number, neighborhood, city, stateAbbr, email, password, enrollment_id);
            }
        } catch (SQLException e) {
            System.out.println("Error selecting student");
            e.printStackTrace();
        }
        return null;
    }
}
