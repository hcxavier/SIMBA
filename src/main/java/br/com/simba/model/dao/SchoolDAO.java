package br.com.simba.model.dao;

import br.com.simba.exceptions.DataAccessException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import br.com.simba.model.entities.School;
import br.com.simba.model.util.Instantiator;
import br.com.simba.model.util.SQLErrorLog;
import br.com.simba.model.valueobject.*;

public class SchoolDAO {
    private Connection connection;
    protected final Instantiator instantiator;
    private final String COLUMNS = "id, school_name, street, address_number, neighborhood, city, state_abbr, phone, cnpj";

    public SchoolDAO(Connection connection) {
        if (connection == null) throw new DataAccessException("Error: connection cannot be null!");
        instantiator = new Instantiator(connection);
        this.connection = connection;
    }

    public void insert(School school) {
        String sql = "INSERT INTO schools (school_name, street, address_number, neighborhood, city, state_abbr, phone, cnpj) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, school.getName());
            statement.setString(2, school.getStreet());
            statement.setInt(3, school.getAddressNumber());
            statement.setString(4, school.getNeighborhood());
            statement.setString(5, school.getCity());
            statement.setString(6, school.getState());
            statement.setString(7, school.getPhone());
            statement.setString(8, school.getCnpj());
            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new DataAccessException("Error: failed to insert school, no rows affected!");

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                boolean exists = generatedKeys.next();

                if (!exists) throw new DataAccessException("Error: failed to create school, no ID obtained!");
                school.setId(generatedKeys.getInt(1));
            }
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to create school!");
        }
    }

    public void update(School school) {
        String sql = "UPDATE schools SET school_name = ?, street = ?, address_number = ?, neighborhood = ?, city = ?, state_abbr = ?, phone = ? WHERE cnpj = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, school.getName());
            statement.setString(2, school.getStreet());
            statement.setInt(3, school.getAddressNumber());
            statement.setString(4, school.getNeighborhood());
            statement.setString(5, school.getCity());
            statement.setString(6, school.getState());
            statement.setString(7, school.getPhone());
            statement.setString(8, school.getCnpj());
            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new DataAccessException("Error: failed to update school, no rows affected!");
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to update school!");
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM schools WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                throw new DataAccessException("Error: failed to delete school, no rows affected.");
            }
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to delete school!");
        }
    }

    public void changeCNPJ(CNPJ oldCNPJ, CNPJ newCNPJ){
        String sql = "UPDATE schools SET cnpj = ? WHERE cnpj = ?";

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, newCNPJ.toString());
            statement.setString(2, oldCNPJ.toString());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) throw new DataAccessException("Error: failed to change cnpj, no rows affected!");
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to change cnpj!");
        }
    }

    public School getSchoolByName(String name){
        String sql = "SELECT * FROM schools WHERE school_name = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, name);

            statement.executeQuery();

            try (ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();

                if (!exists) throw new DataAccessException("Error: Name not found!");

                return instantiator.instantiateSchool(resultSet);
            }

        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get school by Name!");
        }
    }

    public School getSchoolById(int id){
        String sql = "SELECT * FROM schools WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setInt(1, id);

            statement.executeQuery();

            try (ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();

                if (!exists) throw new DataAccessException("Error: id not found!");

                return instantiator.instantiateSchool(resultSet);
            }

        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get school by CNPJ!");
        }
    }

    public int getIdByCNPJ(CNPJ cnpj){
        String sql = "SELECT id FROM schools WHERE cnpj = ?";

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, cnpj.toString());
            statement.executeQuery();

            try(ResultSet resultSet = statement.getResultSet()){
                boolean exists = resultSet.next();
                if (!exists) throw new DataAccessException("Error: CNPJ not found!");

                return resultSet.getInt("id");
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to get id by CNPJ!");
        }
    }

    public List<School> listAllSchools(){
        String sql = String.format("SELECT %s FROM schools;", COLUMNS);
        List<School> schools = new ArrayList<School>();

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.executeQuery();

            try(ResultSet result = statement.getResultSet()){
                while(result.next()){
                    schools.add(instantiator.instantiateSchool(result));
                }
                return schools;
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to list all schools!");
        }
    }

    public List<School> listSchoolsByName(String name){
        String sql = String.format("SELECT %s FROM schools WHERE school_name LIKE ?", COLUMNS);
        List<School> schools = new ArrayList<School>();

        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, "%" + name + "%");
            statement.executeQuery();

            try(ResultSet result = statement.getResultSet()){
                while(result.next()){
                    schools.add(instantiator.instantiateSchool(result));
                }
                return schools;
            }
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new DataAccessException("Error: failed to list all schools!");
        }
    }
}
