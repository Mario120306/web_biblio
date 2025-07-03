package com.projet.repository;

import com.projet.entity.Exemplaire;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExemplaireRepository extends JpaRepository<Exemplaire, Integer> {
    List<Exemplaire> findAllByOrderByIdExemplaireAsc();
    List<Exemplaire> findByLivreIdLivre(int idLivre); // Pour filtrer par livre si besoin

    @Query("SELECT e FROM Exemplaire e JOIN FETCH e.livre")
    List<Exemplaire> findAllWithLivre();
}
