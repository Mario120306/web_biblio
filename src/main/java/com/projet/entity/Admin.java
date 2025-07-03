package com.projet.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "admin")
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "nom", nullable = false)
    private String nom;

    @Column(name = "mdp", nullable = false)
    private String mdp;

    public Admin() {
        // Constructeur par défaut requis par JPA
    }

    public Admin(int id, String nom, String mdp) {
        this.id = id;
        this.nom = nom;
        this.mdp = mdp;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getMdp() {
        return mdp;
    }
    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public static boolean verifierAdmin(Admin admin, String nom, String mdp) {
        if (admin == null) return false;
        return admin.getNom().equals(nom) && admin.getMdp().equals(mdp);
    }

}
