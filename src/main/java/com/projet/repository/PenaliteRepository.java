package com.projet.repository;

import com.projet.entity.Penalite;
import com.projet.entity.Adherant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Date;

@Repository
public interface PenaliteRepository extends JpaRepository<Penalite, Integer> {
    List<Penalite> findByAdherantAndDebutPenaliteLessThanEqualAndFinPenaliteGreaterThanEqual(
        Adherant adherant, Date dateDebut, Date dateFin
    );
    List<Penalite> findByAdherant(Adherant adherant);
}
