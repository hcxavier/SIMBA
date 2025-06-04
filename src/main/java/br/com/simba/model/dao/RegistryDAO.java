package br.com.simba.model.dao;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.entities.School;
import br.com.simba.model.enums.BarrierStatus;
import br.com.simba.model.util.Instantiator;
import br.com.simba.model.util.SQLErrorLog;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RegistryDAO {
    private final Connection connection;
    private final Instantiator instantiator;
    private final String COLUMNS = "rg.id, barrier_specification, resolution_suggestion, location, barrier_status, barrier_criticality, barrier_type, barrier_identification_date, picture_id, school_id, reporter_id";
    private final String FULL_COLUMNS_FOR_SINGLE_FETCH = "rg.id, rg.barrier_specification, rg.resolution_suggestion, rg.location, rg.barrier_status, rg.barrier_criticality, rg.barrier_type, rg.barrier_identification_date, rg.picture_id, rg.school_id, rg.reporter_id";


    public RegistryDAO(Connection connection){
        if (connection == null) throw new DataAccessException("Error: connection cannot be null!");
        this.connection = connection;
        instantiator = new Instantiator(connection);
    }

    public void insert(Registry registry) {
        String sql = "INSERT INTO registries (barrier_specification, resolution_suggestion, location, barrier_status, barrier_criticality, barrier_type, barrier_identification_date, school_id, reporter_id, picture_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, registry.getBarrierSpecification());
            statement.setString(2, registry.getResolutionSuggestion());
            statement.setString(3, registry.getLocation());
            statement.setString(4, registry.getBarrierStatus().toString());
            statement.setString(5, registry.getBarrierCriticality().toString());
            statement.setString(6, registry.getBarrierType().toString());
            statement.setObject(7, registry.getBarrierIdentificationDate());
            statement.setInt(8, registry.getSchoolId());
            statement.setInt(9, registry.getReporterId());
            statement.setInt(10, registry.getPictureId());
            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new DataAccessException("Error: failed to insert registry, no rows affected!");

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                boolean exists = generatedKeys.next();

                if (!exists) throw new DataAccessException("Error: failed to create registry, no ID obtained!");
                registry.setId(generatedKeys.getInt(1));
            }
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to create registry!");
        }
    }

    public List<Registry> listAllRegistries(){
        String sql = String.format("SELECT %s FROM registries rg ORDER BY rg.barrier_identification_date DESC, rg.id DESC LIMIT 10;", COLUMNS);
        List<Registry> registries = new ArrayList<Registry>();

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.executeQuery();

            try(ResultSet result = statement.getResultSet()){
                while(result.next()){
                    registries.add(instantiator.instantiateRegistry(result));
                }
                return registries;
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to list all registries!");
        }
    }

    public int getRegistryAmount(){
        String sql = "SELECT count(id) as amount FROM registries;";

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.executeQuery();

            try(ResultSet result = statement.getResultSet()){
                boolean exists = result.next();
                if  (!exists) throw new DataAccessException("Error: failed to get amount of registries!");

                return result.getInt("amount");
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get amount of registries!");
        }
    }

    public int getRegistryAmountByStatus(String status){
        String sql = "SELECT count(id) as amount FROM registries WHERE barrier_status = ?;";

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, status);
            statement.executeQuery();

            try(ResultSet result = statement.getResultSet()){
                boolean exists = result.next();
                if  (!exists) throw new DataAccessException("Error: failed to get amount of registries!");

                return result.getInt("amount");
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get amount of registries!");
        }
    }


    public List<Registry> listAllUserRegistries(String username){
        String sql = String.format("SELECT %s FROM registries rg JOIN reporters rp ON rg.reporter_id = rp.id JOIN users u ON u.id = rp.user_id WHERE u.username = ?;", COLUMNS);
        List<Registry> registries = new ArrayList<Registry>();

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, username);
            statement.executeQuery();

            try(ResultSet result = statement.getResultSet()){
                while(result.next()){
                    registries.add(instantiator.instantiateRegistry(result));
                }
                return registries;
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to list all schools!");
        }
    }

    public List<Registry> listAllUserRegistriesOrderedByRecentDate(String username){
        String sql = String.format("SELECT %s FROM registries rg JOIN reporters rp ON rg.reporter_id = rp.id JOIN users u ON u.id = rp.user_id WHERE u.username = ? ORDER BY barrier_identification_date DESC;", COLUMNS);
        List<Registry> registries = new ArrayList<Registry>();

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, username);
            statement.executeQuery();

            try(ResultSet result = statement.getResultSet()){
                while(result.next()){
                    registries.add(instantiator.instantiateRegistry(result));
                }
                return registries;
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to list all schools!");
        }
    }

    public List<Registry> listAllUserRegistriesOrderedByOldestDate(String username){
        String sql = String.format("SELECT %s FROM registries rg JOIN reporters rp ON rg.reporter_id = rp.id JOIN users u ON u.id = rp.user_id WHERE u.username = ? ORDER BY barrier_identification_date ASC;", COLUMNS);
        List<Registry> registries = new ArrayList<Registry>();

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, username);
            statement.executeQuery();

            try(ResultSet result = statement.getResultSet()){
                while(result.next()){
                    registries.add(instantiator.instantiateRegistry(result));
                }
                return registries;
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to list all schools!");
        }
    }

    public void delete(int id){
        String sql = "DELETE FROM registries WHERE id = ?";

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setInt(1,id);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new DataAccessException("Error: failed to delete registry, no rows affected!");
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to delete registry!");
        }
    }

    public Registry findById(int id) {
        String sql = String.format("SELECT %s FROM registries rg WHERE rg.id = ?", FULL_COLUMNS_FOR_SINGLE_FETCH);
        Registry registry = null;
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    registry = instantiator.instantiateRegistry(result);
                }
            }
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to find registry by ID!");
        }
        return registry;
    }

    public void update(Registry registry) {
        String sql = "UPDATE registries SET barrier_specification = ?, resolution_suggestion = ?, location = ?, " +
                "barrier_criticality = ?, barrier_type = ? " +
                "WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, registry.getBarrierSpecification());
            statement.setString(2, registry.getResolutionSuggestion());
            statement.setString(3, registry.getLocation());
            statement.setString(4, registry.getBarrierCriticality().name());
            statement.setString(5, registry.getBarrierType().name());
            statement.setInt(6, registry.getId());

            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                throw new DataAccessException("Error: failed to update registry, no rows affected. Registry ID: " + registry.getId());
            }
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to update registry!");
        }
    }

    public List<Registry> listRegistriesBySchoolId(int schoolId) {
        String sql = String.format("SELECT %s FROM registries rg WHERE rg.school_id = ? ORDER BY rg.barrier_identification_date DESC", COLUMNS);
        List<Registry> registries = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, schoolId);
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    registries.add(instantiator.instantiateRegistry(result));
                }
            }
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to list registries by school ID!");
        }
        return registries;
    }

    public String getObservationsTextByRegistryId(int registryId) throws SQLException {
        String sql = "SELECT observations_text FROM registries WHERE id = ?";

        try (java.sql.PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, registryId);

            try (java.sql.ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    String obsText = rs.getString("observations_text");
                    return obsText;
                }
                return null;
            }
        }
    }

    public void updateObservationsText(int registryId, String observationsText) throws SQLException {
        String sql = "UPDATE registries SET observations_text = ? WHERE id = ?";

        try (java.sql.PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, observationsText);
            statement.setInt(2, registryId);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new SQLException("Falha ao atualizar observações, nenhuma linha afetada. ID da barreira: " + registryId);
        }
    }

    public void updateBarrierStatus(int registryId, BarrierStatus newStatus) throws SQLException {
        String sql = "UPDATE registries SET barrier_status = ? WHERE id = ?";

        try (java.sql.PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, newStatus.name());
            statement.setInt(2, registryId);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new SQLException("Falha ao atualizar status, nenhuma linha afetada. ID da barreira: " + registryId);
        }
    }
}