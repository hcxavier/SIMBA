package br.com.simba.model.entities;
import br.com.simba.model.valueobject.*;

public class Student extends User{
    private int enrollmentId;

    public Student(int id, String username, String name, String street, int number , String neighborhood, String city, String stateAbbr, String email, String password, int enrollmentId) {
        super(id, username, name, street, number, neighborhood, city, stateAbbr, email, password);
        this.enrollmentId = enrollmentId;
    }
    public int getEnrollmentId() {
        return enrollmentId;
    }
}

