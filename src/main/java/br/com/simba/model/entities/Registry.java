package br.com.simba.model.entities;

import br.com.simba.model.enums.BarrierCategory;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.enums.BarrierStatus;

import java.time.LocalDate;

public class Registry {
    private int id;
    private BarrierStatus barrierStatus;
    private BarrierCriticality barrierCriticality;
    private String barrierSpecification;
    private String resolutionSuggestion;
    private String location;
    private Picture picture;
    private School school;
    private BarrierCategory barrierCategory;
    private LocalDate barrierIdentificationDate;
    private Reporter reporter;

    public Registry(BarrierCriticality barrierCriticality, Picture picture, School school, String location,
                  String barrierSpecification, String resolutionSuggestion, BarrierCategory barrierCategory, LocalDate barrierIdentificationDate) {
        this.barrierStatus = BarrierStatus.UNDER_ANALYSIS;
        this.barrierCriticality = barrierCriticality;
        this.picture = picture;
        this.school = school;
        this.location = location;
        this.barrierSpecification = barrierSpecification;
        this.resolutionSuggestion = resolutionSuggestion;
        this.barrierCategory = barrierCategory;
        this.barrierIdentificationDate = barrierIdentificationDate;
    }

    public void addToDatabase(){

    }

    public void setId(int id){
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public BarrierStatus getBarrierStatus() {
        return barrierStatus;
    }

    public BarrierCriticality getBarrierCriticality() {
        return barrierCriticality;
    }

    public String getBarrierSpecification() {
        return barrierSpecification;
    }

    public String getResolutionSuggestion() {
        return resolutionSuggestion;
    }

    public String getLocation() {
        return location;
    }

    public Picture getPicture() {
        return picture;
    }

    public School getSchool(){
        return school;
    }

    public int getSchoolId() {
        return school.getId();
    }

    public Reporter getReporter(){
        return reporter;
    }

    public int getReporterId(){
        return reporter.getId();
    }

    public BarrierCategory getBarrierType() {
        return barrierCategory;
    }

    public LocalDate getBarrierIdentificationDate() {
        return barrierIdentificationDate;
    }
}
