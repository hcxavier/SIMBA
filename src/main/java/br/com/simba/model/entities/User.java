package br.com.simba.model.entities;
import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.ManagerDAO;
import br.com.simba.model.valueobject.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class User {
    private int id;
    private Username username;
    private String name;
    private Address address;
    private Email email;
    private Password password;
    private List<Record> records = new ArrayList<>();

    public User(Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password) {
        this.username = username;
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
        this.email = email;
        this.password = password;
        this.records = new ArrayList<>();
    }

    public User(int id, Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password) {
        this.username = username;
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
        this.email = email;
        this.password = password;
        this.records = new ArrayList<>();
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username.toString();
    }

    public String getName() {
        return name;
    }

    public String getStreet() {
        return address.getStreet();
    }

    public int getAddressNumber() {
        return address.getNumber();
    }

    public String getNeighborhood() {
        return address.getNeighborhood();
    }

    public String getCity() {
        return address.getCity();
    }

    public String getStateAbbr() {
        return address.getStateAbbr();
    }

    public String getEmail() {
        return email.toString();
    }

    public String getHashedPassword() {
        return password.getHash();
    }

    public List<Record> getRecords() {
        return records;
    }

    public int getId() {
        return id;
    }
}