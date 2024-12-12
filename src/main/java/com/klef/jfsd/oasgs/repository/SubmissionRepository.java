package com.klef.jfsd.oasgs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.oasgs.model.Submission;

@Repository
public interface SubmissionRepository extends JpaRepository<Submission,Integer>
{
	List<Submission> findByAssignmentId(int assignmentId);
	
	@Query("select s from Submission s where s.assignmentId=?1 and s.studentId=?2")
	public Submission getSubmission(int aid,int sid);
	
}
