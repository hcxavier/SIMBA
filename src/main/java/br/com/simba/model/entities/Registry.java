package br.com.simba.model.entities;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PictureDAO;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.enums.BarrierCategory;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.enums.BarrierStatus;

import java.sql.Connection;
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
                  String barrierSpecification, String resolutionSuggestion, BarrierCategory barrierCategory, LocalDate barrierIdentificationDate, Reporter reporter) {
        this.barrierStatus = BarrierStatus.UNDER_ANALYSIS;
        this.barrierCriticality = barrierCriticality;
        this.picture = picture;
        this.school = school;
        this.location = location;
        this.barrierSpecification = barrierSpecification;
        this.resolutionSuggestion = resolutionSuggestion;
        this.barrierCategory = barrierCategory;
        this.barrierIdentificationDate = barrierIdentificationDate;
        this.reporter = reporter;
    }

    public Registry(int id, BarrierCriticality barrierCriticality, Picture picture, School school, String location,
                    String barrierSpecification, String resolutionSuggestion, BarrierCategory barrierCategory, LocalDate barrierIdentificationDate, Reporter reporter, BarrierStatus barrierStatus) {
        this.id = id;
        this.barrierStatus = BarrierStatus.UNDER_ANALYSIS;
        this.barrierCriticality = barrierCriticality;
        this.picture = picture;
        this.school = school;
        this.location = location;
        this.barrierSpecification = barrierSpecification;
        this.resolutionSuggestion = resolutionSuggestion;
        this.barrierCategory = barrierCategory;
        this.barrierIdentificationDate = barrierIdentificationDate;
        this.reporter = reporter;
        this.barrierStatus = barrierStatus;
    }

    public boolean addToDatabase(){
        DBConnection dbConnection = new PostgresConnection();

        try (Connection connection = dbConnection.getConnection()){
            RegistryDAO registryDAO = new RegistryDAO(connection);
            registryDAO.insert(this);
            return true;
        } catch (Exception e) {
            return false;
        }
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

    public int getPictureId(){
        return picture.getId();
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

    public void setBarrierStatus(BarrierStatus barrierStatus) {
        this.barrierStatus = barrierStatus;
    }

    public void setBarrierCriticality(BarrierCriticality barrierCriticality) {
        this.barrierCriticality = barrierCriticality;
    }

    public void setBarrierSpecification(String barrierSpecification) {
        this.barrierSpecification = barrierSpecification;
    }

    public void setResolutionSuggestion(String resolutionSuggestion) {
        this.resolutionSuggestion = resolutionSuggestion;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setPicture(Picture picture) {
        this.picture = picture;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public void setBarrierType(BarrierCategory barrierCategory) {
        this.barrierCategory = barrierCategory;
    }

    public void setBarrierIdentificationDate(LocalDate barrierIdentificationDate) {
        this.barrierIdentificationDate = barrierIdentificationDate;
    }

    public void setReporter(Reporter reporter) {
        this.reporter = reporter;
    }
}
