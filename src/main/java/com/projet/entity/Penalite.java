package com.projet.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "penalite")
public class Penalite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_penalite")
    private int idPenalite;

    @Column(name = "debut_penalite")
    @Temporal(TemporalType.DATE)
    private Date debutPenalite;

    @Column(name = "fin_penalite")
    @Temporal(TemporalType.DATE)
    private Date finPenalite;

    @ManyToOne
    @JoinColumn(name = "id_adherent", nullable = false)
    private Adherant adherant;

    public Penalite() {}

    public int getIdPenalite() {
        return idPenalite;
    }

    public void setIdPenalite(int idPenalite) {
        this.idPenalite = idPenalite;
    }

    public Date getDebutPenalite() {
        return debutPenalite;
    }

    public void setDebutPenalite(Date debutPenalite) {
        this.debutPenalite = debutPenalite;
    }

    public Date getFinPenalite() {
        return finPenalite;
    }

    public void setFinPenalite(Date finPenalite) {
        this.finPenalite = finPenalite;
    }

    public Adherant getAdherant() {
        return adherant;
    }

    public void setAdherant(Adherant adherant) {
        this.adherant = adherant;
    }
}
