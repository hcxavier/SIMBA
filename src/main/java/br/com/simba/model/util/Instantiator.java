package br.com.simba.model.util;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.Manager;
import br.com.simba.model.entities.Reporter;
import br.com.simba.model.entities.School;
import br.com.simba.model.entities.User;
import br.com.simba.model.valueobject.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

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

            return new User(id, username, name, street, addressNumber, neighborhood, city, state, email, password);
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
            Siape siape = new Siape(result.getString("siape"));
            School school = schoolDAO.getSchoolById(result.getInt("school_id"));

            return new Manager(id, username, name, street, addressNumber, neighborhood, city, state, email, password, siape, school);
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
}
