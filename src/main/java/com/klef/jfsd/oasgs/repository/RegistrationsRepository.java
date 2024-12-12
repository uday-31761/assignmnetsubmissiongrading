package com.klef.jfsd.oasgs.repository;

import com.klef.jfsd.oasgs.model.Registrations;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegistrationsRepository extends JpaRepository<Registrations, Integer>
{
    Registrations findById(int id);
}
