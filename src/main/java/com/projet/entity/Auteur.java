package com.projet.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "auteur")
public class Auteur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_auteur")
    private int idAuteur;

    @Column(name = "prenom_auteur_", nullable = false)
    private String prenomAuteur;

    @Column(name = "nom_auteur", nullable = false)
    private String nomAuteur;

    public Auteur() {}

    public Auteur(int idAuteur, String prenomAuteur, String nomAuteur) {
        this.idAuteur = idAuteur;
        this.prenomAuteur = prenomAuteur;
        this.nomAuteur = nomAuteur;
    }

    public int getIdAuteur() {
        return idAuteur;
    }

    public void setIdAuteur(int idAuteur) {
        this.idAuteur = idAuteur;
    }

    public String getPrenomAuteur() {
        return prenomAuteur;
    }

    public void setPrenomAuteur(String prenomAuteur) {
        this.prenomAuteur = prenomAuteur;
    }

    public String getNomAuteur() {
        return nomAuteur;
    }

    public void setNomAuteur(String nomAuteur) {
        this.nomAuteur = nomAuteur;
    }
}