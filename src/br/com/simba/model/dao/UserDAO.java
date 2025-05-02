package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.simba.model.entities.User;
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
        String sql = "INSERT INTO \"User\" (username, name, street, number, neighborhood, city, state_abbr, cep, email, phone, password) VALUES (?,?,?,?,?,?,?,?,?,?,?);";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername().toString());
            stmt.setString(2, user.getName().toString());
            stmt.setString(3, user.getAddress().getStreet());
            stmt.setInt(4, user.getAddress().getNumber());
            stmt.setString(5, user.getAddress().getNeighborhood());
            stmt.setString(6, user.getAddress().getCity());
            stmt.setString(7, user.getAddress().getStateAbbr());
            stmt.setString(8, user.getAddress().getCep());
            stmt.setString(9, user.getEmail().toString());
            stmt.setString(10, user.getPhone().toString());
            stmt.setString(11, user.getPassword().toString());
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
        String sql = "UPDATE \"User\" SET name = ?, street = ?, number = ?, neighborhood = ?, city = ?, state_abbr = ?, cep = ?, email = ?, phone = ? WHERE username = ?;";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName().toString());
            stmt.setString(2, user.getAddress().getStreet());
            stmt.setInt(3, user.getAddress().getNumber());
            stmt.setString(4, user.getAddress().getNeighborhood());
            stmt.setString(5, user.getAddress().getCity());
            stmt.setString(6, user.getAddress().getStateAbbr());
            stmt.setString(7, user.getAddress().getCep());
            stmt.setString(8, user.getEmail().toString());
            stmt.setString(9, user.getPhone().toString());
            stmt.setString(10, user.getUsername().toString());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating user failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating user");
            e.printStackTrace();
        }
    }

    public void deleteByUsername(Username username) {
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

    public User findByUsername(Username username) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return null;
        }
        String sql = "SELECT * FROM \"User\" WHERE username = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username.toString());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
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

                    return new User(username.toString(), name, street, number, neighborhood, city, stateAbbr, cep, email, phone, phone);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error selecting user");
            e.printStackTrace();
        }
        return null;
    }

    public List<Record> getRecordsByUsername(Username username) {
        if (conn == null) {
            System.out.println("Error: Connection is null");
            return null;
        }
        String sql = "SELECT * FROM \"Record\" WHERE username = ?;";
        List<Record> records = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username.toString());
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String recordData = rs.getString("record_data");
                    records.add(new Record(id, recordData));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error selecting records");
            e.printStackTrace();
        }
        return records;
    }

}
