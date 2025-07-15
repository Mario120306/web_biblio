package com.projet.repository;
import com.projet.entity.Abonnement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AbonnementRepository extends JpaRepository<Abonnement, Integer> {
    // Vous pouvez ajouter des méthodes personnalisées ici si nécessaire
    // Par exemple:
    // List<Abonnement> findByDateFinBefore(Date date);
}
