package com.projet.entity;  
import java.util.List; 
public class LivreDTO {
    private int id;
    private String titre;
    private String auteur;
    private int annee;
    private List<String> categories; // ou List<CategoryDTO>
    public LivreDTO() {
    }
    public LivreDTO(int id, String titre, String auteur, int annee, List<String> categories) {
        this.id = id;
        this.titre = titre;
        this.auteur = auteur;
        this.annee = annee;
        this.categories = categories;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitre() {
        return titre;
    }
    public void setTitre(String titre) {
        this.titre = titre;
    }
    public String getAuteur() {
        return auteur;
    }
    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }
    public int getAnnee() {
        return annee;
    }
    public void setAnnee(int annee) {
        this.annee = annee;
    }
    public List<String> getCategories() {
        return categories;
    }
    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    
}