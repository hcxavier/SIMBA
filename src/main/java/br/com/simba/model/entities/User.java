package br.com.simba.model.entities;
import br.com.simba.model.valueobject.*;

import java.util.ArrayList;
import java.util.List;

public class User {
    private int id;
    private Username username;
    private String name;
    private Address address;
    private Email email;
    private Password password;
    private String userType;
    private List<Record> records = new ArrayList<>();

    public User(Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password, String userType) {
        this.username = username;
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
        this.email = email;
        this.password = password;
        this.userType = userType;
        this.records = new ArrayList<>();
    }

    public User(int id, Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, Email email, Password password, String userType) {
        this.username = username;
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
        this.email = email;
        this.password = password;
        this.records = new ArrayList<>();
        this.userType = userType;
        this.id = id;
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

    public String getUserType(){
        return userType;
    }

    public int getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String street, int number, String neighborhood, String city, String stateAbbr) {
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
    }

    public void setEmail(Email email) {
        this.email = email;
    }

    public void setPassword(Password password) {
        this.password = password;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void setUsername(Username username) {
        this.username = username;
    }


    public Password getPassword() {
        return password;
    }
}