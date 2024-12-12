package com.klef.jfsd.oasgs.model;

import java.time.LocalDateTime;
import jakarta.persistence.*;

@Entity
@Table(name = "submission_table")
public class Submission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false, unique = true)
    private int id;

    @Column(name = "assignment_id", nullable = false)
    private int assignmentId;

    @Column(name = "student_id", nullable = false)
    private int studentId;

    @Column(name = "submitted_on", nullable = false)
    private LocalDateTime submittedOn;

    @Lob
    @Column(name = "file_data", nullable = false, columnDefinition = "MEDIUMBLOB")
    private byte[] fileData;

    @Column(name = "grade",nullable = true)
    private String grade;

    @Column(name = "status", nullable = false)
    private boolean status;

    // Default Constructor
    public Submission() {}

    // Parameterized Constructor
    public Submission(int assignmentId, int studentId, LocalDateTime submittedOn, 
                      byte[] fileData, String grade, boolean status) {
        this.assignmentId = assignmentId;
        this.studentId = studentId;
        this.submittedOn = submittedOn;
        this.fileData = fileData;
        this.grade = grade;
        this.status = status;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public LocalDateTime getSubmittedOn() {
        return submittedOn;
    }

    public void setSubmittedOn(LocalDateTime submittedOn) {
        this.submittedOn = submittedOn;
    }

    

    public byte[] getFileData() {
        return fileData;
    }

    public void setFileData(byte[] fileData) {
        this.fileData = fileData;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Submission{" +
               "id=" + id +
               ", assignmentId=" + assignmentId +
               ", studentId=" + studentId +
               ", submittedOn=" + submittedOn +
               ", grade='" + grade + '\'' +
               ", status=" + status +
               '}';
    }
}
