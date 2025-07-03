package com.projet.controller;
import java.util.Date;
import com.projet.service.AdherantService;
import com.projet.service.ExemplaireService;
import com.projet.service.PretService;
import com.projet.service.TypePretService;
import com.projet.service.ReservationService;
import com.projet.service.StatusService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.projet.entity.Exemplaire;
import com.projet.entity.Pret;
import com.projet.entity.Adherant;
import com.projet.entity.TypePret;
import com.projet.entity.Reservation;
import com.projet.entity.Status;

import java.text.SimpleDateFormat;
import java.util.List;

import jakarta.servlet.http.HttpSession;

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

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private StatusService statusService;


    @PostMapping("/adherent_login")
    public String login(@RequestParam("nom") String nom,
                        @RequestParam("password") String password,
                        Model model,
                        HttpSession session) {
        if (adherantService.verifierAdherant(nom, password)) {
            // Récupérer l'adhérant connecté
            Adherant adherant = adherantService.findByNom(nom);
            // Stocker l'id dans la session
            session.setAttribute("adherantId", adherant.getIdAdherent());
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
    public String insertPret(@RequestParam("id_exemplaire") int idExemplaire,
                             @RequestParam("id_type") int idType,
                             @RequestParam("date_debut") String dateDebutStr,
                             @RequestParam("date_fin") String dateFinStr,
                             Model model,
                             HttpSession session) {
        try {
            Integer adherantId = (Integer) session.getAttribute("adherantId");
            if (adherantId == null) {
                model.addAttribute("erreur", "Vous devez être connecté pour effectuer un prêt.");
                return "Adherant/form_adherant";
            }
            Adherant adherant = adherantService.findById(adherantId).orElse(null);
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
            pret.setRendu(0); // Par défaut non rendu

            boolean success = pretService.insererPretSiQuota(adherant, pret);

            if (success) {
                model.addAttribute("message", "Le prêt a été inséré avec succès !");
            } else {
                model.addAttribute("erreur", "Impossible d'insérer le prêt : quota atteint, pénalité ou exemplaire indisponible.");
            }
        } catch (Exception e) {
            model.addAttribute("erreur", "Erreur lors de l'insertion du prêt.");
        }

        // Toujours renvoyer les listes pour le formulaire
        model.addAttribute("exemplaires", exemplaireService.getAllExemplairesAvecLivre());
        model.addAttribute("adherants", adherantService.findAll());
        model.addAttribute("types", typePretService.getAllTypePrets());

        return "Adherant/insert_pret";
    }

    @GetMapping("/liste_pret")
    public String voirPretsAdherant(HttpSession session, Model model) {
        Integer adherantId = (Integer) session.getAttribute("adherantId");
        if (adherantId == null) {
            model.addAttribute("erreur", "Vous devez être connecté pour voir vos prêts.");
            return "Adherant/form_adherant";
        }
        List<Pret> prets = pretService.findByAdherantId(adherantId);
        model.addAttribute("prets", prets);
        return "Adherant/pret_list";
    }
    @GetMapping("/faire_reservation")
    public String render_reservation(Model model) {
        // Récupérer la liste des exemplaires avec leur livre associé
        List<Exemplaire> exemplaires = exemplaireService.getAllExemplairesAvecLivre();
        model.addAttribute("exemplaires", exemplaires);
        return "Adherant/Reservation";
    }

    @PostMapping("/insert_reservation")
    public String insertReservation(@RequestParam("id_exemplaire") int idExemplaire,
                                   @RequestParam("date_debut_pret") String dateDebutPretStr,
                                   @RequestParam("date_fin_pret") String dateFinPretStr,
                                   Model model,
                                   HttpSession session) {
        try {
            Integer adherantId = (Integer) session.getAttribute("adherantId");
            if (adherantId == null) {
                model.addAttribute("erreur", "Vous devez être connecté pour effectuer une réservation.");
                return "Adherant/Reservation";
            }
            Adherant adherant = adherantService.findById(adherantId).orElse(null);
            Exemplaire exemplaire = exemplaireService.findById(idExemplaire).orElse(null);

            // Trouver le status "en attent" (ou "en attente")
            Status status = statusService.findAll().stream()
                .filter(s -> s.getNomStatus().equalsIgnoreCase("en attent") || s.getNomStatus().equalsIgnoreCase("En attente"))
                .findFirst()
                .orElse(null);

            if (status == null) {
                model.addAttribute("erreur", "Le status 'en attent' n'existe pas.");
                model.addAttribute("exemplaires", exemplaireService.getAllExemplairesAvecLivre());
                return "Adherant/Reservation";
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateDebutPret = sdf.parse(dateDebutPretStr);
            Date dateFinPret = sdf.parse(dateFinPretStr);

            Reservation reservation = new Reservation();
            reservation.setAdherant(adherant);
            reservation.setExemplaire(exemplaire);
            reservation.setStatus(status);
            reservation.setDateReservation(new Date()); // maintenant
            reservation.setDateDebutPret(dateDebutPret);
            reservation.setDateFinPret(dateFinPret);

            reservationService.save(reservation);

            model.addAttribute("message", "Réservation effectuée avec succès !");
        } catch (Exception e) {
            model.addAttribute("erreur", "Erreur lors de la réservation.");
        }

        model.addAttribute("exemplaires", exemplaireService.getAllExemplairesAvecLivre());
        return "Adherant/Reservation";
    }
}
