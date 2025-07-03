package com.projet.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "adherant")
public class Adherant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_adherent")
    private int idAdherent;

    @Column(name = "nom", nullable = false)
    private String nom;

    @Column(name = "prenom", nullable = false)
    private String prenom;

    @Column(name = "password", nullable = false)
    private String password;

    @ManyToOne
    @JoinColumn(name = "id_profil", nullable = false)
    private Profil profil;

    public Adherant() {}

    public Adherant(int idAdherent, String nom, String prenom, String password, Profil profil) {
        this.idAdherent = idAdherent;
        this.nom = nom;
        this.prenom = prenom;
        this.password = password;
        this.profil = profil;
    }

    public int getIdAdherent() {
        return idAdherent;
    }

    public void setIdAdherent(int idAdherent) {
        this.idAdherent = idAdherent;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Profil getProfil() {
        return profil;
    }

    public void setProfil(Profil profil) {
        this.profil = profil;
    }

    public static boolean verifierAdherant(Adherant adherant, String nom, String password) {
        if (adherant == null) return false;
        return adherant.getNom().equals(nom) && adherant.getPassword().equals(password);
    }
}
