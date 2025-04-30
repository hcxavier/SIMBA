package br.com.simba.model.entities;

import java.util.List;

public class Barrier {
    private int id;
    private String description;
    private String barrierType;
    private String difficultyResolving;
    private List<Comment> comments;

    public Barrier(int id, String description, String barrierType, String difficultyResolving, List<Comment> comments) {
        this.id = id;
        this.description = description;
        this.barrierType = barrierType;
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
    public String getBarrierType() {
        return barrierType;
    }
    public void setBarrierType(String barrierType) {
        this.barrierType = barrierType;
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
