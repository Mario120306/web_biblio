package com.projet.service;

import com.projet.entity.Pret;
import com.projet.entity.Adherant;
import com.projet.entity.Penalite;
import com.projet.service.AbonnementService;
import com.projet.entity.Abonnement;

import com.projet.repository.PretRepository;
import com.projet.repository.PenaliteRepository;
import com.projet.repository.ExemplaireRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import java.util.List;
import java.util.Optional;


@Service
public class PretService {

    @Autowired
    private PretRepository pretRepository;

    @Autowired
    private PenaliteRepository penaliteRepository;

    @Autowired
    private ExemplaireRepository exemplaireRepository;

    @Autowired
    private AbonnementService abonnementService;

    public List<Pret> findAll() {
        return pretRepository.findAll();
    }
    
    public Pret save(Pret pret) {
        return pretRepository.save(pret);
    }
    public Pret findPretById(int id){
        return pretRepository.findByIdPret(id);
    }
    public boolean insererPretSiQuota(Adherant adherant, Pret pret) {
        int quota = adherant.getProfil().getQuotaPret();

        // Vérifier la disponibilité de l'exemplaire
        if (pret.getExemplaire() == null || pret.getExemplaire().getDisponible() <= 0) {
            return false;
        }

        // Vérifier que l'adhérant est abonné à la date de fin du prêt
        boolean estAbonne = abonnementService.getAllAbonnements().stream()
            .anyMatch(ab -> ab.getIdAdherent() == adherant.getIdAdherent()
                && ab.getDateDebut() != null && ab.getDateFin() != null
                && !pret.getDateFin().before(ab.getDateDebut())
                && !pret.getDateFin().after(ab.getDateFin()));
        if (!estAbonne) {
            return false;
        }

        // Nombre de prêts actifs à la date de début du nouveau prêt (non rendus)
        long nbPretsActifs = pretRepository.findByAdherant(adherant).stream()
            .filter(p -> p.getRendu() == 0 && (p.getDateFin() == null || !p.getDateFin().before(pret.getDateDebut())))
            .count();

        // Nombre de prêts déjà faits le même jour
        long nbPretsMemeJour = pretRepository.findByAdherant(adherant).stream()
            .filter(p -> pret.getDateDebut().equals(p.getDateDebut()))
            .count();

        // Vérifier la pénalité sur la date de début du prêt
        List<Penalite> penalites = penaliteRepository.findByAdherantAndDebutPenaliteLessThanEqualAndFinPenaliteGreaterThanEqual(
            adherant, pret.getDateDebut(), pret.getDateDebut()
        );
        boolean estPenalise = !penalites.isEmpty();

        // Condition : pas de pénalité, quota non atteint pour le jour ET pour les prêts actifs, exemplaire dispo, abonné
        if (!estPenalise && nbPretsActifs < quota && nbPretsMemeJour < quota) {
            // Décrémenter le nombre d'exemplaires disponibles
            pret.getExemplaire().setDisponible(pret.getExemplaire().getDisponible() - 1);
            // Sauvegarder l'exemplaire modifié
            exemplaireRepository.save(pret.getExemplaire());
            // Sauvegarder le prêt
            pretRepository.save(pret);
            return true;
        }
        return false;
    }

    public List<Pret> findByAdherantId(int adherantId) {
        return pretRepository.findByAdherant_IdAdherent(adherantId);
    }

    public List<Pret> findByAdherant(Adherant adherant) {
        return pretRepository.findByAdherant(adherant);
    }
public Pret updatePret(int idPret,Date date_rendre , Pret updatedPret) {
        // Récupérer le prêt existant par son ID
        Optional<Pret> optionalPret = pretRepository.findById(idPret);
        if (!optionalPret.isPresent()) {
            throw new IllegalArgumentException("Prêt avec l'ID " + idPret + " non trouvé");
        }

        Pret existingPret = optionalPret.get();

        // Mettre à jour les champs modifiables
        if (updatedPret.getDateDebut() != null) {
            existingPret.setDateDebut(updatedPret.getDateDebut());
        }
        if (updatedPret.getDateFin() != null) {
            existingPret.setDateFin(updatedPret.getDateFin());
        }
        // Toujours définir rendu à 1
        existingPret.setRendu(1);
        existingPret.setDate_rendu(date_rendre);
        if (updatedPret.getTypePret() != null) {
            existingPret.setTypePret(updatedPret.getTypePret());
        }
        if (updatedPret.getAdherant() != null) {
            existingPret.setAdherant(updatedPret.getAdherant());
        }
        if (updatedPret.getExemplaire() != null) {
            existingPret.setExemplaire(updatedPret.getExemplaire());
        }

        // Sauvegarder les modifications
        return pretRepository.save(existingPret);
    }
  

    public static long calculerDifferenceJours(Date date1, Date date2) {
        long diffInMillies = date2.getTime() - date1.getTime();
        return TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
    }

    public int getQuotaRestant(Adherant adherant) {
        int quota = adherant.getProfil().getQuotaPret();
        long nbPretsActifs = pretRepository.findByAdherant(adherant).stream()
            .filter(p -> p.getRendu() == 0)
            .count();
        return quota - (int) nbPretsActifs;
    }
}
