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
    private Phone phone;
    private Password password;
    private List<Record> records = new ArrayList<>();

    public User(Username username, String name, String street, int number , String neighborhood, String city, String stateAbbr, String cep, Email email, Phone phone, Password password) {
        this.username = username;
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr, cep);
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.records = new ArrayList<>();
    }

    public User(Username username, String name, Object address, Object email, Object phone, String password) {
        this.username = username;
        this.name = name;
        this.address = (Address) address;
        this.email = (Email) email;
        this.phone = (Phone) phone;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public Username getUsername() {
        return username;
    }
    public void setUsername(Username username) {
        this.username = username;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Address getAddress() {
        return address;
    }
    public void setAddress(Address address) {
        this.address = address;
    }
    public Email getEmail() {
        return email;
    }
    public void setEmail(Email email) {
        this.email = email;
    }
    public Phone getPhone() {
        return phone;
    }
    public void setPhone(Phone phone) {
        this.phone = phone;
    }
    public Password getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void addRecord(Record record) {
        this.records.add(record);
    }
    public void removeRecord(Record record) {
        this.records.remove(record);
    }
    
    // ToDo

    public void login(String username, String password) {
        
    }
    public void logout() {
        
    }
    
    public void changePassword(String password) {
        if (!validatePassword(password)) {
            throw new IllegalArgumentException("Invalid password");
        }
        this.password = password;
    }

    private Boolean validatePassword(String password) {

        return true;
    }
    public void updateProfile(String name, Address address, Email email, Phone phone, String password) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }
    public List<Record> listRecords(){

        return records;
    }
}
