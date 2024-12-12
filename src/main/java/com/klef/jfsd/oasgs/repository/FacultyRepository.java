package com.klef.jfsd.oasgs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.oasgs.model.Faculty;
import com.klef.jfsd.oasgs.model.FacultyCourseMapping;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer>
{
	
}
