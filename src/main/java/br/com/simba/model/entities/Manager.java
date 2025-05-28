package br.com.simba.model.entities;
import br.com.simba.model.dao.ManagerDAO;
import br.com.simba.model.valueobject.*;

import java.sql.Connection;

public class Manager extends User {
    private CPF CPF;
    private School school;

    public Manager(Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password, CPF CPF, School school) {
        super(username, name, street, number, neighborhood, city, stateAbbr, email, password);
        this.CPF = CPF;
        this.school = school;
    }

    public Manager(int id, Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password, CPF CPF, School school) {
        super(id, username, name, street, number, neighborhood, city, stateAbbr, email, password);
        this.CPF = CPF;
    }

    public void addToDatabase(Connection connection){
        ManagerDAO managerDAO = new ManagerDAO(connection);
        managerDAO.insert(this);
    }

    public String getCPF() {
        return CPF.toString();
    }

    public int getSchoolId(){
        return school.getId();
    }

}
