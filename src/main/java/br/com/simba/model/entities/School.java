package br.com.simba.model.entities;

import br.com.simba.model.valueobject.Address;
import br.com.simba.model.valueobject.CNPJ;
import br.com.simba.model.valueobject.Phone;

public class School {
    private int id;
    private String name;
    private Address address;
    private Phone phone;
    private CNPJ cnpj;

    public School(int id, String name, String street, int number , String neighborhood, String city, String stateAbbr, Phone phone, CNPJ cnpj) {
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
        this.phone = phone;
        this.cnpj = cnpj;
        this.id = id;
    }

    public School(String name, String street, int number , String neighborhood, String city, String stateAbbr, Phone phone, CNPJ cnpj) {
        this.name = name;
        this.address = new Address(street, number, neighborhood, city, stateAbbr);
        this.phone = phone;
        this.cnpj = cnpj;
    }

    public String getCnpj(){
        return cnpj.toString();
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getStreet() {
        return address.getStreet();
    }

    public int getAddressNumber(){
        return address.getNumber();
    }

    public String getNeighborhood(){
        return address.getNeighborhood();
    }

    public String getCity(){
        return address.getCity();
    }

    public String getState(){
        return address.getStateAbbr();
    }

    public String getPhone() {
        return phone.toString();
    }

    public void setId(int id) {
        this.id = id;
    }
}
