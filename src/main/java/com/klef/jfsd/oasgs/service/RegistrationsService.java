package com.klef.jfsd.oasgs.service;

import com.klef.jfsd.oasgs.model.Registrations;
import com.klef.jfsd.oasgs.repository.RegistrationsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistrationsService {

    @Autowired
    private RegistrationsRepository registrationsRepository;


    public Registrations getCurrentStatus() {
    	
        return registrationsRepository.findById(1);
    }

    public void save(Registrations registration) {
        registrationsRepository.save(registration);
    }
}
