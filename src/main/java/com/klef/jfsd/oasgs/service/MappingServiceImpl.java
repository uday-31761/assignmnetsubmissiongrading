package com.klef.jfsd.oasgs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.oasgs.model.Course;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.model.StudentCourseMapping;
import com.klef.jfsd.oasgs.repository.CourseRepository;
import com.klef.jfsd.oasgs.repository.FacultyRepository;
import com.klef.jfsd.oasgs.repository.StudentCourseMappingRepository;
import com.klef.jfsd.oasgs.repository.StudentRepsitory;

@Service
public class MappingServiceImpl implements MappingService
{
	@Autowired
	private StudentCourseMappingRepository studentCourseMappingRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private StudentRepsitory studentRepsitory;

	@Override
	public String studentcoursemapping(StudentCourseMapping studentCourseMapping) 
	{
	        boolean alreadyEnrolled = studentCourseMappingRepository.existsBySidAndCcode(studentCourseMapping.getSid(), studentCourseMapping.getCcode());

	        if (alreadyEnrolled) 
	        {
	            return "You have already enrolled in this course.";
	        }
	        
	        studentCourseMappingRepository.save(studentCourseMapping);
	        return "Student Course Mapped Successfully";
	}

	@Override
	public List<Course> findbysid(int sid) {
		
		List<StudentCourseMapping> scm=studentCourseMappingRepository.findBySid(sid);
		
		List<Course> c=new ArrayList<>();
		
		for(var e:scm)
		{
			c.add(courseRepository.getById(e.getCcode()));
		}
		
		return c;		
	}

	@Override
	public List<Student> findbyfid(int fid) {
		List<StudentCourseMapping> scm=studentCourseMappingRepository.findByFid(fid);
		List<Student> st=new ArrayList<>();
		for(var e:scm)
		{
			st.add(studentRepsitory.getById(e.getSid()));
		}
		return st;
	}

	@Override
	public List<Course> coursesfindbyfid(int fid) {

		List<StudentCourseMapping> scm=studentCourseMappingRepository.findByFid(fid);
		
		List<Course> c=new ArrayList<>();
		
		for(var e:scm)
		{
			c.add(courseRepository.getById(e.getCcode()));
		}
		
		return c;
	}

}
