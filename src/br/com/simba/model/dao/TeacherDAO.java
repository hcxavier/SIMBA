package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.Teacher;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.*;

public class TeacherDAO {
    private final Connection conn;
    private final UserDAO userDAO;

    public TeacherDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
        userDAO = new UserDAO();
    }

    public void createNewTeacher(Teacher teacher) {
        userDAO.createNewUser(teacher);

        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }

        String sql = "INSERT INTO teachers (user_id, siape) VALUES (?, ?);";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, teacher.getId());
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

        String updateUserSql = "UPDATE users SET hashed_password = ? WHERE username = ?";

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

    public void updateTeacher(Teacher teacher) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        String sql = "UPDATE teachers SET siape = ? WHERE user_id = ?;";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, teacher.getSiape().toString());
            stmt.setInt(2, teacher.getId());
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

    public Teacher findById(int id) {
        String sql = "SELECT * FROM users join teachers on users.id = teachers.user_id WHERE users.id = ?";

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
                String siape = rs.getString("siape");

                return new Teacher(id, new Username(username), name, street, number, neighborhood, city, stateAbbr, new Email(email), new Password(password), new Siape(siape));
            }
        } catch (SQLException e) {
            System.out.println("Error selecting teacher");
            e.printStackTrace();
        }

        return null;
    }
}
