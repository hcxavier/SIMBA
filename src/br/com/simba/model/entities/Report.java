package br.com.simba.model.entities;
import java.time.LocalDate;

public class Report {
    private int id;
    private String title;
    private LocalDate date;
    private Record record;
    private String observation;
    private String conclusion;
    private int recordId;
    private String managerId;

    public Report(String title, LocalDate date, Record record, String observation, String conclusion, int recordId, String managerId) {
        this.title = title;
        this.date = date;
        this.record = record;
        this.observation = observation;
        this.conclusion = conclusion;
        this.recordId = recordId;
        this.managerId = managerId;
    }

    public Report(String title, String date, String observation, String conclusion) {
        this.title = title;
        this.date = LocalDate.parse(date);
        this.observation = observation;
        this.conclusion = conclusion;
    }

    public String getManagerId(){
        return managerId;
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
    public void setConclusion(String conclusion){
        this.conclusion = conclusion;
    };
    public String getConclusion(){
        return conclusion;
    }
    public void setRecordId(int id){
        this.recordId = id;
    }
    public int getRecordId(){
        return recordId;
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
