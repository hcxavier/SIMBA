package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.School;
import br.com.simba.model.valueobject.*;

public class SchoolDAO {
    private Connection conn;

    public SchoolDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public int createNewSchool(School school) {
        String sql = "INSERT INTO schools (school_name, street, address_number, neighborhood, city, state_abbr, phone) VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING id";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, school.getName());
            stmt.setString(2, school.getAddress().getStreet());
            stmt.setInt(3, school.getAddress().getNumber());
            stmt.setString(4, school.getAddress().getNeighborhood());
            stmt.setString(5, school.getAddress().getCity());
            stmt.setString(6, school.getAddress().getStateAbbr());
            stmt.setString(7, school.getPhone().toString());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting school: " + e.getMessage());
        }
        return 0;
    }

    public int update(School school) {
        String sql = "UPDATE schools SET school_name = ?, street = ?, address_number = ?, neighborhood = ?, city = ?, state_abbr = ?, phone = ? WHERE id = ? Returning id";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, school.getName());
            stmt.setString(2, school.getAddress().getStreet());
            stmt.setInt(3, school.getAddress().getNumber());
            stmt.setString(4, school.getAddress().getNeighborhood());
            stmt.setString(5, school.getAddress().getCity());
            stmt.setString(6, school.getAddress().getStateAbbr());
            stmt.setString(7, school.getPhone().toString());
            stmt.setInt(8, school.getId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }


        } catch (SQLException e) {
            System.out.println("Error updating school: " + e.getMessage());
        }
        return 0;
    }

    public void delete(int id) {
        String sql = "DELETE FROM schools WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Deleting school failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error deleting school: " + e.getMessage());
        }
    }

    public School select(String name) {
        String sql = "SELECT * FROM schools WHERE school_name = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String street = rs.getString("street");
                int number = rs.getInt("address_number");
                String neighborhood = rs.getString("neighborhood");
                String city = rs.getString("city");
                String stateAbbr = rs.getString("state_abbr");
                String phone = rs.getString("phone");

                return new School(name, street, number, neighborhood, city, stateAbbr, new Phone(phone));
            }
        } catch (SQLException e) {
            System.out.println("Error selecting school: " + e.getMessage());
        }
        return null;
    }

}
