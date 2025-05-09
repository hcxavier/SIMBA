package br.com.simba.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import br.com.simba.model.entities.*;
import br.com.simba.config.exceptions.DataAccessException;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.enums.BarrierStatus;
import br.com.simba.model.enums.BarrierType;

public class UserDAO {

    private static final String TABLE_USERS = "users";
    private static final String COLUMN_ID = "id";
    private static final String COLUMN_FULL_NAME = "full_name";
    private static final String COLUMN_STREET = "street";
    private static final String COLUMN_ADDRESS_NUMBER = "address_number";
    private static final String COLUMN_NEIGHBORHOOD = "neighborhood";
    private static final String COLUMN_CITY = "city";
    private static final String COLUMN_STATE_ABBR = "state_abbr";
    private static final String COLUMN_EMAIL = "email";
    private static final String COLUMN_USERNAME = "username";
    private static final String COLUMN_HASHED_PASSWORD = "hashed_password";

    private static final String TABLE_RECORDS = "records";
    private static final String COLUMN_RECORD_ID = "record_id";
    private static final String COLUMN_RECORD_USER_ID = "user_id";
    private static final String COLUMN_BARRIER_SPECIFICATION = "barrier_specification";
    private static final String COLUMN_RESOLUTION_SUGGESTION = "resolution_suggestion";
    private static final String COLUMN_LOCATION = "location";
    private static final String COLUMN_BARRIER_STATUS = "barrier_status";
    private static final String COLUMN_BARRIER_CRITICALITY = "barrier_criticality";
    private static final String COLUMN_BARRIER_TYPE = "barrier_type";
    private static final String COLUMN_BARRIER_IDENTIFICATION_DATE = "barrier_identification_date";


    private final Connection conn; // Recebe a conexão no construtor

    public UserDAO(Connection connection) {
        if (connection == null) {
            throw new IllegalArgumentException("Connection não pode ser nula.");
        }
        this.conn = connection;
    }

