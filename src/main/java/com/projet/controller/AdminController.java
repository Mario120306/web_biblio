package com.projet.controller;

import com.projet.entity.Pret;
import com.projet.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.projet.service.PretService;
import java.util.List;
import java.util.Date;
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private PretService pretService;

    @PostMapping("/login")
    public String login(@RequestParam("nom") String nom,
                        @RequestParam("mdp") String mdp,
                        Model model) {
        if (adminService.verifierAdmin(nom, mdp)) {
            // Connexion réussie, récupération de la liste des prêts
            List<Pret> listePrets = pretService.findAll();
            model.addAttribute("prets", listePrets);
            return "Admin/home";
        } else {
            model.addAttribute("erreur", "Nom ou mot de passe incorrect.");
            return "index";
        }
    }

    @GetMapping("/rendre_livre")
    public String rendrePret(@RequestParam("pretId") int pretId,@RequestParam("date_rendu") Date date_rendu, Model model) {
        try {
            // Créer un objet Pret vide pour la mise à jour (seul rendu sera modifié à 1)
            Pret updatedPret = new Pret();
            // Appeler la méthode updatePret pour mettre à jour le prêt
            pretService.updatePret(pretId,date_rendu,updatedPret);
            // Ajouter un message de confirmation
            model.addAttribute("message", "Le prêt a été marqué comme rendu avec succès.");
             List<Pret> listePrets = pretService.findAll();
            model.addAttribute("prets", listePrets);
            return "Admin/home"; // Rediriger vers la page de la liste des prêts
        } catch (IllegalArgumentException e) {
            // Gérer le cas où le prêt n'existe pas
            model.addAttribute("erreur", "Erreur : " + e.getMessage());
            List<Pret> listePrets = pretService.findAll();
            model.addAttribute("prets", listePrets);
            return "Admin/home"; // Retourner la page sans rediriger en cas d'erreur
        }
    }
}