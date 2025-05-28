package br.com.simba.model.util;

import br.com.simba.model.dao.PictureDAO;
import br.com.simba.model.dao.ReporterDAO;
import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.*;
import br.com.simba.model.enums.BarrierCategory;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.enums.BarrierStatus;
import br.com.simba.model.valueobject.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Instantiator {
    private final Connection connection;

    public Instantiator(Connection connection){
         this.connection = connection;
    }

    public User instantiateUser(ResultSet result){
        try {
            int id = result.getInt("id");
            String name = result.getString("full_name");
            String street = result.getString("street");
            int addressNumber = result.getInt("address_number");
            String neighborhood = result.getString("neighborhood");
            String city = result.getString("city");
            String state = result.getString("state_abbr");
            Email email = new Email(result.getString("email"));
            Username username = new Username(result.getString("username"));
            Password password = Password.fromHash(result.getString("hashed_password"));
            String userType = result.getString("user_type");

            return new User(id, username, name, street, addressNumber, neighborhood, city, state, email, password, userType);
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new RuntimeException(e);
        }
    }

    public Reporter instantiateReporter(ResultSet result){
        try {
            int id = result.getInt("id");
            String name = result.getString("full_name");
            String street = result.getString("street");
            int addressNumber = result.getInt("address_number");
            String neighborhood = result.getString("neighborhood");
            String city = result.getString("city");
            String state = result.getString("state_abbr");
            Email email = new Email(result.getString("email"));
            Username username = new Username(result.getString("username"));
            Password password = Password.fromHash(result.getString("hashed_password"));

            return new Reporter(id, username, name, street, addressNumber, neighborhood, city, state, email, password);
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new RuntimeException(e);
        }
    }

    public Manager instantiateManager(ResultSet result){
        SchoolDAO schoolDAO = new SchoolDAO(connection);
        try {
            int id = result.getInt("id");
            String name = result.getString("full_name");
            String street = result.getString("street");
            int addressNumber = result.getInt("address_number");
            String neighborhood = result.getString("neighborhood");
            String city = result.getString("city");
            String state = result.getString("state_abbr");
            Email email = new Email(result.getString("email"));
            Username username = new Username(result.getString("username"));
            Password password = Password.fromHash(result.getString("hashed_password"));
            CPF CPF = new CPF(result.getString("siape"));
            School school = schoolDAO.getSchoolById(result.getInt("school_id"));

            return new Manager(id, username, name, street, addressNumber, neighborhood, city, state, email, password, CPF, school);
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new RuntimeException(e);
        }
    }

    public School instantiateSchool(ResultSet result){
        try {
            int id = result.getInt("id");
            String name = result.getString("school_name");
            String street = result.getString("street");
            int addressNumber = result.getInt("address_number");
            String neighborhood = result.getString("neighborhood");
            String city = result.getString("city");
            String state = result.getString("state_abbr");
            Phone phone = new Phone(result.getString("phone"));
            CNPJ cnpj = new CNPJ(result.getString("cnpj"));

            return new School(id, name, street, addressNumber, neighborhood, city, state, phone, cnpj);
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new RuntimeException(e);
        }
    }

    public Picture instantiatePicture(ResultSet result){
        try {
            int id = result.getInt("id");
            String imagePath = result.getString("picture_path");
            LocalDate uploadDate = LocalDate.parse(result.getString("upload_date"));

            return new Picture(id, imagePath, uploadDate);

        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new RuntimeException(e);
        }
    }

    public Registry instantiateRegistry(ResultSet result){
        PictureDAO pictureDAO = new PictureDAO(connection);
        SchoolDAO schoolDAO = new SchoolDAO(connection);
        ReporterDAO reporterDAO = new ReporterDAO(connection);
        try {
            int id = result.getInt("id");
            String barrierSpecification = result.getString("barrier_specification");
            String location = result.getString("resolution_suggestion");
            String resolutionSuggestion = result.getString("resolution_suggestion");
            BarrierStatus barrierStatus = BarrierStatus.valueOf(result.getString("barrier_status"));
            BarrierCriticality barrierCriticality = BarrierCriticality.valueOf(result.getString("barrier_criticality"));
            BarrierCategory barrierCategory = BarrierCategory.valueOf(result.getString("barrier_type"));
            LocalDate barrierIdentificationDate = LocalDate.parse(result.getString("barrier_identification_date"));
            Picture picture = pictureDAO.getPictureById(result.getInt("picture_id"));
            School school = schoolDAO.getSchoolById(result.getInt("school_id"));
            Reporter reporter = reporterDAO.getReporterById(result.getInt("reporter_id"));

            return new Registry(id, barrierCriticality, picture, school, location, barrierSpecification, resolutionSuggestion, barrierCategory, barrierIdentificationDate, reporter, barrierStatus);
        } catch (SQLException e){
            SQLErrorLog.reportSqlException(e);
            throw new RuntimeException(e);
        }
    }

    public List<String> instantiateCities(ResultSet result){
        List<String> cities = new ArrayList<>();

        try {
            while(result.next()){
                cities.add(result.getString("city_name"));
            }

            return cities;
        } catch (SQLException e) {
            SQLErrorLog.reportSqlException(e);
            throw new RuntimeException(e);
        }
    }
}
