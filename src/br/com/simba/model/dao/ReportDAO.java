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
        String sql = "INSERT INTO report (title, report_date, observation, conclusion, record_id) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, report.getTitle());
            pstmt.setDate(2, report.getReportDate());
            pstmt.setString(3, report.getObservation());
            pstmt.setString(4, report.getConclusion());
            pstmt.setInt(5, report.getRecordId().getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting report failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting report: " + e.getMessage());
        }
    }

    public void update(Report report) {
        String sql = "update report set title = ?, report_date = ?, observation = ?, conclusion = ? where id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, report.getTitle());
            pstmt.setDate(2, report.getReportDate());
            pstmt.setString(3, report.getObservation());
            pstmt.setString(4, report.getConclusion());
            pstmt.setInt(5, report.getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating report failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating report: " + e.getMessage());
        }
        
    }

    public void delete(int id) {
        String sql = "DELETE FROM report WHERE id = ?";
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
        String sql = "SELECT * FROM report WHERE id = ?";
        Report report = null;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                report = new Report();
                report.setId(rs.getInt("id"));
                report.setTitle(rs.getString("title"));
                report.setReportDate(rs.getDate("report_date"));
                report.setObservation(rs.getString("observation"));
                report.setConclusion(rs.getString("conclusion"));
                report.setRecord(new RecordDAO().select(rs.getInt("record_id")));
            }
        } catch (SQLException e) {
            System.out.println("Error getting report by ID: " + e.getMessage());
        }

        return report;
    }
}