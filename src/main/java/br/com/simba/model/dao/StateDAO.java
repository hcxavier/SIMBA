package br.com.simba.model.dao;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Picture;
import br.com.simba.model.util.Instantiator;
import br.com.simba.model.util.SQLErrorLog;

import java.sql.*;
import java.util.List;

public class StateDAO {
    private Instantiator instantiator;
    private Connection connection;

    public StateDAO(Connection connection){
        this.connection = connection;
        instantiator = new Instantiator(connection);
    }

    public List<String> getCitiesByState(String state){
        String sql = "SELECT city_name FROM cities WHERE uf = ? ORDER BY city_name ASC";

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, state);

            try(ResultSet resultSet = statement.executeQuery()){
                return instantiator.instantiateCities(resultSet);
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get cities by state!");
        }
    }
}
