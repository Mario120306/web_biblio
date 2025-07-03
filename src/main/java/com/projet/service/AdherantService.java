package com.projet.service;

import com.projet.entity.Adherant;
import com.projet.repository.AdherantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdherantService {

    @Autowired
    private AdherantRepository adherantRepository;

    public boolean verifierAdherant(String nom, String password) {
        Adherant adherant = adherantRepository.findByNom(nom);
        return Adherant.verifierAdherant(adherant, nom, password);
    }

    public List<Adherant> findAll() {
        return adherantRepository.findAll();
    }

    public java.util.Optional<Adherant> findById(int id) {
        return adherantRepository.findById(id);
    }

    public Adherant findByNom(String nom) {
        return adherantRepository.findByNom(nom);
    }
}
