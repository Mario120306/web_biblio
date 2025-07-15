package com.projet.entity;

import jakarta.persistence.*;
import java.util.Date;


@Entity
@Table(name = "prolongement")
public class Prolongement {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_prolongement")
    private Integer idProlongement;
    
    @Column(name = "date_prolongement")
    @Temporal(TemporalType.DATE)
    private Date dateProlongement;
    
    @ManyToOne
    @JoinColumn(name = "id_pret", referencedColumnName = "id_pret", nullable = false)
    private Pret pret;
    
    @ManyToOne
    @JoinColumn(name = "id_status", referencedColumnName = "id_status", nullable = false)
    private Status status;
    
    @ManyToOne
    @JoinColumn(name = "id_adherent", referencedColumnName = "id_adherent", nullable = false)
    private Adherant adherent;
    
    // Constructeurs
    public Prolongement() {
    }
    
    public Prolongement(Integer idProlongement, Date dateProlongement, Pret pret, Status status, Adherant adherent) {
        this.idProlongement = idProlongement;
        this.dateProlongement = dateProlongement;
        this.pret = pret;
        this.status = status;
        this.adherent = adherent;
    }
    
    // Getters et Setters
    public Integer getIdProlongement() {
        return idProlongement;
    }
    
    public void setIdProlongement(Integer idProlongement) {
        this.idProlongement = idProlongement;
    }
    
    public Date getDateProlongement() {
        return dateProlongement;
    }
    
    public void setDateProlongement(Date dateProlongement) {
        this.dateProlongement = dateProlongement;
    }
    
    public Pret getPret() {
        return pret;
    }
    
    public void setPret(Pret pret) {
        this.pret = pret;
    }
    
    public Status getStatus() {
        return status;
    }
    
    public void setStatus(Status status) {
        this.status = status;
    }
    
    public Adherant getAdherent() {
        return adherent;
    }
    
    public void setAdherant(Adherant adherent) {
        this.adherent = adherent;
    }
    
    // Méthode toString()
    @Override
    public String toString() {
        return "Prolongement{" +
                "idProlongement=" + idProlongement +
                ", dateProlongement=" + dateProlongement +
                ", pret=" + pret +
                ", status=" + status +
                ", adherent=" + adherent +
                '}';
    }
}