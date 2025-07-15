package com.projet.repository;

import com.projet.entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
    List<Reservation> findByAdherant_IdAdherent(int idAdherent);
    List<Reservation> findByExemplaire_IdExemplaire(int idExemplaire);
    Reservation findById(int id_reservation);
}