package com.projet.service;

import com.projet.entity.Penalite;
import com.projet.repository.PenaliteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PenaliteService {

    @Autowired
    private PenaliteRepository penaliteRepository;

    public List<Penalite> findAll() {
        return penaliteRepository.findAll();
    }

    public Optional<Penalite> findById(int id) {
        return penaliteRepository.findById(id);
    }

    public Penalite save(Penalite penalite) {
        return penaliteRepository.save(penalite);
    }

    public void deleteById(int id) {
        penaliteRepository.deleteById(id);
    }
}
