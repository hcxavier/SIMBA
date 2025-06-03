package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Reporter;
import br.com.simba.model.entities.User;
import br.com.simba.model.util.Instantiator;
import br.com.simba.model.util.SQLErrorLog;
import br.com.simba.model.valueobject.Email;
import br.com.simba.model.valueobject.Password;
import br.com.simba.model.valueobject.Username;

public class UserDAO {
    private final String COLUMNS = "id, full_name, street, address_number, neighborhood, city, state_abbr, email, username, hashed_password, user_type";
    protected final Connection connection;
    private final Instantiator instantiator;

    public UserDAO(Connection connection) {
        if (connection == null) throw new IllegalArgumentException("Connection cannot be null!");
        instantiator = new Instantiator(connection);
        this.connection = connection;
    }

    public void update(User user){
        String sql = "UPDATE users SET full_name = ?, street = ?, address_number = ?, neighborhood = ?, city = ?, state_abbr = ?, email = ?, hashed_password = ? WHERE username = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, user.getName());
            statement.setString(2, user.getStreet());
            statement.setInt(3, user.getAddressNumber());
            statement.setString(4, user.getNeighborhood());
            statement.setString(5, user.getCity());
            statement.setString(6, user.getStateAbbr());
            statement.setString(7, user.getEmail());
            statement.setString(8, user.getHashedPassword());
            statement.setString(9, user.getUsername());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new DataAccessException("Error: failed to update user, no rows affected!");
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to update user!", e);
        }
    }

    public void changeUsername(Username oldUsername, Username newUsername){
        String sql = "UPDATE users SET username = ? WHERE username = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, newUsername.toString());
            statement.setString(2, oldUsername.toString());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new DataAccessException("Error: failed to change username, no rows affected!");
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to change username!", e);
        }
    }

    public void delete(int id){
        String sql = "DELETE FROM users WHERE id = ?";

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setInt(1, id);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new DataAccessException("Error: failed to remove user, now rows affected!");
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to remove user!");
        }
    }

    public User getUserByUsername(Username usernameEntry){
        String sql = String.format("SELECT %s FROM users WHERE username = ?", COLUMNS);

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, usernameEntry.toString());

            statement.executeQuery();

            try (ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();

                if (!exists) throw new DataAccessException("Error: username not found!");

                return instantiator.instantiateUser(resultSet);
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get user by username!");
        }
    }

    public User getUserByEmail(Email email){
        String sql = String.format("SELECT %s FROM users WHERE email = ?", COLUMNS);

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, email.toString());

            statement.executeQuery();

            try (ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();

                if (!exists) throw new DataAccessException("Error: email not found!");

                return instantiator.instantiateUser(resultSet);
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get user by email!");
        }
    }

    public void updatePassword(User user) {
        String sql = "UPDATE users SET hashed_password = ? WHERE username = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getHashedPassword());
            statement.setString(2, user.getUsername());

            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                throw new DataAccessException("Erro: nenhuma linha foi atualizada ao tentar trocar a senha.");
            }
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Erro ao atualizar senha!", e);
        }
    }

}