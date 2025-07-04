package com.projet.controller;

import com.projet.entity.Penalite;
import com.projet.entity.Pret;
import com.projet.service.AdminService;
import com.projet.service.PenaliteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.projet.service.PretService;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.Date;
import java.util.Calendar;
// Pour calculer la différence en jours

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private PretService pretService;

    @Autowired
    private PenaliteService penaliteService;

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
    public String rendrePret(
            @RequestParam("pretId") int pretId,
            @RequestParam("date_rendu") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date_rendu,
            Model model) {
        
        try {
            Pret pret = pretService.findPretById(pretId);
            
            // Mettre à jour la date de rendu
            pret.setDate_rendu(date_rendu);
            pret.setRendu(1);
            pretService.save(pret);
            
            // Calculer le retard par rapport à la date de fin prévue
            if (pret.getDateFin() != null) {
                long joursRetard = TimeUnit.DAYS.convert(
                    date_rendu.getTime() - pret.getDateFin().getTime(),
                    TimeUnit.MILLISECONDS
                );
                
                if (joursRetard > 0) {
                    System.out.println("Vous avez dépassé la date de retour");
                    
                    // Appliquer pénalité
                    Penalite penalite = new Penalite();
                    penalite.setAdherant(pret.getAdherant());
                    penalite.setDebutPenalite(date_rendu);
                    
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(date_rendu);
                    calendar.add(Calendar.DAY_OF_YEAR, 10); // Pénalité de 10 jours
                    penalite.setFinPenalite(calendar.getTime());
                    
                    penaliteService.save(penalite);
                    
                    model.addAttribute("warning", "Livre rendu avec " + joursRetard + " jours de retard. Pénalité appliquée.");
                }
            }
            
            model.addAttribute("message", "Le prêt a été marqué comme rendu avec succès.");
            model.addAttribute("prets", pretService.findAll());
            return "Admin/home";
            
        } catch (Exception e) {
            model.addAttribute("erreur", "Erreur : " + e.getMessage());
            model.addAttribute("prets", pretService.findAll());
            return "Admin/home";
        }
    }
}