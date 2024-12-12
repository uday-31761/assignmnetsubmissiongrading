package com.klef.jfsd.oasgs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.oasgs.model.Assignment;

@Repository
public interface AssignmnetRepository extends JpaRepository<Assignment, Integer>
{
	public List<Assignment> findByCourseCode(String courseCode);
}
