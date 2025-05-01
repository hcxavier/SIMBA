package br.com.simba.model.entities;
import br.com.simba.model.valueobject.*;

public class Student extends User{
    private String registrationNumber;

    public Student(Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, String cep, Email email, Phone phone, String password, String registrationNumber) {
        super(username, name, street, number, neighborhood, city, stateAbbr, cep, email, phone, password);
        this.registrationNumber = registrationNumber;
    }
    public String getRegistrationNumber() {
        return registrationNumber;
    }
    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

}

