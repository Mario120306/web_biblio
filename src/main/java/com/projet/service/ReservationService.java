package com.projet.service;

import com.projet.entity.Reservation;
import com.projet.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*import java.io.ObjectInputFilter.Status;*/
import java.util.List;
/*import java.util.Optional;*/
/*import com.projet.entity.*;*/
@Service
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;

    public List<Reservation> findAll() {
        return reservationRepository.findAll();
    }

    public Reservation findById(int id) {
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
    /*public Reservation updateReservation(int id_reservation,Reservation updateReservation){

        Reservation existingReservation=reservationRepository.findById(id_reservation);
        Status status =new Status(2,"Confirme ");
        if(updateReservation.getAdherant()!=null){
            existingReservation.setAdherant(updateReservation.getAdherant());
        }
        if(updateReservation.getDateReservation()!=null){
            existingReservation.setDateReservation(updateReservation.getDateReservation());
        }
        if(updateReservation.getDateDebutPret()!=null){
            existingReservation.setDateDebutPret(updateReservation.getDateDebutPret());
        }
        if(updateReservation.getDateFinPret()!=null){
            existingReservation.setDateFinPret(updateReservation.getDateFinPret());
        }
        if(updateReservation.getExemplaire()!=null){
            existingReservation.setExemplaire(updateReservation.getExemplaire());
        }
        existingReservation.setStatus(status);
        return reservationRepository.save(existingReservation);
    }*/
}