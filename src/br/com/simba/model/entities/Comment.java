package br.com.simba.model.entities;

public class Comment {
    private int id;
    private String text;
    private int recordId;

    public Comment(String text, int recordId) {
        this.text = text;
        this.recordId = recordId;
    }
    public int getId() {
        return id;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public int getRecordId() {
        return recordId;
    }
    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }
    
    //ToDo

    public void associateComment() {
        
    }

    public void updateComment(String text) {
        this.text = text;
    }

    public void deleteComment() {
        this.text = null;

    }

    public void listCommentsPerBarrier() {
        
    }
}
