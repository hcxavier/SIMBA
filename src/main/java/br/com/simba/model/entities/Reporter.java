package br.com.simba.model.entities;

import br.com.simba.model.dao.ReporterDAO;
import br.com.simba.model.valueobject.Email;
import br.com.simba.model.valueobject.Password;
import br.com.simba.model.valueobject.Username;

import java.sql.Connection;

public class Reporter extends User{
    public Reporter(Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password) {
        super(username, name, street, number, neighborhood, city, stateAbbr, email, password);
    }

    public Reporter(int id, Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password) {
        super(id, username, name, street, number, neighborhood, city, stateAbbr, email, password);
    }

    public void addToDatabase(Connection connection){
        ReporterDAO reporterDAO = new ReporterDAO(connection);
        reporterDAO.insert(this);
    }
}
