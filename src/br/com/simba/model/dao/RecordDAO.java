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

    public void insert(Record record){
        String sql = "INSERT INTO Record (id, location, criticality, status, barrier_id, school_id) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, record.getId());
            pstmt.setString(2, record.getAddress().toString());
            pstmt.setString(3, record.getCriticality().toString());
            pstmt.setString(4, record.getStatus().toString());
            pstmt.setInt(5, record.getBarrier().getId());
            pstmt.setInt(6, record.getSchool().getId());
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Inserting record failed, no rows affected.");
            }
        }catch (SQLException e) {
            System.out.println("Error inserting record: " + e.getMessage());
        }
    }

    public void update(Record record){}
    public void delete(int id){}
    public void select(int id){}
    

}

