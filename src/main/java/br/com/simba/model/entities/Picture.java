package br.com.simba.model.entities;

import java.time.LocalDate;

public class Picture {
    private int id;
    private String imagePath;
    private LocalDate uploadDate;
    private String description;
    private int registryId;

    public Picture(String imagePath, LocalDate uploadDate, String description, int registryId) {
        this.imagePath = imagePath;
        this.uploadDate = uploadDate;
        this.description = description;
        this.registryId = registryId;
    }

    public void setId(int id){
        this.id = id;
    }
    public void setRegistryId(int recordId) {
        this.registryId = registryId;
    }
    public int getRegistryId() {
        return registryId;
    }

    public int getId() {
        return id;
    }
    public String getImagePath() {
        return imagePath;
    }
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    public LocalDate getUploadDate() {
        return uploadDate;
    }
    public void setUploadDate(LocalDate uploadDate) {
        this.uploadDate = uploadDate;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    //ToDo

    public void uploadPicture() {

    }

    public void updatePicture(){

    }

    public void deletePicture() {

    }
}
