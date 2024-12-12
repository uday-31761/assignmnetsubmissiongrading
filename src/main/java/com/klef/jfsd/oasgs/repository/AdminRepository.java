package com.klef.jfsd.oasgs.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.oasgs.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String>
{

}

