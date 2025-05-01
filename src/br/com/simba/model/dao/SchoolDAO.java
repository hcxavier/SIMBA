package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.School;

public class SchoolDAO {
    private Connection conn;

    public SchoolDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public void insert(School school) {
        String sql = "INSERT INTO school (name, street, number, neighborhood, city, state_abbr, cep, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, school.getName().toString());
            pstmt.setString(2, school.getAddress().getStreet());
            pstmt.setInt(3, school.getAddress().getNumber());
            pstmt.setString(4, school.getAddress().getNeighborhood());
            pstmt.setString(5, school.getAddress().getCity());
            pstmt.setString(6, school.getAddress().getStateAbbr());
            pstmt.setString(7, school.getAddress().getCep());
            pstmt.setString(8, school.getPhone().toString());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting school failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting school: " + e.getMessage());
        }
    }

    public void update(School school) {
        String sql = "UPDATE school SET name = ?, street = ?, number = ?, neighborhood = ?, city = ?, state_abbr = ?, cep = ?, phone = ? WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, school.getName().toString());
            pstmt.setString(2, school.getAddress().getStreet());
            pstmt.setInt(3, school.getAddress().getNumber());
            pstmt.setString(4, school.getAddress().getNeighborhood());
            pstmt.setString(5, school.getAddress().getCity());
            pstmt.setString(6, school.getAddress().getStateAbbr());
            pstmt.setString(7, school.getAddress().getCep());
            pstmt.setString(8, school.getPhone().toString());
            pstmt.setInt(9, school.getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating school failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating school: " + e.getMessage());
        }
        
    }

    public void delete(int id) {
        String sql = "DELETE FROM school WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Deleting school failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error deleting school: " + e.getMessage());
        }
    }

    public School select(String name) {
        String sql = "SELECT * FROM school WHERE name = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String street = rs.getString("street");
                int number = rs.getInt("number");
                String neighborhood = rs.getString("neighborhood");
                String city = rs.getString("city");
                String stateAbbr = rs.getString("state_abbr");
                String cep = rs.getString("cep");
                String phone = rs.getString("phone");

                return new School(id, name, street, number, neighborhood, city, stateAbbr, cep, new Phone(phone));
            }
        } catch (SQLException e) {
            System.out.println("Error selecting school: " + e.getMessage());
        }
        return null;
    }

}
