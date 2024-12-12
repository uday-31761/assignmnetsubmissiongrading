package com.klef.jfsd.oasgs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.oasgs.model.Admin;
import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
import com.klef.jfsd.oasgs.repository.AdminRepository;
import com.klef.jfsd.oasgs.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.oasgs.repository.FacultyRepository;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepository;

	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;

	@Override
	public Admin viewadminbyid(String username) {
		return adminRepository.findById(username).get();
	}

	@Override
	public void fcmapping(FacultyCourseMapping mapping) {
		FacultyCourseMapping existingMapping = facultyCourseMappingRepository
				.findByFacultyIdAndCourseCode(mapping.getFaculty().getId(), mapping.getCourse().getCode());

		if (existingMapping == null) {
			facultyCourseMappingRepository.save(mapping);
		} else {
			throw new IllegalArgumentException("Faculty is already mapped to this course.");
		}
	}

	@Override
	public List<FacultyCourseMapping> viewfacultycoursemapping() {
		return facultyCourseMappingRepository.findAll();
	}

	public String facultycoursemapping(int id) {
	    Optional<FacultyCourseMapping> mapping = facultyCourseMappingRepository.findById(id);
	    if (mapping.isPresent()) {
	        facultyCourseMappingRepository.deleteById(id);
	        return "Faculty Course Mapping Deleted Successfully";
	    } else {
	        throw new IllegalArgumentException("Mapping with ID " + id + " not found.");
	    }
	}
	
	

}
