package br.com.simba.model.dao;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.entities.School;
import br.com.simba.model.util.SQLErrorLog;

import java.sql.*;

public class RegistryDAO {
    private final Connection connection;

    public RegistryDAO(Connection connection){
        this.connection = connection;
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
}
