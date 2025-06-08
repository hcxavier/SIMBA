package br.com.simba.model.dao;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Picture;
import br.com.simba.model.util.Instantiator;
import br.com.simba.model.util.SQLErrorLog;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

public class StateDAO {
    private Instantiator instantiator;
    private final DataSource dataSource;

    public StateDAO(){
        dataSource = HikariCPDataSource.getDataSource();
        instantiator = new Instantiator();
    }

    public List<String> getCitiesByState(String state){
        String sql = "SELECT city_name FROM cities WHERE uf = ? ORDER BY city_name ASC";

        try(Connection connection = dataSource.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)){
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
