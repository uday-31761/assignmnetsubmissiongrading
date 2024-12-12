package com.klef.jfsd.oasgs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.oasgs.model.Assignment;
import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
import com.klef.jfsd.oasgs.model.Student;
import com.klef.jfsd.oasgs.repository.AssignmnetRepository;
import com.klef.jfsd.oasgs.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.oasgs.repository.FacultyRepository;

@Service
public class FacultyServiceImpl implements FacultyService 
{
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;
	
	@Autowired
	private AssignmnetRepository assignmnetRepository;

	@Override
	public String addfaculty(Faculty faculty) 
	{
		facultyRepository.save(faculty);
		return "Faculty Added Successfully..";
	}

	@Override
	public Faculty viewfacultybyid(int id)
	{
	    Optional<Faculty> object = facultyRepository.findById(id);   
	    return object.get();
	}


	@Override
	public List<Faculty> viewallfaculty() 
	{
		return facultyRepository.findAll();
	}

	@Override
	public String deletefaculty(int fid) 
	{
		facultyRepository.deleteById(fid);
		return "Faculty Deleted Successfully.";
	}

	@Override
	public String updatefaculty(Faculty faculty) 
	{
		Optional<Faculty> object=facultyRepository.findById(faculty.getId());
		String msg=null;
		    
		if(object.isPresent())
		{
			Faculty fac=object.get();
		    
			fac.setName(faculty.getName());
			fac.setGender(faculty.getGender());
			fac.setDateofbirth(faculty.getDateofbirth());
			fac.setDepartment(faculty.getDepartment());
			fac.setSalary(faculty.getSalary());
			fac.setLocation(faculty.getLocation());
		    
		    facultyRepository.save(fac);
		    
		    return "Faculty Updated Successfully";
		}
		else
		{
		      return "Faculty ID Not Found to update.";
		}
	}
	
	@Override
	public List<FacultyCourseMapping> viewMappedCoursesForFaculty(int facultyId) 
	{
	    return facultyCourseMappingRepository.findByFaculty_Id(facultyId);
	}

	@Override
	public String AddAssignment(Assignment assignment) {
		assignmnetRepository.save(assignment);
		return "assignment added succesfully"; 
	}

	@Override
	public List<Assignment> viewallcourseAssignments(String ccode) {
		return assignmnetRepository.findByCourseCode(ccode);
	}

	@Override
	public Assignment FindAssById(int id) {
		return assignmnetRepository.findById(id).get();
	} 
	
	@Override
	public long getFacultyCount() {
	    return facultyRepository.count();
	}

}
