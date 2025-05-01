package br.com.simba.model.entities;
import br.com.simba.model.valueobject.*;

public class Teacher extends User {
    private Siape siape;

    public Teacher(Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, String cep, Email email, Phone phone, Password password, Siape siape) {
        super(username, name, street, number, neighborhood, city, stateAbbr, cep, email, phone, password);
        this.siape = siape;
    }

    public Siape getSiape() {
        return siape;
    }
    public void setSiape(Siape siape) {
        this.siape = siape;
    }
}