    public User createNewUser(User user) {
        String sql = String.format(
                "INSERT INTO %s (%s, %s, %s, %s, %s, %s, %s, %s, %s) VALUES (?,?,?,?,?,?,?,?,?);",
                TABLE_USERS, COLUMN_FULL_NAME, COLUMN_STREET, COLUMN_ADDRESS_NUMBER, COLUMN_NEIGHBORHOOD,
                COLUMN_CITY, COLUMN_STATE_ABBR, COLUMN_EMAIL, COLUMN_USERNAME, COLUMN_HASHED_PASSWORD
        );

        // A conexão é gerenciada externamente, então não usamos try-with-resources para ela aqui.
        // Apenas para PreparedStatement e ResultSet.
        try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getAddress().getStreet());
            stmt.setInt(3, user.getAddress().getNumber());
            stmt.setString(4, user.getAddress().getNeighborhood());
            stmt.setString(5, user.getAddress().getCity());
            stmt.setString(6, user.getAddress().getStateAbbr());
            stmt.setString(7, user.getEmail().toString());
            stmt.setString(8, user.getUsername().toString());
            stmt.setString(9, user.getPassword());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new DataAccessException("Falha ao inserir usuário, nenhuma linha afetada.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    user.setId(generatedKeys.getInt(1));
                } else {
                    System.err.println("Inserção de usuário bem-sucedida, mas não foi possível obter o ID gerado.");
                }
            }
            return user;
        } catch (SQLException e) {
            throw new DataAccessException("Erro ao inserir usuário: " + user.getUsername(), e);
        }
    }

    public void updateUser(User user) {
        String sql = String.format(
                "UPDATE %s SET %s = ?, %s = ?, %s = ?, %s = ?, %s = ?, %s = ?, %s = ? WHERE %s = ?;",
                TABLE_USERS, COLUMN_FULL_NAME, COLUMN_STREET, COLUMN_ADDRESS_NUMBER, COLUMN_NEIGHBORHOOD,
                COLUMN_CITY, COLUMN_STATE_ABBR, COLUMN_EMAIL, COLUMN_USERNAME
        );
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getAddress().getStreet());
            stmt.setInt(3, user.getAddress().getNumber());
            stmt.setString(4, user.getAddress().getNeighborhood());
            stmt.setString(5, user.getAddress().getCity());
            stmt.setString(6, user.getAddress().getStateAbbr());
            stmt.setString(7, user.getEmail().toString());
            stmt.setString(8, user.getUsername().toString()); // Condição WHERE

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new DataAccessException("Falha ao atualizar usuário '" + user.getUsername() + "', nenhuma linha afetada.");
            }
        } catch (SQLException e) {
            throw new DataAccessException("Erro ao atualizar usuário: " + user.getUsername(), e);
        }
    }

    public boolean deleteByUsername(String username) {
        String sql = String.format("DELETE FROM %s WHERE %s = ?;", TABLE_USERS, COLUMN_USERNAME);
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            throw new DataAccessException("Erro ao deletar usuário: " + username, e);
        }
    }

    public Optional<User> findByUsername(String username) {
        String sql = String.format(
                "SELECT %s, %s, %s, %s, %s, %s, %s, %s, %s, %s FROM %s WHERE %s = ?",
                COLUMN_ID, COLUMN_FULL_NAME, COLUMN_STREET, COLUMN_ADDRESS_NUMBER, COLUMN_NEIGHBORHOOD,
                COLUMN_CITY, COLUMN_STATE_ABBR, COLUMN_EMAIL, COLUMN_USERNAME, COLUMN_HASHED_PASSWORD,
                TABLE_USERS, COLUMN_USERNAME
        );
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt(COLUMN_ID);
                    String name = rs.getString(COLUMN_FULL_NAME);
                    String street = rs.getString(COLUMN_STREET);
                    int number = rs.getInt(COLUMN_ADDRESS_NUMBER);
                    String neighborhood = rs.getString(COLUMN_NEIGHBORHOOD);
                    String city = rs.getString(COLUMN_CITY);
                    String stateAbbr = rs.getString(COLUMN_STATE_ABBR);
                    String emailStr = rs.getString(COLUMN_EMAIL);
                    String usernameStr = rs.getString(COLUMN_USERNAME);
                    String hashedPassword = rs.getString(COLUMN_HASHED_PASSWORD);

                    // Ajuste o construtor do User para aceitar todos esses campos
                    User foundUser = new User(id, usernameStr, name, street, number, neighborhood, city, stateAbbr, emailStr, hashedPassword);
                    return Optional.of(foundUser);
                } else {
                    return Optional.empty();
                }
            }
        } catch (SQLException e) {
            throw new DataAccessException("Erro ao buscar usuário: " + username, e);
        }
    }

    public List<br.com.simba.model.entities.Record> getRecordsByUserId(int userId) {
        String sql = String.format(
                "SELECT %s, %s, %s, %s, %s, %s, %s, %s FROM %s WHERE %s = ?;",
                COLUMN_RECORD_ID, COLUMN_BARRIER_SPECIFICATION, COLUMN_RESOLUTION_SUGGESTION, COLUMN_LOCATION,
                COLUMN_BARRIER_STATUS, COLUMN_BARRIER_CRITICALITY, COLUMN_BARRIER_TYPE,
                COLUMN_BARRIER_IDENTIFICATION_DATE,
                TABLE_RECORDS, COLUMN_RECORD_USER_ID
        );
        List<br.com.simba.model.entities.Record> records = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int record_id = rs.getInt(COLUMN_RECORD_ID);
                    String barrier_specification = rs.getString(COLUMN_BARRIER_SPECIFICATION);
                    String resolution_suggestion = rs.getString(COLUMN_RESOLUTION_SUGGESTION);
                    String location = rs.getString(COLUMN_LOCATION);
                    BarrierStatus barrier_status = BarrierStatus.valueOf(rs.getString(COLUMN_BARRIER_STATUS));
                    BarrierCriticality barrier_criticality = BarrierCriticality.valueOf(rs.getString(COLUMN_BARRIER_CRITICALITY));
                    BarrierType barrier_type = BarrierType.valueOf(rs.getString(COLUMN_BARRIER_TYPE));
                    LocalDate barrier_identification_date = rs.getDate(COLUMN_BARRIER_IDENTIFICATION_DATE).toLocalDate();

                    records.add(new br.com.simba.model.entities.Record(
                            record_id,
                            userId,
                            barrier_status,
                            barrier_criticality,
                            location,
                            barrier_specification,
                            resolution_suggestion,
                            barrier_type,
                            barrier_identification_date
                    ));
                }
            }
        } catch (SQLException e) {
            throw new DataAccessException("Erro ao buscar registros para o usuário ID: " + userId, e);
        }
        return records;
    }
}