package br.com.simba.model.entities;
import java.time.LocalDate;

import br.com.simba.model.enums.BarrierCriticality;

public class Report {
    private int id;
    private String title;
    private LocalDate date;
    private Record record;
    private String observation;
    private String conclusion;

    public Report(int id, String title, LocalDate date, Record record, String observation) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.record = record;
        this.observation = observation;
    }

    public int getId() {
        return id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public LocalDate getDate() {
        return date;
    }
    public void setDate(LocalDate date) {
        this.date = date;
    }
    public Record getRecord() {
        return record;
    }
    public void setRecord(Record record) {
        this.record = record;
    }
    public String getObservation() {
        return observation;
    }
    public void setObservation(String observation) {
        this.observation = observation;
    }

    //ToDo
    
    public void updateReport(String title, LocalDate date, Record record, String observation) {
        this.title = title;
        this.date = date;
        this.record = record;
        this.observation = observation;
    }

    public String toString() {
        return "Report{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", date=" + date +
                ", record=" + record +
                ", observation='" + observation + '\'' +
                '}';
    }

    public void exportReport() {

    }

    public void inforStatus() {
    }

    public void inforObservation() {
    }
}
