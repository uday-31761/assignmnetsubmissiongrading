package com.klef.jfsd.oasgs.service;

import java.util.List;

import com.klef.jfsd.oasgs.model.Course;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.model.StudentCourseMapping;

public interface MappingService 
{
	public String studentcoursemapping(StudentCourseMapping studentCourseMapping);
	public List<Course> findbysid(int sid);
	public List<Student> findbyfid(int fid);
	public List<Course> coursesfindbyfid(int fid);
	
}