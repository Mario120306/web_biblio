package com.projet.service;

import com.projet.entity.Livre;
import com.projet.repository.LivreRepository;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class LivreService {

    @Autowired
    private LivreRepository livreRepository;

    public List<Livre> findAll() {
        return livreRepository.findAll();
    }

 /*public Optional<Livre> findById(int id) {
    return livreRepository.findById(id).map(livre -> {
        // Forcer le chargement des catégories
        livre.getCategories().size();
        return livre;
    });
}*/

    
    public Livre save(Livre livre) {
        return livreRepository.save(livre);
    }

    public void deleteById(int id) {
        livreRepository.deleteById(id);
    }


    @Transactional(readOnly = true)
    public Optional<Livre> findById(int id) {
        Optional<Livre> livreOpt = livreRepository.findById(id);

        // Forcer le chargement des catégories pendant que la session est active
        livreOpt.ifPresent(livre -> {
            Hibernate.initialize(livre.getCategories());
            // Forcer d'autres relations si besoin
        });

        return livreOpt;
    }

}