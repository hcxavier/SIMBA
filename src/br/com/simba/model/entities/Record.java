package br.com.simba.model.entities;

import br.com.simba.model.valueobject.Address;
import br.com.simba.model.enums.*;

public class Record {
    private int id;
    private Address address;
    private BarrierStatus status;
    private BarrierCriticality criticality;
    private Picture picture;
    private Barrier barrier;
    
    public Record(int id, Address address, BarrierStatus status, BarrierCriticality criticality, Picture picture, Barrier barrier) {
        this.id = id;
        this.address = address;
        this.status = status;
        this.criticality = criticality;
        this.picture = picture;
        this.barrier = barrier;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Address getAddress() {
        return address;
    }
    public void setAddress(Address address) {
        this.address = address;
    }
    public BarrierStatus getStatus() {
        return status;
    }
    public void setStatus(BarrierStatus status) {
        this.status = status;
    }
    public BarrierCriticality getCriticality() {
        return criticality;
    }
    public void setCriticality(BarrierCriticality criticality) {
        this.criticality = criticality;
    }
    public Picture getPicture() {
        return picture;
    }
    public void setPicture(Picture picture) {
        this.picture = picture;
    }
    public Barrier getBarrier() {
        return barrier;
    }
    public void setBarrier(Barrier barrier) {
        this.barrier = barrier;
    }
    public void updateRecord(Address address, BarrierStatus status, BarrierCriticality criticality, Picture picture, Barrier barrier) {
        this.address = address;
        this.status = status;
        this.criticality = criticality;
        this.picture = picture;
        this.barrier = barrier;
    }
}
