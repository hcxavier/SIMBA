package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import br.com.simba.model.entities.Report;

public class ReportDAO {
    private Connection conn;

    public ReportDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public int insert(Report report) {
        String sql = "INSERT INTO reports (title, report_date, observation, conclusion, record_id, manager_id) VALUES (?, ?, ?, ?, ?, ?) RETURNING id";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, report.getTitle());
            stmt.setDate(2, java.sql.Date.valueOf(report.getDate()));
            stmt.setString(3, report.getObservation());
            stmt.setString(4, report.getConclusion());
            stmt.setInt(5, report.getRecordId());
            stmt.setString(6, report.getManagerId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting report: " + e.getMessage());
        }
        return 0;
    }

    public void update(Report report) {
        String sql = "update reports set title = ?, report_date = ?, observation = ?, conclusion = ? where id = ?";
        try (PreparedStatement stmt = conn.prepareStateme/home/maiko/DevJava/SIMBA/srcnt(sql)) {
            stmt.setString(1, report.getTitle());
            stmt.setDate(2, java.sql.Date.valueOf(report.getDate());
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

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                LocalDate date = rs.getDate("report_date").toLocalDate();
                String observation = rs.getString("observation");
                String conclusion = rs.getString("conclusion");
                int recordId = rs.getInt("record_id");
                String managerId = rs.getString("manager_id");

                return new Report(title, date, null, observation, conclusion, recordId, managerId);
            }
        } catch (SQLException e) {
            System.out.println("Error getting report by ID: " + e.getMessage());
        }

        return null;
    }

}