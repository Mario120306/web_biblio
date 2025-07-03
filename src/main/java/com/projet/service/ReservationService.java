package com.projet.service;

import com.projet.entity.Reservation;
import com.projet.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;

    public List<Reservation> findAll() {
        return reservationRepository.findAll();
    }

    public Optional<Reservation> findById(int id) {
        return reservationRepository.findById(id);
    }

    public Reservation save(Reservation reservation) {
        return reservationRepository.save(reservation);
    }

    public void deleteById(int id) {
        reservationRepository.deleteById(id);
    }

    public List<Reservation> findByAdherantId(int idAdherent) {
        return reservationRepository.findByAdherant_IdAdherent(idAdherent);
    }

    public List<Reservation> findByExemplaireId(int idExemplaire) {
        return reservationRepository.findByExemplaire_IdExemplaire(idExemplaire);
    }
}