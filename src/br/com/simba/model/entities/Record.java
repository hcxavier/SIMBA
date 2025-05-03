package br.com.simba.model.entities;

import br.com.simba.model.valueobject.*;

import java.time.LocalDate;

import br.com.simba.model.enums.*;

public class Record {
    private int id;
    private BarrierStatus status;
    private BarrierCriticality criticality;
    private String barrierSpecification;
    private String resolutionSuggestion;
    private String location;
    private Picture picture;
    private School school;
    private BarrierType barrierType;
    private LocalDate barrierIdentification;
    
    public Record(BarrierStatus status, BarrierCriticality criticality, Picture picture, School school, String location,
                  String barrierSpecification, String resolutionSuggestion, BarrierType barrierType, LocalDate barrierIdentification) {
        this.status = status;
        this.criticality = criticality;
        this.picture = picture;
        this.school = school;
        this.location = location;
        this.barrierSpecification = barrierSpecification;
        this.resolutionSuggestion = resolutionSuggestion;
        this.barrierType = barrierType;
        this.barrierIdentification = barrierIdentification;
    }

    public Record(String status, BarrierCriticality criticality, String location,
                  String barrierSpecification, String resolutionSuggestion, BarrierType barrierType, LocalDate barrierIdentification) {
        //this.status = status;
        this.criticality = criticality;
        this.location = location;
        this.barrierSpecification = barrierSpecification;
        this.resolutionSuggestion = resolutionSuggestion;
        this.barrierType = barrierType;
        this.barrierIdentification = barrierIdentification;
    }

    public LocalDate getBarrierIdentification() {
        return barrierIdentification;
    }

    public void setBarrierIdentification(LocalDate barrierIdentification) {
        this.barrierIdentification = barrierIdentification;
    }

    public BarrierType getBarrierType() {
        return barrierType;
    }
    public void setBarrierType(BarrierType barrierType) {
        this.barrierType = barrierType;
    }

    public void setSchool(School school) {
        this.school = school;
    }
    public School getSchool() {
        return school;
    }

    public int getId() {
        return id;
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
    public String getResolutionSuggestion() {
        return resolutionSuggestion;
    }
    public void setResolutionSuggestion(String resolutionSuggestion) {
        this.resolutionSuggestion = resolutionSuggestion;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    public void updateRecord(BarrierStatus status, BarrierCriticality criticality, Picture picture, School school, String location, String barrierSpecification, String resolutionSuggestion, BarrierType barrierType) {
        this.status = status;
        this.criticality = criticality;
        this.picture = picture;
        this.school = school;
        this.location = location;
        this.barrierSpecification = barrierSpecification;
        this.resolutionSuggestion = resolutionSuggestion;
        this.barrierType = barrierType;
    }
}
