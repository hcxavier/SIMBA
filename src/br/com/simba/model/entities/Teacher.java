package br.com.simba.model.entities;
import br.com.simba.model.valueobject.*;

public class Teacher extends User {
    private Siape siape;

    public Teacher(Username username, String name, Address address, Email email, Phone phone, String password, Siape siape) {
        super(username, name, address, email, phone, password);
        this.siape = siape;
    }
    public Siape getSiape() {
        return siape;
    }
    public void setSiape(Siape siape) {
        this.siape = siape;
    }
}
