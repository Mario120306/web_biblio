package com.projet.entity;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "pret")
public class Pret {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pret")
    private int idPret;

    @Column(name = "date_debut")
    @Temporal(TemporalType.DATE)
    private Date dateDebut;

    @Column(name = "date_fin")
    @Temporal(TemporalType.DATE)
    private Date dateFin;

    @ManyToOne
    @JoinColumn(name = "id_type", nullable = false)
    private TypePret typePret;

    @ManyToOne
    @JoinColumn(name = "id_adherent", nullable = false)
    private Adherant adherant;

    @ManyToOne
    @JoinColumn(name = "id_exemplaire", nullable = false)
    private Exemplaire exemplaire;

    @Column(name = "rendu")
    private int rendu;

    @Column(nullable = true)
    @Temporal(TemporalType.TIMESTAMP)
    private Date date_rendu;
    
    public Pret(int idPret, Date dateDebut, Date dateFin, TypePret typePret, Adherant adherant, Exemplaire exemplaire,
            int rendu, Date date_rendu) {
        this.idPret = idPret;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.typePret = typePret;
        this.adherant = adherant;
        this.exemplaire = exemplaire;
        this.rendu = rendu;
        this.date_rendu = date_rendu;
    }

    public Date getDate_rendu() {
        return date_rendu;
    }

    public void setDate_rendu(Date date_rendu) {
        this.date_rendu = date_rendu;
    }

    public Pret() {}

    // Getters et setters...
    public int getIdPret() {
        return idPret;
    }

    public void setIdPret(int idPret) {
        this.idPret = idPret;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public TypePret getTypePret() {
        return typePret;
    }

    public void setTypePret(TypePret typePret) {
        this.typePret = typePret;
    }

    public Adherant getAdherant() {
        return adherant;
    }

    public void setAdherant(Adherant adherant) {
        this.adherant = adherant;
    }

    public Exemplaire getExemplaire() {
        return exemplaire;
    }

    public void setExemplaire(Exemplaire exemplaire) {
        this.exemplaire = exemplaire;
    }

    public int isRendu() {
        return rendu;
    }
    public int getRendu() {
        return rendu;
    }
    public void setRendu(int rendu) {
        this.rendu = rendu;
    }
}
