package br.com.simba.model.dao;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Picture;
import br.com.simba.model.util.SQLErrorLog;

import java.sql.*;

public class PictureDAO {
    private Connection connection;

    public PictureDAO(Connection connection){
        this.connection = connection;
    }

    public void insert(Picture picture){
        String sql = "INSERT INTO pictures(picture_path, upload_date) VALUES(?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){
            statement.setString(1, picture.getImagePath());
            statement.setObject(2, picture.getUploadDate());

            int affected_rows = statement.executeUpdate();

            if (affected_rows == 0) throw new DataAccessException("Error: failed to insert picture, no rows affected!");

            try (ResultSet generatedKeys = statement.getGeneratedKeys()){
                boolean exists = generatedKeys.next();

                if (!exists) throw new DataAccessException("Error: failed to insert picture, no ID obtained!");
                picture.setId(generatedKeys.getInt(1));
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to insert picture!");
        }
    }
}
