package br.com.simba.model.entities;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.PictureDAO;
import br.com.simba.model.dao.PostgresConnection;
import org.postgresql.jdbc.PgConnection;

import java.sql.Connection;
import java.time.LocalDate;

public class Picture {
    private int id;
    private String imagePath;
    private LocalDate uploadDate;

    public Picture(int id, String imagePath, LocalDate uploadDate) {
        this.id = id;
        this.imagePath = imagePath;
        this.uploadDate = uploadDate;
    }

    public Picture(String imagePath, LocalDate uploadDate) {
        this.imagePath = imagePath;
        this.uploadDate = uploadDate;
    }

    public void setId(int id){
        this.id = id;
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

    public boolean addToDatabase(){
        DBConnection dbConnection = new PostgresConnection();

        try (Connection connection = dbConnection.getConnection()){
            PictureDAO pictureDAO = new PictureDAO(connection);
            pictureDAO.insert(this);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //ToDo

    public void uploadPicture() {

    }

    public void updatePicture(){

    }

    public void deletePicture() {

    }
}
