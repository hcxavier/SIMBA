package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.Record;

public class RecordDAO {
    private Connection conn;

    public RecordDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public void insert(Record record) {
        String sql = "INSERT INTO Record (location, criticality, status, barrier_type, description, resolution_difficulty, resolution_suggestion, barrier_identification, school_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, record.getLocation());
            pstmt.setString(2, record.getCriticality().toString());
            pstmt.setString(3, record.getStatus().toString());
            pstmt.setInt(4, record.getBarrierType().getId());
            pstmt.setString(5, record.getDescription());
            pstmt.setString(6, record.getResolutionDifficult());
            pstmt.setString(7, record.getResolutionSuggestion());
            pstmt.setDate(8, java.sql.Date.valueOf(record.getBarrierIdentification()));
            pstmt.setInt(9, record.getSchool().getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting record failed, no rows affected.");
            }
        
        }catch (SQLException e) {
            System.out.println("Error inserting record: " + e.getMessage());
        }
    }

    public void update(Record record) {
        String sql = "UPDATE Record SET location = ?, criticality = ?, status = ?, barrier_type = ?, description = ?, resolution_difficulty = ?, resolution_suggestion = ? WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, record.getLocation());
            pstmt.setString(2, record.getCriticality().toString());
            pstmt.setString(3, record.getStatus().toString());
            pstmt.setInt(4, record.getBarrierType().getId());
            pstmt.setString(5, record.getDescription());
            pstmt.setString(6, record.getResolutionDifficult());
            pstmt.setString(7, record.getResolutionSuggestion());
            pstmt.setInt(8, record.getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating record failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating record: " + e.getMessage());
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM Record WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Deleting record failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error deleting record: " + e.getMessage());
        }
    }

    public Record select(int id) {
        String sql = "SELECT * FROM Record WHERE id = ?";
        Record record = null;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                record = new Record();
                record.setId(rs.getInt("id"));
                record.setLocation(rs.getString("location"));
                record.setCriticality(rs.getString("criticality"));
                record.setStatus(rs.getString("status"));
                record.setBarrierType(rs.getInt("barrier_type"));
                record.setDescription(rs.getString("description"));
                record.setResolutionDifficult(rs.getString("resolution_difficulty"));
                record.setResolutionSuggestion(rs.getString("resolution_suggestion"));
            }
        } catch (SQLException e) {
            System.out.println("Error getting record by ID: " + e.getMessage());
        }
        return record;
    }
}
