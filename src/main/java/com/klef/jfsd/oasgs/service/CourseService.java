package com.klef.jfsd.oasgs.service;

import java.util.List;

import com.klef.jfsd.oasgs.model.Course;
import com.klef.jfsd.oasgs.model.Faculty;

public interface CourseService
{
	public String addcourse(Course course);
	public List<Course> viewallcoursess();
	public String deletecourse(String code);
	public String updatecourse(Course course);
	public Course viewcoursebycode(String code);
	
	public long getCourseCount();
	
}
