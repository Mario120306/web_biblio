package com.projet.service;

import com.projet.entity.Adherant;
import com.projet.repository.AdherantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdherantService {

    @Autowired
    private AdherantRepository adherantRepository;

    public boolean verifierAdherant(String nom, String password) {
        Adherant adherant = adherantRepository.findByNom(nom);
        return Adherant.verifierAdherant(adherant, nom, password);
    }
}
