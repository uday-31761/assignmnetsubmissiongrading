package com.klef.jfsd.oasgs.service;

import java.util.List;

import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.model.Submission;

public interface StudentService
{
	public String addstudent(Student student);
	public Student viewstudentbyid(int sid);
	public List<Student> viewallstudents();
	public String deletestudent(int sid);
	public String updatestduent(Student student);
	public Student viewStudentById(int sid);
	public List<Faculty> getListOfFaculty(String ccode);
	public String updatestudentprofile(Student student);
	
	public void addSubmission(Submission submission);
	
	public List<Submission> viewSubmissions(int id);
	
	public long getStudentCount() ;

}
