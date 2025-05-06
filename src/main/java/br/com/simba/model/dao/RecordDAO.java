//package br.com.simba.model.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import br.com.simba.model.entities.Record;
//
//public class RecordDAO {
//    private Connection conn;
//
//    public RecordDAO() {
//        SupabaseConnection supabaseConnection = new SupabaseConnection();
//        conn = supabaseConnection.openConnection();
//    }
//
//    public int insert(Record record) {
//        String sql = "INSERT INTO records (barrier_specification, resolution_suggestion, location, barrier_status, barrier_criticality, barrier_type, barrier_identification_date, school_id, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING id";
//
//        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
//            stmt.setString(1, record.getBarrierSpecification());
//            stmt.setString(2, record.getResolutionSuggestion());
//            stmt.setString(3, record.getLocation());
//            stmt.setString(4, record.getStatus().toString());
//            stmt.setString(5, record.getCriticality().toString());
//            stmt.setString(6, record.getBarrierType().toString());
//
//
//            stmt.setDate(7, java.sql.Date.valueOf(record.getBarrierIdentification()));
//            stmt.setInt(8, record.getSchool().getId());
//            stmt.setInt(9, record.getUserId());
//
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                int generatedId = rs.getInt("id");
//                record.setId(generatedId);
//                return generatedId;
//            }
//            int affectedRows = stmt.executeUpdate();
//            if (affectedRows == 0) {
//                throw new SQLException("Inserting record failed, no rows affected.");
//            }
//
//        }catch (SQLException e) {
//            System.out.println("Error inserting record: " + e.getMessage());
//        }
//        return 0;
//    }
//
//    public void update(Record record) {
//        String sql = "UPDATE records SET location = ?, barrier_criticality = ?, barrier_status = ?, barrier_type = ?, resolution_suggestion = ?, barrier_specification = ? WHERE id = ?";
//
//        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
//            pstmt.setString(1, record.getLocation());
//            pstmt.setString(2, record.getCriticality().toString());
//            pstmt.setString(3, record.getStatus().toString());
//            pstmt.setString(4, record.getBarrierType().toString());
//            pstmt.setString(5, record.getResolutionSuggestion());
//            pstmt.setString(6, record.getBarrierSpecification());
//            pstmt.setInt(7, record.getId());
//            int affectedRows = pstmt.executeUpdate();
//            if (affectedRows == 0) {
//                throw new SQLException("Updating record failed, no rows affected.");
//            }
//        } catch (SQLException e) {
//            System.out.println("Error updating record: " + e.getMessage());
//        }
//    }
//
//    public void delete(int id) {
//        String sql = "DELETE FROM records WHERE id = ?";
//
//        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
//            pstmt.setInt(1, id);
//            int affectedRows = pstmt.executeUpdate();
//            if (affectedRows == 0) {
//                throw new SQLException("Deleting record failed, no rows affected.");
//            }
//        } catch (SQLException e) {
//            System.out.println("Error deleting record: " + e.getMessage());
//        }
//    }
//
//    public Record select(int id) {
//        String sql = "SELECT * FROM records WHERE id = ?";
//
//        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
//            pstmt.setInt(1, id);
//            ResultSet rs = pstmt.executeQuery();
//            if (rs.next()) {
//
//                record.setId(rs.getInt("id"));
//                record.setLocation(rs.getString("location"));
//                record.setCriticality(rs.getString("criticality"));
//                record.setStatus(rs.getString("status"));
//                record.setBarrierType(rs.getInt("barrier_type"));
//                record.setDescription(rs.getString("description"));
//                record.setResolutionDifficult(rs.getString("resolution_difficulty"));
//                record.setResolutionSuggestion(rs.getString("resolution_suggestion"));
//            }
//        } catch (SQLException e) {
//            System.out.println("Error getting record by ID: " + e.getMessage());
//        }
//        return record;
//    }
//}
