package br.com.simba.model.dao;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Picture;
import br.com.simba.model.util.Instantiator;
import br.com.simba.model.util.SQLErrorLog;

import javax.sql.DataSource;
import java.sql.*;

public class PictureDAO {
    private final DataSource dataSource;
    private Instantiator instantiator;

    public PictureDAO(){
        dataSource = HikariCPDataSource.getDataSource();
        instantiator = new Instantiator();
    }

    public void insert(Picture picture){
        String sql = "INSERT INTO pictures(picture_path, upload_date) VALUES(?, ?)";

        try (Connection connection = dataSource.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){
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

    public Picture getPictureById(int id){
        String sql = "SELECT * FROM pictures WHERE id = ?";

        try (Connection connection = dataSource.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setInt(1, id);
            statement.executeQuery();
            try (ResultSet result = statement.getResultSet()){
                boolean exists = result.next();

                if (!exists) throw new DataAccessException("Error: picture not found!");

                return instantiator.instantiatePicture(result);
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get picture by id!");
        }
    }
}
