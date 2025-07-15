package com.projet.service;
import com.projet.entity.Prolongement;
import com.projet.repository.ProlongementRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ProlongementService {
  
    @Autowired
    private ProlongementRepository prolongementRepository;

    public List<Prolongement> findAll() {
        return prolongementRepository.findAll();
    }

    public Optional<Prolongement> findById(int id) {
        return prolongementRepository.findById(id);
    }

    /*public Prolongement save(Profil profil) {
        return profilRepository.save(profil);
    }

    public void deleteById(int id) {
        profilRepository.deleteById(id);
    }*/
    public Prolongement save(Prolongement prolongement){
       return prolongementRepository.save(prolongement);
    }
    public List<Prolongement> getAllProlongement() {
        return prolongementRepository.findAll();
    }
}
