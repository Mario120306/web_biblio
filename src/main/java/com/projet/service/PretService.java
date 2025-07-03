package com.projet.service;

import com.projet.entity.Pret;
import com.projet.entity.Adherant;
import com.projet.repository.PretRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PretService {

    @Autowired
    private PretRepository pretRepository;

    public List<Pret> findAll() {
        return pretRepository.findAll();
    }

    public Pret save(Pret pret) {
        return pretRepository.save(pret);
    }

    public boolean insererPretSiQuota(Adherant adherant, Pret pret) {
        int quota = adherant.getProfil().getQuotaPret();
        int nbPrets = pretRepository.findByAdherant(adherant).size();
        if (nbPrets < quota) {
            pretRepository.save(pret);
            return true;
        }
        return false;
    }
}
