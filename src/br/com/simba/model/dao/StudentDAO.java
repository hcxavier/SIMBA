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
        userDAO.insert(student);

        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }

        String sql = "INSERT INTO Student (username, registration_number) VALUES (?, ?);";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, student.getUsername().toString());
            stmt.setString(2, student.getRegistrationNumber());
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

    public void deleteStudent(Username username) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        userDAO.delete(username);
    }

    public void updatePassword(String password, Student student) {
        String updateUserSql = "UPDATE \"User\" SET password = ? WHERE username = ?";

        try (PreparedStatement stmt = conn.prepareStatement(updateUserSql);) {
            stmt.setString(1, password);
            stmt.setString(2, student.getUsername().toString());
            stmt.executeUpdate();

            System.out.println("Student updated successfully!");
        } catch (SQLException e) {
            System.out.println("Error updating student");
            e.printStackTrace();
        }
    }

    public Student findByUsername(String username) {
        String sql = "SELECT * FROM \"User\" join Student on \"User\".username = Student.username WHERE \"User\".username = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String street = rs.getString("street");
                int number = rs.getInt("number");
                String neighborhood = rs.getString("neighborhood");
                String city = rs.getString("city");
                String stateAbbr = rs.getString("state_abbr");
                String cep = rs.getString("cep");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String password = rs.getString("password");
                String registrationNumber = rs.getString("registration_number");

                return new Student(id, username, name, street, number, neighborhood, city, stateAbbr, cep, new Email(email), new Phone(phone), new Password(password), registrationNumber);
            }
        } catch (SQLException e) {
            System.out.println("Error selecting student");
            e.printStackTrace();
        }
        return null;
    }
}
