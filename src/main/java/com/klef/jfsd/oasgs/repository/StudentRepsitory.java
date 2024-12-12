package com.klef.jfsd.oasgs.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.oasgs.model.Student;

@Repository
public interface StudentRepsitory extends JpaRepository<Student, Integer>
{

}
