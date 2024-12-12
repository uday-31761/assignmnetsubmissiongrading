package com.klef.jfsd.oasgs.model;

import java.time.LocalDate;
import jakarta.persistence.*;

@Entity
@Table(name = "assignment_table")
public class Assignment 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, unique = true)
	private int id;

	@Column(name = "title", nullable = false)
	private String title;

	@Column(name = "description")
	private String description;

	@Column(name = "start_date")
	private LocalDate startDate;

	@Column(name = "due_date")
	private LocalDate dueDate;

	@Column(name = "course_code", nullable = false)
	private String courseCode;

	@Column(name = "status", nullable = false)
	private String status;
	
	@Lob
    @Column(name = "file", columnDefinition = "MEDIUMBLOB", nullable = true)
    private byte[] file;

	// New attribute for maximum grade
	@Column(name = "maximum_grade", nullable = false)
	private int maximumGrade;

	// Constructors, including the new field
	public Assignment() {
	}

	public Assignment(int id, String title, String description, LocalDate startDate, LocalDate dueDate,
			String courseCode, String status, byte[] file, int maximumGrade) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.startDate = startDate;
		this.dueDate = dueDate;
		this.courseCode = courseCode;
		this.status = status;
		this.file = file;
		this.maximumGrade = maximumGrade;
	}

	// Getters and setters for all attributes
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getDueDate() {
		return dueDate;
	}

	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

	public int getMaximumGrade() {
		return maximumGrade;
	}

	public void setMaximumGrade(int maximumGrade) {
		this.maximumGrade = maximumGrade;
	}
}
