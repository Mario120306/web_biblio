package com.projet.controller;
import java.util.Date;
import com.projet.service.AdherantService;
import com.projet.service.ExemplaireService;
import com.projet.service.PretService;
import com.projet.service.TypePretService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.projet.entity.Exemplaire;
import com.projet.entity.Pret;
import com.projet.entity.Adherant;
import com.projet.entity.TypePret;

import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class AdherantController {

    @Autowired
    private AdherantService adherantService;

    @Autowired
    private ExemplaireService exemplaireService;

    @Autowired
    private PretService pretService;
    
    @Autowired
    private TypePretService typePretService;


    @PostMapping("/adherent_login")
    public String login(@RequestParam("nom") String nom,
                        @RequestParam("password") String password,
                        Model model) {
        if (adherantService.verifierAdherant(nom, password)) {
            // Connexion réussie
            return "Adherant/home_adherant"; // Redirige vers la page d'accueil des adhérents
        } else {
            model.addAttribute("erreur", "Nom ou mot de passe incorrect");
            return "Adherant/form_adherant"; // Redirige vers la page de login en cas d'échec
        }
    }
    
    @GetMapping("/render_insertPret")
    public String showInsertPretForm(Model model) {
        // Récupérer la liste des exemplaires avec leur livre associé
        List<Exemplaire> exemplaires = exemplaireService.getAllExemplairesAvecLivre();
        // Récupérer la liste des adhérents
        List<Adherant> adherants = adherantService.findAll();
        List<TypePret> typePrets = typePretService.getAllTypePrets();

        model.addAttribute("exemplaires", exemplaires);
        model.addAttribute("adherants", adherants);
        model.addAttribute("types", typePrets);

        return "Adherant/insert_pret";
    }
    @PostMapping("/insert_pret")
    public String insertPret(@RequestParam("id_adherent") int idAdherent,
                             @RequestParam("id_exemplaire") int idExemplaire,
                             @RequestParam("id_type") int idType,
                             @RequestParam("date_debut") String dateDebutStr,
                             @RequestParam("date_fin") String dateFinStr,
                             Model model) {
        try {
            Adherant adherant = adherantService.findById(idAdherent).orElse(null);
            Exemplaire exemplaire = exemplaireService.findById(idExemplaire).orElse(null);
            TypePret typePret = typePretService.findById(idType).orElse(null);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateDebut = sdf.parse(dateDebutStr);
            Date dateFin = sdf.parse(dateFinStr);

            Pret pret = new Pret();
            pret.setAdherant(adherant);
            pret.setExemplaire(exemplaire);
            pret.setTypePret(typePret);
            pret.setDateDebut(dateDebut);
            pret.setDateFin(dateFin);
            pret.setRendu(false);

            pretService.save(pret);

            // Message de succès
            model.addAttribute("message", "Le prêt a été inséré avec succès !");
        } catch (Exception e) {
            // Message d'erreur
            model.addAttribute("erreur", "Erreur lors de l'insertion du prêt.");
        }

        // Toujours renvoyer les listes pour le formulaire
        model.addAttribute("exemplaires", exemplaireService.getAllExemplairesAvecLivre());
        model.addAttribute("adherants", adherantService.findAll());
        model.addAttribute("types", typePretService.getAllTypePrets());

        return "Adherant/insert_pret";
    }
}
