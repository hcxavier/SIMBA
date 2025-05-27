package br.com.simba.model.dao;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Reporter;
import br.com.simba.model.entities.User;
import br.com.simba.model.util.Instantiator;
import br.com.simba.model.util.SQLErrorLog;
import br.com.simba.model.valueobject.Username;

import java.sql.*;

public class ReporterDAO extends UserDAO {
    private final Instantiator instantiator;

    public ReporterDAO(Connection connection) {
        super(connection);
        instantiator = new Instantiator(connection);
    }

    public void insert(Reporter reporter){
        String insertUser = "INSERT INTO users (full_name, street, address_number, neighborhood, city, state_abbr, email, username, hashed_password) VALUES (?,?,?,?,?,?,?,?,?)";
        String insertReporter = "INSERT INTO reporters (user_id) VALUES (?)";

        try (PreparedStatement statement = connection.prepareStatement(insertUser, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, reporter.getName());
            statement.setString(2, reporter.getStreet());
            statement.setInt(3, reporter.getAddressNumber());
            statement.setString(4, reporter.getNeighborhood());
            statement.setString(5, reporter.getCity());
            statement.setString(6, reporter.getStateAbbr());
            statement.setString(7, reporter.getEmail());
            statement.setString(8, reporter.getUsername());
            statement.setString(9, reporter.getHashedPassword());

            int affectedRowsUsers = statement.executeUpdate();

            if (affectedRowsUsers == 0) throw new DataAccessException("Error: failed to create user, no rows affected!");

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                boolean exists = generatedKeys.next();

                if (!exists) throw new DataAccessException("Error: failed to create user, no ID obtained!");
                reporter.setId(generatedKeys.getInt(1));
            }
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to create user!", e);
        }

        try (PreparedStatement statement = connection.prepareStatement(insertReporter)){
            statement.setInt(1, reporter.getId());

            int affectedRowsReporter = statement.executeUpdate();

            if (affectedRowsReporter == 0) throw new DataAccessException("Error: failed to create student, no rows affected!");
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to create student!");
        }
    }

    public Reporter getReporterByUsername(Username usernameEntry){
        String sql = "SELECT r.id, u.full_name, u.street, u.address_number, u.neighborhood, u.city, u.state_abbr, u.email, u.username, u.hashed_password FROM users u JOIN reporters r ON u.id = r.user_id WHERE username = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, usernameEntry.toString());

            statement.executeQuery();

            try (ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();

                if (!exists) throw new DataAccessException("Error: username not found!");

                return instantiator.instantiateReporter(resultSet);
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get user by username!");
        }
    }

    public Reporter getReporterById(int id){
        String sql = "SELECT r.id, u.full_name, u.street, u.address_number, u.neighborhood, u.city, u.state_abbr, u.email, u.username, u.hashed_password FROM users u JOIN reporters r ON u.id = r.user_id WHERE r.id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setInt(1, id);

            statement.executeQuery();

            try (ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();

                if (!exists) throw new DataAccessException("Error: id not found!");

                return instantiator.instantiateReporter(resultSet);
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get user by id!");
        }
    }
}
