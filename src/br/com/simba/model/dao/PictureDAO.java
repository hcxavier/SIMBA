package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.Picture;

public class PictureDAO {
    private Connection conn;

    public PictureDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public void insert(Picture picture) {
        String sql = "INSERT INTO picture (path, upload_date, description, record_id) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, picture.getPath());
            pstmt.setInt(2, picture.getUploadDate());
            pstmt.setString(3, picture.getDescription());
            pstmt.setInt(4, picture.getRecordId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting picture failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting picture: " + e.getMessage());
        }
    }

    public void update(Picture picture) {
        String sql = "UPDATE picture SET path = ?, upload_date = ?, description = ?, record_id = ? WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, picture.getPath());
            pstmt.setInt(2, picture.getUploadDate());
            pstmt.setString(3, picture.getDescription());
            pstmt.setInt(4, picture.getRecordId());
            pstmt.setInt(5, picture.getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating picture failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating picture: " + e.getMessage());
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM picture WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Deleting picture failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error deleting picture: " + e.getMessage());
        }
    }

    public Picture select(int id) {
        String sql = "SELECT * FROM picture WHERE id = ?";
        Picture picture = null;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                picture = new Picture();
                picture.setId(rs.getInt("id"));
                picture.setPath(rs.getString("path"));
                picture.setUploadDate(rs.getInt("upload_date"));
                picture.setDescription(rs.getString("description"));
                picture.setRecordId(rs.getInt("record_id"));
            }
        } catch (SQLException e) {
            System.out.println("Error selecting picture: " + e.getMessage());
        }
        return picture;
    }
}
