package com.projet.repository;
import com.projet.entity.Prolongement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/*import java.util.List;*/

@Repository
public interface ProlongementRepository extends JpaRepository<Prolongement, Integer> {
    // Méthodes personnalisées si nécessaire
    // Exemple:
    //List<Prolongement> findByPretId(Integer pretId);
    //List<Prolongement> findByAdherentId(Integer adherentId);

}