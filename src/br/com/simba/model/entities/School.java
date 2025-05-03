package br.com.simba.model.entities;

import br.com.simba.model.valueobject.*;

public class School {
    private int id;
    private String name;
    private Address address;
    private Phone phone;
     

    public School(String name, String street, int number , String neighborhood, String city, String stateAbbr, Phone phone) {
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
        this.phone = phone;
    }

    public School(String name,  String street, int number , String neighborhood, String city, String stateAbbr, String phone) {
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
        this.phone = new Phone(phone); 
    }
    
    public int getId() {
        return id;
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
    public Phone getPhone() {
        return phone;
    }
    public void setPhone(Phone phone) {
        this.phone = phone;
    }

    //ToDo

    public void addRecord(Record record){}
    public void removeRecord(Record record){}
    public void listRecords(){}
    public void listBarriers(){}
}
