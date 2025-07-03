package com.projet.service;

import com.projet.entity.Profil;
import com.projet.repository.ProfilRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProfilService {

    @Autowired
    private ProfilRepository profilRepository;

    public List<Profil> findAll() {
        return profilRepository.findAll();
    }

    public Optional<Profil> findById(int id) {
        return profilRepository.findById(id);
    }

    public Profil save(Profil profil) {
        return profilRepository.save(profil);
    }

    public void deleteById(int id) {
        profilRepository.deleteById(id);
    }
}