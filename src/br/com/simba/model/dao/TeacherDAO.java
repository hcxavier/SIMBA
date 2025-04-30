package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.Teacher;
import br.com.simba.model.valueobject.*;

public class TeacherDAO {
    private final Connection conn;
    private final UserDAO userDAO;

    public TeacherDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
        userDAO = new UserDAO();
    }

    public void insert(Teacher teacher){
        userDAO.insert(teacher);

        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }

        String sql = "INSERT INTO Teacher (username, siape) VALUES (?, ?);";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, teacher.getUsername().toString());
            stmt.setString(2, teacher.getSiape().toString());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting teacher failed, no rows affected.");
            }
            System.out.println("Teacher inserted successfully!");
        } catch (SQLException e) {
            System.out.println("Error inserting teacher");
            e.printStackTrace();
        }
    }

    public void updatePassword(Teacher teacher) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }

        String updateUserSql = "UPDATE \"User\" SET password = ? WHERE username = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(updateUserSql)) {
            stmt.setString(1, teacher.getPassword());
            stmt.setString(2, teacher.getUsername().toString());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating teacher failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating password");
            e.printStackTrace();
        }
    }

    public void update(Teacher teacher) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        String sql = "UPDATE Teacher SET siape = ? WHERE username = ?;";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, teacher.getSiape().toString());
            stmt.setString(2, teacher.getUsername().toString());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating teacher failed, no rows affected.");
            }
            System.out.println("Teacher updated successfully!");
        } catch (SQLException e) {
            System.out.println("Error updating user");
            e.printStackTrace();
        } 
    }

    public Teacher select(String username) {
        String sql = "SELECT * FROM \"User\" join Teacher on \"User\".username = Teacher.username WHERE \"User\".username = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Username n = (Username) rs.getObject("username");
                String name = rs.getString("name");
                Address address = (Address) rs.getObject("address");
                Email email = (Email) rs.getObject("email");
                Phone phone = (Phone) rs.getObject("phone");
                String password = rs.getString("password");
                String siape = rs.getString("siape");

                return new Teacher(n, name, address, email, phone, password, siape);
            }
        } catch (SQLException e) {
            System.out.println("Error selecting teacher");
            e.printStackTrace();
        }

        return null;
    }
}
