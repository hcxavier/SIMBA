package br.com.simba.model.entities;
import br.com.simba.model.valueobject.*;
import java.util.ArrayList;
import java.util.List;

public class User {
    private Username username;
    private String name;
    private Address address;
    private Email email;
    private Phone phone;
    private String password;
    private List<Record> records = new ArrayList<>();

    public User(Username username, String name, Address address, Email email, Phone phone, String password) {
        this.username = username;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.records = new ArrayList<>();
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
    public String getPassword() {
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
