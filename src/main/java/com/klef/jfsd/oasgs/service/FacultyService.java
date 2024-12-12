package com.klef.jfsd.oasgs.service;

import java.util.List;

import com.klef.jfsd.oasgs.model.Assignment;
import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
import com.klef.jfsd.oasgs.model.Student;

public interface FacultyService 
{
	public String addfaculty(Faculty faculty);
	public Faculty viewfacultybyid(int fid);
	public List<Faculty> viewallfaculty();
	public String deletefaculty(int fid);
	public String updatefaculty(Faculty faculty);
	
	public List<FacultyCourseMapping> viewMappedCoursesForFaculty(int facultyId);
	
	public String AddAssignment(Assignment assignment);
	
	public List<Assignment> viewallcourseAssignments(String ccode);
	
	public Assignment FindAssById(int id);
	
	public long getFacultyCount();

}
