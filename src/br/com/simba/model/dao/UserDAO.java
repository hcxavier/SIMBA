package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.simba.model.entities.*;
import br.com.simba.model.valueobject.Username;

public class UserDAO {
    protected Connection conn;

    public UserDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public void createNewUser(User user) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        String sql = "INSERT INTO users (full_name, street, address_number, neighborhood, city, state_abbr, email, username, hashed_password) VALUES (?,?,?,?,?,?,?,?,?);";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getAddress().getStreet());
            stmt.setInt(3, user.getAddress().getNumber());
            stmt.setString(4, user.getAddress().getNeighborhood());
            stmt.setString(5, user.getAddress().getCity());
            stmt.setString(6, user.getAddress().getStateAbbr());
            stmt.setString(7, user.getEmail().toString());
            stmt.setString(8, user.getUsername().toString());
            stmt.setString(9, user.getPassword());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting user failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting user");
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        String sql = "UPDATE users SET full_name = ?, street = ?, address_number = ?, neighborhood = ?, city = ?, state_abbr = ?, email = ? WHERE username = ?;";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getAddress().getStreet());
            stmt.setInt(3, user.getAddress().getNumber());
            stmt.setString(4, user.getAddress().getNeighborhood());
            stmt.setString(5, user.getAddress().getCity());
            stmt.setString(6, user.getAddress().getStateAbbr());
            stmt.setString(7, user.getEmail().toString());
            stmt.setString(8, user.getUsername().toString());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating user failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating user");
            e.printStackTrace();
        }
    }

    public void deleteByUsername(String username) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return;
        }
        String sql = "DELETE FROM users WHERE username = ?;";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting user");
            e.printStackTrace();
        }
    }

    public User findByUsername(String username) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return null;
        }
        String sql = "SELECT * FROM users WHERE username = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("full_name");
                    String street = rs.getString("street");
                    int number = rs.getInt("address_number");
                    String neighborhood = rs.getString("neighborhood");
                    String city = rs.getString("city");
                    String stateAbbr = rs.getString("state_abbr");
                    String email = rs.getString("email");
                    String password = rs.getString("hashed_password");
                    System.out.println("Senha recuperada do banco: " + password);

                    return new User(username, name, street, number, neighborhood, city, stateAbbr, email);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error selecting user");
            e.printStackTrace();
        }
        return null;
    }

    public List<br.com.simba.model.entities.Record> getRecordsByUserId(int id) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return null;
        }
        String sql = "SELECT * FROM records WHERE user_id = ?;";
        List<br.com.simba.model.entities.Record> records = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String barrier_specification = rs.getString("barrier_specification");
                    String resolution_suggestion = rs.getString("resolution_suggestion");
                    String location = rs.getString("location");
                    String barrier_status = rs.getString("barrier_status");
                    String barrier_criticality = rs.getString("barrier_criticality");
                    String barrier_type = rs.getString("barrier_type");
                    String barrier_identification_date = rs.getString("barrier_identification_date");

                    //records.add(new br.com.simba.model.entities.Record(barrier_status, barrier_criticality, location, barrier_specification, resolution_suggestion, barrier_type, barrier_identification_date);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error selecting records");
            e.printStackTrace();
        }
        return records;
    }

}
