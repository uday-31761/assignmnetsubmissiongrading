package com.klef.jfsd.oasgs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.oasgs.model.Course;
import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.model.Submission;
import com.klef.jfsd.oasgs.repository.CourseRepository;
import com.klef.jfsd.oasgs.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.oasgs.repository.StudentRepsitory;
import com.klef.jfsd.oasgs.repository.SubmissionRepository;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentRepsitory studentRepsitory;

	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;

	@Autowired
	private CourseRepository courseRepository;

	@Autowired
	private SubmissionRepository submissionRepository;
	
	@Override
	public String addstudent(Student student) {
		studentRepsitory.save(student);
		return "Student Added Successfully..";
	}

	public Student viewstudentbyid(int sid) {
		Optional<Student> object = studentRepsitory.findById(sid);
		return object.get();
	}

	@Override
	public List<Student> viewallstudents() {
		return studentRepsitory.findAll();
	}

	@Override
	public String deletestudent(int sid) {
		studentRepsitory.deleteById(sid);
		return "Student Deleted Successfully.";
	}

	@Override
	public String updatestduent(Student student) {
		Optional<Student> object = studentRepsitory.findById(student.getId());
		String msg = null;

		if (object.isPresent()) {

			Student st = object.get();

			st.setName(student.getName());
			st.setGender(student.getGender());
			st.setAge(student.getAge());
			st.setDepartment(student.getDepartment());

			studentRepsitory.save(st);

			return "Student Updated Successfully";
		} else {
			return "Student ID Not Found to Update..";
		}
	}

	public Student viewStudentById(int sid) {
		try {
			return studentRepsitory.findById(sid).get();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Faculty> getListOfFaculty(String ccode) {

		Course course = courseRepository.getById(ccode);

		List<FacultyCourseMapping> fcmList = facultyCourseMappingRepository.findByCourse(course);

		List<Faculty> f = new ArrayList<>();

		for (FacultyCourseMapping fcm : fcmList) {
			f.add(fcm.getFaculty());
		}

		return f;
	}

	@Override
	public String updatestudentprofile(Student student) 
	{
		Student st = new Student();

		st.setId(student.getId());
		st.setName(student.getName());
		st.setGender(student.getGender());
		st.setAge(student.getAge());
		st.setDepartment(student.getDepartment());

		studentRepsitory.save(st);

		return "Student Updated Successfully";
	}

	@Override
	public void addSubmission(Submission submission) {
		submissionRepository.save(submission);
	}

	@Override
	public List<Submission> viewSubmissions(int id) {
		return submissionRepository.findByAssignmentId(id);
	}
	
	@Override
	public long getStudentCount() 
	{
	    return studentRepsitory.count();
	}


}
