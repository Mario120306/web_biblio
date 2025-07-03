package com.projet.repository;

import com.projet.entity.Adherant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdherantRepository extends JpaRepository<Adherant, Integer> {
    Adherant findByNom(String nom);
}