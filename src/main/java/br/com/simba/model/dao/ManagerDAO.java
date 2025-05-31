package br.com.simba.model.dao;

import java.sql.*;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Manager;
import br.com.simba.model.util.Instantiator;
import br.com.simba.model.util.SQLErrorLog;
import br.com.simba.model.valueobject.Username;

public class ManagerDAO extends UserDAO {
    private final Instantiator instantiator;
    public ManagerDAO(Connection connection) {
        super(connection);
        instantiator = new Instantiator(connection);
    }

    public void insert(Manager manager){
        String insertUser = "INSERT INTO users (full_name, street, address_number, neighborhood, city, state_abbr, email, username, hashed_password, user_type) VALUES (?,?,?,?,?,?,?,?,?,?)";
        String insertManager = "INSERT INTO managers (CPF, user_id, school_id) VALUES (?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(insertUser, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, manager.getName());
            statement.setString(2, manager.getStreet());
            statement.setInt(3, manager.getAddressNumber());
            statement.setString(4, manager.getNeighborhood());
            statement.setString(5, manager.getCity());
            statement.setString(6, manager.getStateAbbr());
            statement.setString(7, manager.getEmail());
            statement.setString(8, manager.getUsername());
            statement.setString(9, manager.getHashedPassword());
            statement.setString(10, "manager");

            int affectedRowsUsers = statement.executeUpdate();

            if (affectedRowsUsers == 0) throw new DataAccessException("Error: failed to create user, no rows affected!");

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                boolean exists = generatedKeys.next();

                if (!exists) throw new DataAccessException("Error: failed to create user, no ID obtained!");
                manager.setId(generatedKeys.getInt(1));
            }
        } catch (SQLException e) {
            throw new DataAccessException("Error: failed to create user!", e);
        }

        try (PreparedStatement statement = connection.prepareStatement(insertManager)){
            statement.setString(1, manager.getCPF());
            statement.setInt(2, manager.getId());
            statement.setInt(3, manager.getSchoolId());

            int affectedRowsManager = statement.executeUpdate();

            if (affectedRowsManager == 0) throw new DataAccessException("Error: failed to create manager, no rows affected!");
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to create manager!");
        }
    }

    public Manager getManagerByUsername(Username usernameEntry){
        String sql = "SELECT m.CPF, m.school_id, u.id, u.full_name, u.street, u.address_number, u.neighborhood, u.city, u.state_abbr, u.email, u.username, u.hashed_password FROM users u JOIN managers m ON u.id = m.user_id WHERE username = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, usernameEntry.toString());

            statement.executeQuery();

            try (ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();

                if (!exists) throw new DataAccessException("Error: username not found!");

                return instantiator.instantiateManager(resultSet);
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get user by username!");
        }
    }

    public Manager getManagerBySchoolName(String schoolName){
        String sql = "SELECT m.CPF, u.id, m.school_id, u.full_name, u.street, u.address_number, u.neighborhood, u.city, u.state_abbr, u.email, u.username, u.hashed_password FROM users u JOIN managers m ON u.id = m.user_id JOIN schools s ON m.school_id = s.id WHERE school_name = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, schoolName);

            statement.executeQuery();

            try (ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();

                if (!exists) throw new DataAccessException("Error: manager not found!");

                return instantiator.instantiateManager(resultSet);
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get manager by school_name!");
        }
    }
}
