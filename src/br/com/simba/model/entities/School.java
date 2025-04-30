package br.com.simba.model.entities;

import br.com.simba.model.valueobject.*;

public class School {
    private int id;
    private String name;
    private Address address;
    private Phone phone;
     

    public School(String name, Address address, Phone phone) {
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    public School(int id, String name, String address, String phone) {
        this.id = id;
        this.name = name;
        this.address = new Address(address); 
        this.phone = new Phone(phone); 
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
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
