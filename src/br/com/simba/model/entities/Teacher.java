package br.com.simba.model.entities;
import br.com.simba.model.valueobject.*;

public class Teacher extends User {
    private Siape siape;

    public Teacher(int id, String username, String name, String street, int number , String neighborhood, String city, String stateAbbr, String email, String password, String siape) {
        super(id, username, name, street, number, neighborhood, city, stateAbbr, email, password);
        this.siape = new Siape(siape);
    }

    public Siape getSiape() {
        return siape;
    }
    public void setSiape(Siape siape) {
        this.siape = siape;
    }
}
