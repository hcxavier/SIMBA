package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.com.simba.model.entities.Comment;

public class CommentDAO {
    private Connection conn;

    public CommentDAO() {
        SupabaseConnection supabaseConnection = new SupabaseConnection();
        conn = supabaseConnection.openConnection();
    }

    public void insert(Comment comment) {
        String sql = "INSERT INTO comment (text, record_id) VALUES (?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, comment.getText());
            pstmt.setInt(2, comment.getRecord().getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting comment failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error inserting comment: " + e.getMessage());
        }
    }

    public void update(Comment comment) {
        String sql = "UPDATE comment SET text = ?, record_id = ? WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, comment.getText());
            pstmt.setInt(2, comment.getRecord().getId());
            pstmt.setInt(3, comment.getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Updating comment failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error updating comment: " + e.getMessage());
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM comment WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Deleting comment failed, no rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("Error deleting comment: " + e.getMessage());
        }
    }

    public Comment select(int id) {
        String sql = "SELECT * FROM comment WHERE id = ?";
        Comment comment = null;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                RecordDAO recordDAO = new RecordDAO();
                Record record = recordDAO.select(rs.getInt("record_id"));
                comment = new Comment(rs.getInt("id"), rs.getString("text"), record);
            }
        } catch (SQLException e) {
            System.out.println("Error getting comment by ID: " + e.getMessage());
        }
        return comment;
    }
}
