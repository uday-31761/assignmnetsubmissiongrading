package com.klef.jfsd.oasgs.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.oasgs.model.FacultyCourseMapping;
import java.util.List;
import com.klef.jfsd.oasgs.model.Course;


@Repository
public interface FacultyCourseMappingRepository extends JpaRepository<FacultyCourseMapping, Integer>
{
	FacultyCourseMapping findByFacultyIdAndCourseCode(int facultyId, String courseCode);

	@Query("SELECT COUNT(fcm) FROM FacultyCourseMapping fcm WHERE fcm.faculty.id = :facultyId AND fcm.course.code = :courseCode")
	long countByFacultyAndCourse(@Param("facultyId") int facultyId, @Param("courseCode") String courseCode);
	
	public List<FacultyCourseMapping> findByCourse(Course course);
	
	public List<FacultyCourseMapping> findByFaculty_Id(int facultyId);

}
