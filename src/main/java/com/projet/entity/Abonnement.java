package com.projet.entity;
import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "abonnement")
public class Abonnement {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column(name = "date_debut")
    private Date dateDebut;
    
    @Column(name = "date_fin")
    private Date dateFin;
    
    @Column(name = "id_adherent", nullable = false)
    private Integer idAdherent;
    
    // Constructeurs
    public Abonnement() {
    }
    
    public Abonnement(Date dateDebut, Date dateFin, Integer idAdherent) {
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.idAdherent = idAdherent;
    }
    
    // Getters et Setters
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
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
    
    public Integer getIdAdherent() {
        return idAdherent;
    }
    
    public void setIdAdherent(Integer idAdherent) {
        this.idAdherent = idAdherent;
    }
    
    // Méthode toString()
    @Override
    public String toString() {
        return "Abonnement{" +
                "id=" + id +
                ", dateDebut=" + dateDebut +
                ", dateFin=" + dateFin +
                ", idAdherent=" + idAdherent +
                '}';
    }
}
