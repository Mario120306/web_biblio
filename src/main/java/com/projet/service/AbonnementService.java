package com.projet.service;
import com.projet.entity.Abonnement;
import com.projet.repository.AbonnementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Date;

@Service
public class AbonnementService {
    
    private final AbonnementRepository abonnementRepository;
    
    @Autowired
    public AbonnementService(AbonnementRepository abonnementRepository) {
        this.abonnementRepository = abonnementRepository;
    }
    
    // Créer un abonnement
    public Abonnement createAbonnement(Abonnement abonnement) {
        return abonnementRepository.save(abonnement);
    }
    
    // Récupérer tous les abonnements
    public List<Abonnement> getAllAbonnements() {
        return abonnementRepository.findAll();
    }
    
    // Récupérer un abonnement par son id
    public Optional<Abonnement> getAbonnementById(Integer id) {
        return abonnementRepository.findById(id);
    }
    
    // Mettre à jour un abonnement
    public Abonnement updateAbonnement(Abonnement abonnement) {
        return abonnementRepository.save(abonnement);
    }
    
    // Supprimer un abonnement
    public void deleteAbonnement(Integer id) {
        abonnementRepository.deleteById(id);
    }
    
    // Ajouter d'autres méthodes métier si nécessaire

    public boolean estAbonne(int idAdherent, Date date) {
        return getAllAbonnements().stream()
            .anyMatch(ab -> ab.getIdAdherent() == idAdherent
                && ab.getDateDebut() != null && ab.getDateFin() != null
                && !date.before(ab.getDateDebut())
                && !date.after(ab.getDateFin()));
    }
}
