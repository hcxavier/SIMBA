package br.com.simba;

import br.com.simba.model.dao.*;
import br.com.simba.model.entities.*;
import br.com.simba.model.valueobject.*;

public class Main {
    public static void main(String[] args) {
        StudentDAO studentDAO = new StudentDAO();

        Username username = new Username("maiko_sousa");
        String name = "maiko";
        Address address = new Address("Rua das Flores", 123, "Centro", "São Paulo", "SP", "01001-000");
        Email email = new Email(name + "@gmail.com");
        Phone phone = new Phone("11987654321");
        String password = "1234";
        String registrationNumber = "123456789";

        Student student = new Student(username, name, address, email, phone, password, registrationNumber);
        studentDAO.insert(student);
        

        SchoolDAO schoolDAO = new SchoolDAO();
        String schoolName = "Escola Primária";
        Address schoolAddress = new Address("Rua das Flores", 123, "Centro", "São Paulo", "SP", "01001-000");
        Phone schoolPhone = new Phone("11987876543");
        School school = new School(schoolName, schoolAddress, schoolPhone);
        schoolDAO.insert(school);
        
        
        //studentDAO.update("4321", student);

    }
}
