package com.klef.jfsd.oasgs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.oasgs.model.Course;
import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.repository.CourseRepository;
import com.klef.jfsd.oasgs.repository.StudentCourseMappingRepository;

@Service
public class CourseServiceImpl implements CourseService
{
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
    private StudentCourseMappingRepository mappingRepository;

	@Override
	public String addcourse(Course course) 
	{
		courseRepository.save(course);
		return "Course Added Successfully";
	}
	
	@Override
	public Course viewcoursebycode(String ccode)
	{
	    Optional<Course> object =  courseRepository.findById(ccode);  
	    return object.get();
	}

	@Override
	public List<Course> viewallcoursess()
	{
		return courseRepository.findAll();
	}

	@Override
	public String deletecourse(String code)
	{
		courseRepository.deleteById(code);
		return "Course Deleted Successfully";
	}

	
	@Override
	public String updatecourse(Course c)
	{
	    
	    Optional<Course> object = courseRepository.findById(c.getCode());
	    String msg=null;
	    System.out.println(c.getCode());
	    if(object.isPresent())
	    {
	      Course course =object.get();
	      course.setCredits(c.getCredits());
	      course.setName(c.getName());
	      course.setStartDate(c.getStartDate());
	      course.setEndDate(c.getEndDate());
	      
	      courseRepository.save(course);
	      return "Course Updated Successfully.";
	    }
	    else
	    {
	    	return "Course Code Not available to update contact to your administrator..";
	      
	    }
	  }
	
	@Override
	public long getCourseCount() 
	{
	    return courseRepository.count();
	}

}
