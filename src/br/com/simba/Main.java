package br.com.simba;

import br.com.simba.model.dao.*;
import br.com.simba.model.entities.Student;
import br.com.simba.model.valueobject.Address;
import br.com.simba.model.valueobject.Email;
import br.com.simba.model.valueobject.Phone;
import br.com.simba.model.valueobject.Username;

public class Main {
    public static void main(String[] args) {
        /*StudentDAO studentDAO = new StudentDAO();

        Username username = new Username("maiko_sousa");
        String name = "maiko";
        Address address = new Address("Rua das Flores", 123, "Centro", "São Paulo", "SP", "01001-000");
        Email email = new Email(name + "@gmail.com");
        Phone phone = new Phone("11987654321");
        String password = "1234";
        String registrationNumber = "123456789";

        Student student = new Student(username, name, address, email, phone, password, registrationNumber);
        //studentDAO.insert(student);
        studentDAO.delete(username);
        
        
        //studentDAO.update("4321", student);*/

    }
}
