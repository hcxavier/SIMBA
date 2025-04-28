package br.com.simba.model.entities;

public class Comment {
    private int id;
    private String text;
    private Barrier barrier;

    public Comment(int id, String text, Barrier barrier) {
        this.id = id;
        this.text = text;
        this.barrier = barrier;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public Barrier getBarrier() {
        return barrier;
    }

    //ToDo

    public void associateComment(Barrier barrier) {
        this.barrier = barrier;
    }

    public void updateComment(String text) {
        this.text = text;
    }

    public void deleteComment() {
        this.text = null;
        this.barrier = null;
    }

    public void listCommentsPerBarrier(Barrier barrier) {
        
    }
}
