package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.Barrier;

public class BarrierDAO {
    private Connection conn;

    public BarrierDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public void insert(Barrier barrier) {
        String sql = "INSERT INTO barrier (barrier_type, description, resolution_difficulty) VALUES (?,?,?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, barrier.getBarrierType());
            pstmt.setString(2, barrier.getDescription());
            pstmt.setString(3, barrier.getDifficultyResolving());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting barrier failed, no rows affected.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error inserting barrier: " + e.getMessage());
        }
    }

    public void update(Barrier barrier) {
        String sql = "UPDATE barrier SET barrier_type = ?, description = ?, resolution_difficulty = ? WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, barrier.getBarrierType());
            pstmt.setString(2, barrier.getDescription());
            pstmt.setString(3, barrier.getDifficultyResolving());
            pstmt.setInt(4, barrier.getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating barrier failed, no rows affected.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error updating barrier: " + e.getMessage());
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM Barrier WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int affeectedRows = pstmt.executeUpdate();
            if (affeectedRows == 0) {
                throw new SQLException("Deleting barrier failed, no rows affected.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error deleting barrier: " + e.getMessage());
        }
    }

    public Barrier select(int id) {
        String sql = "Select * FROM Barrier WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int barrierId = rs.getInt("id");
                String barrierType = rs.getString("barrier_type");
                String description = rs.getString("description");
                String resolutionDifficulty = rs.getString("resolution_difficulty");

                return new Barrier(barrierId, description, barrierType, resolutionDifficulty, null);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error selecting barrier: " + e.getMessage());
        }
        return null;
    }
}