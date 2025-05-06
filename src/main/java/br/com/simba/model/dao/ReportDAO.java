package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.Report;

public class ReportDAO {
    private Connection conn;

    public ReportDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public void insert(Report report) {
        String sql = "INSERT INTO reposts (title, report_date, observation, conclusion, record_id) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, report.getTitle());
            stmt.setDate(2, java.sql.Date.valueOf(report.getDate()));
            stmt.setString(3, report.getObservation());
            stmt.setString(4, report.getConclusion());
            stmt.setInt(5, report.getRecordId());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting report failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting report: " + e.getMessage());
        }
    }

    public void update(Report report) {
        String sql = "update report set title = ?, report_date = ?, observation = ?, conclusion = ? where id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, report.getTitle());
            stmt.setDate(2, java.sql.Date.valueOf(report.getDate()));
            stmt.setString(3, report.getObservation());
            stmt.setString(4, report.getConclusion());
            stmt.setInt(5, report.getId());
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating report failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating report: " + e.getMessage());
        }
        
    }

    public void delete(int id) {
        String sql = "DELETE FROM reports WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Deleting report failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error deleting report: " + e.getMessage());
        }
    }

    public Report select(int id) {
        String sql = "SELECT * FROM reports WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                String reportDate = rs.getString("report_date");
                String observation = rs.getString("observation");
                String conclusion = rs.getString("conclusion");

                return new Report(title, reportDate, observation, conclusion);
            }
        } catch (SQLException e) {
            System.out.println("Error getting report by ID: " + e.getMessage());
        }

        return null;
    }
}