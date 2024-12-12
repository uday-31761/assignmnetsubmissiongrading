package com.klef.jfsd.oasgs.model;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "faculty_course_mapping")
public class FacultyCourseMapping implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "faculty_id", nullable = false)
	private Faculty faculty;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "course_code", nullable = false)
	private Course course;

	@Column(name = "assigned_date")
	private String assignedDate;


	// Default Constructor
	public FacultyCourseMapping() {
	}

	// Parameterized Constructor
	public FacultyCourseMapping(Faculty faculty, Course course, String assignedDate ) {
		this.faculty = faculty;
		this.course = course;
		this.assignedDate = assignedDate;
//		this.role = role;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(String assignedDate) {
		this.assignedDate = assignedDate;
	}

	@Override
	public String toString() {
		return "FacultyCourseMapping [id=" + id + ", faculty=" + faculty + ", course=" + course + ", assignedDate="
				+ assignedDate + "]";
	}


}