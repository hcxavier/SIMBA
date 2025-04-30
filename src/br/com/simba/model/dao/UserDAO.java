package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.Username;

public class UserDAO {
    protected Connection conn;

    public UserDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public void insert(User user) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        String sql = "INSERT INTO \"User\" (username, name, address, email, phone, password) VALUES (?, ?, ?, ?, ?, ?);";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername().toString());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getAddress().toString());
            stmt.setString(4, user.getEmail().toString());
            stmt.setString(5, user.getPhone().toString());
            stmt.setString(6, user.getPassword());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("User inserted successfully!");
            } else {
                throw new RuntimeException("Unexpected error: No rows affected");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting user");
            e.printStackTrace();
        }
    }

    public void update(User user) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        String sql = "UPDATE \"User\" SET name = ?, address = ?, email = ?, phone = ?, password = ? WHERE username = ?;";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName().toString());
            stmt.setString(2, user.getAddress().toString());
            stmt.setString(3, user.getEmail().toString());
            stmt.setString(4, user.getPhone().toString());
            stmt.setString(5, user.getPassword().toString());
            stmt.setString(6, user.getUsername().toString());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating user");
            e.printStackTrace();
        }
    }

    public void delete(Username username) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        String sql = "DELETE FROM \"User\" WHERE username = ?;";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username.toString());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting user");
            e.printStackTrace();
        }
    }

    public User select(Username username) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return null;
        }
        String sql = "SELECT * FROM \"User\" WHERE username = ?;";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setObject(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            (Username) rs.getObject("username"),
                            rs.getString("name"),
                            rs.getObject("address"),
                            rs.getObject("email"),
                            rs.getObject("phone"),
                            rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error selecting user");
            e.printStackTrace();
        }
        return null;
    }

}
