package br.com.simba.model.entities;
import br.com.simba.model.dao.StudentDAO;
import br.com.simba.model.valueobject.*;

public class Student extends User{
    private String enrollmentId;

    public Student(int id, Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password, String enrollmentId) {
        super(id, username, name, street, number, neighborhood, city, stateAbbr, email, password);
        this.enrollmentId = enrollmentId;
    }

    public void addToDatabase(){
        StudentDAO studentDAO = new StudentDAO();
        studentDAO.insertNewStudent(this);
    }

    public String getEnrollmentId() {
        return enrollmentId;
    }
}

