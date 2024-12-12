package com.klef.jfsd.oasgs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.oasgs.model.StudentCourseMapping;

@Repository
public interface StudentCourseMappingRepository  extends JpaRepository<StudentCourseMapping, Integer>
{
	boolean existsBySidAndCcode(int sid, String ccode);
	
	List<StudentCourseMapping> findBySid(int sid);
	
	List<StudentCourseMapping> findByFid(int fid);
}
