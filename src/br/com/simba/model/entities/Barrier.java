package br.com.simba.model.entities;

import java.util.List;

public class Barrier {
    private int id;
    private String description;
    private String tipoBarreira;
    private String difficultyResolving;
    private List<Comment> comments;

    public Barrier(int id, String description, String tipoBarreira, String difficultyResolving, List<Comment> comments) {
        this.id = id;
        this.description = description;
        this.tipoBarreira = tipoBarreira;
        this.difficultyResolving = difficultyResolving;
        this.comments = comments;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getTipoBarreira() {
        return tipoBarreira;
    }
    public void setTipoBarreira(String tipoBarreira) {
        this.tipoBarreira = tipoBarreira;
    }
    public String getDifficultyResolving() {
        return difficultyResolving;
    }
    public void setDifficultyResolving(String difficultyResolving) {
        this.difficultyResolving = difficultyResolving;
    }
    public List<Comment> getComments() {
        return comments;
    }
    public void addComment(Comment comment) {
        this.comments.add(comment);
    }
    public void removeComment(Comment comment) {
        this.comments.remove(comment);
    }
}
