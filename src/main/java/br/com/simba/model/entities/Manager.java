package br.com.simba.model.entities;
import br.com.simba.model.dao.ManagerDAO;
import br.com.simba.model.valueobject.*;

import java.sql.Connection;

public class Manager extends User {
    private Siape siape;
    private School school;

    public Manager(Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password, Siape siape, School school) {
        super(username, name, street, number, neighborhood, city, stateAbbr, email, password);
        this.siape = siape;
        this.school = school;
    }

    public Manager(int id, Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password, Siape siape, School school) {
        super(id, username, name, street, number, neighborhood, city, stateAbbr, email, password);
        this.siape = siape;
    }

    public void addToDatabase(Connection connection){
        ManagerDAO managerDAO = new ManagerDAO(connection);
        managerDAO.insert(this);
    }

    public String getSiape() {
        return siape.toString();
    }

    public int getSchoolId(){
        return school.getId();
    }

}
