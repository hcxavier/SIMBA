package br.com.simba.model.entities;
import br.com.simba.model.dao.TeacherDAO;
import br.com.simba.model.valueobject.*;

public class Teacher extends User {
    private Siape siape;

    public Teacher(int id, Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password, Siape siape) {
        super(id, username, name, street, number, neighborhood, city, stateAbbr, email, password);
        this.siape = siape;
    }

    public void addToDatabase(){
        TeacherDAO teacherDAO = new TeacherDAO();
        teacherDAO.createNewTeacher(this);
    }

    public Siape getSiape() {
        return siape;
    }
    public void setSiape(Siape siape) {
        this.siape = siape;
    }
}
