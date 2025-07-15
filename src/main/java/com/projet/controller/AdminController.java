package com.projet.controller;

import com.projet.entity.Adherant;
import com.projet.entity.Penalite;
import com.projet.entity.Pret;
import com.projet.entity.Livre;
import com.projet.entity.Prolongement;
import com.projet.entity.Status;
import com.projet.entity.Reservation;
import com.projet.entity.TypePret;
import com.projet.service.AdminService;
import com.projet.service.PenaliteService;
import com.projet.service.AdherantService;
import com.projet.service.ProlongementService;
import com.projet.service.AbonnementService;
import com.projet.service.LivreService;
import com.projet.service.PretService;
import com.projet.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;     
import java.util.concurrent.TimeUnit;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.projet.entity.LivreDTO;
import java.util.stream.Collectors;
import com.projet.entity.Categorie;
import com.projet.entity.Abonnement;
import java.util.HashMap;


@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private PretService pretService;

    @Autowired
    private PenaliteService penaliteService;

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private ProlongementService prolongementService;

    @Autowired
    private AdherantService adherantService;

    @Autowired
    private LivreService livreService;

    @Autowired
    private AbonnementService abonnementService;

    @PostMapping("/login")
    public String login(@RequestParam("nom") String nom,
                        @RequestParam("mdp") String mdp,
                        Model model) {
        if (adminService.verifierAdmin(nom, mdp)) {
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
            pret.setDate_rendu(date_rendu);
            pret.setRendu(1);
            pretService.save(pret);
            
            if (pret.getDateFin() != null) {
                long joursRetard = TimeUnit.DAYS.convert(
                    date_rendu.getTime() - pret.getDateFin().getTime(),
                    TimeUnit.MILLISECONDS
                );
                
                if (joursRetard > 0) {
                    System.out.println("Vous avez dépassé la date de retour");
                    Penalite penalite = new Penalite();
                    penalite.setAdherant(pret.getAdherant());
                    penalite.setDebutPenalite(date_rendu);
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(date_rendu);
                    int longeur = (int) joursRetard;
                    calendar.add(Calendar.DAY_OF_YEAR, longeur);
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

    @GetMapping("/render_gestion")
    public String getAllReservation(Model model) {
        List<Reservation> reservations = reservationService.findAll();
        model.addAttribute("reservations", reservations);
        return "Admin/Reservation";
    }

    @GetMapping("/accepter_reservation")
    public String accepter_reservation(
        @RequestParam("id_reservation") int id_reservation,
        Model model
    ) {
        try {
            Reservation reservation = reservationService.findById(id_reservation);
            if (reservation == null) {
                throw new RuntimeException("Réservation introuvable avec l'ID: " + id_reservation);
            }
            Adherant adherant = adherantService.findById(reservation.getAdherant().getIdAdherent())
                .orElseThrow(() -> new RuntimeException("Adhérent introuvable pour cette réservation"));
            Status status = new Status(2, "Confirmée");
            reservation.setStatus(status);
            reservationService.save(reservation);
            
            Pret pret = new Pret();
            pret.setAdherant(reservation.getAdherant());
            pret.setExemplaire(reservation.getExemplaire());
            pret.setDateDebut(reservation.getDateDebutPret());
            pret.setDateFin(reservation.getDateFinPret());
            pret.setRendu(0);
            TypePret typePret = new TypePret(2, "Long terme");
            pret.setTypePret(typePret);
            
            boolean pretCree = pretService.insererPretSiQuota(adherant, pret);
            if (!pretCree) {
                throw new RuntimeException("Le quota de prêt a été dépassé pour l'adhérent");
            }
            
            List<Reservation> reservations = reservationService.findAll();
            model.addAttribute("reservations", reservations);
        } catch (Exception e) {
            model.addAttribute("erreur", "Erreur lors de l'acceptation de la réservation: " + e.getMessage());
            List<Reservation> reservations = reservationService.findAll();
            model.addAttribute("reservations", reservations);
        }
        return "Admin/Reservation";
    }

    @GetMapping("/render_prologement")
    public String renderProlongement(Model model) {
        List<Prolongement> prolongements = prolongementService.getAllProlongement();
        model.addAttribute("prolongements", prolongements);
        return "Admin/Prolongement";
    }

    @PostMapping("/accepter_prolongement")
    public String accepterProlongement(
            @RequestParam("id_prolongement") int idProlongement,
            Model model) {
        Prolongement prolongement = prolongementService.findById(idProlongement).orElse(null);
        if (prolongement != null) {
            Status status = new Status(2, "Confirme");
            prolongement.setStatus(status);
            prolongementService.save(prolongement);
            Pret pret = prolongement.getPret();
            pret.setDateFin(prolongement.getDateProlongement());
            pretService.save(pret);
            model.addAttribute("message", "Prolongement accepté avec succès.");
        } else {
            model.addAttribute("erreur", "Prolongement non trouvé.");
        }
        return renderProlongement(model);
    }

    @GetMapping("/retour_admin")
    public String retourAdmin(Model model) {
        List<Pret> listePrets = pretService.findAll();
        model.addAttribute("prets", listePrets);
        return "Admin/home";
    }

    @GetMapping("/render_list_livre")
    public String getAllLivre(Model model) {
        List<Livre> livres = livreService.findAll();
        model.addAttribute("livres", livres);
        return "Admin/livre";
    }
    @GetMapping("/details_livre")
    @ResponseBody
    @CrossOrigin(origins = "http://localhost:8080")
    public ResponseEntity<?> getDetailLivreApi(@RequestParam("id") Integer id) {
        try {
            if (id == null) {
                return ResponseEntity.badRequest().body("ID requis");
            }
            
            Livre livre = livreService.findById(id).orElse(null);
            if (livre == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Livre non trouvé");
            }

            LivreDTO dto = new LivreDTO();
            dto.setId(livre.getIdLivre());
            dto.setTitre(livre.getTitre());
            dto.setAuteur(livre.getAuteur() != null ? 
                livre.getAuteur().getNomAuteur() : "Inconnu");
            dto.setAnnee(livre.getAnneePublication());
            
            if (livre.getCategories() != null) {
                dto.setCategories(livre.getCategories().stream()
                    .map(Categorie::getNomCategorie)
                    .collect(Collectors.toList()));
            }

            return ResponseEntity.ok(dto);
        } catch (Exception e) {
            return ResponseEntity.internalServerError()
                .body("Erreur serveur: " + e.getMessage());
        }
    }
    @GetMapping("/faire_abonnement")
    public String faireAbonnement(Model model) {
        List<Adherant> adherants = adherantService.findAll();
        model.addAttribute("adherants", adherants);
        return "Admin/Abonnement";
    }
    @PostMapping("/creer_abonnement")
    public String creerAbonnement(
            @RequestParam("dateDebut") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateDebut,
            @RequestParam("dateFin") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateFin,
            @RequestParam("idAdherent") Integer idAdherent,
            Model model) {
        
        try {
            Abonnement abonnement = new Abonnement(dateDebut, dateFin, idAdherent);
            abonnementService.createAbonnement(abonnement);
            model.addAttribute("message", "Abonnement créé avec succès.");
            
            // Conserver les valeurs sélectionnées après soumission
            model.addAttribute("dateDebut", new SimpleDateFormat("yyyy-MM-dd").format(dateDebut));
            model.addAttribute("dateFin", new SimpleDateFormat("yyyy-MM-dd").format(dateFin));
            model.addAttribute("idAdherent", idAdherent);
            
        } catch (Exception e) {
            model.addAttribute("erreur", "Erreur lors de la création de l'abonnement: " + e.getMessage());
            
            // Conserver les valeurs en cas d'erreur
            model.addAttribute("dateDebut", new SimpleDateFormat("yyyy-MM-dd").format(dateDebut));
            model.addAttribute("dateFin", new SimpleDateFormat("yyyy-MM-dd").format(dateFin));
            model.addAttribute("idAdherent", idAdherent);
        }
        
        // Recharger la liste des adhérents
        List<Adherant> adherants = adherantService.findAll();
        model.addAttribute("adherants", adherants);
        
        return "Admin/Abonnement";
    }
    @GetMapping("/list_adherant")
    public String listAdherant(Model model) {
        List<Adherant> adherants = adherantService.findAll();
        model.addAttribute("adherants", adherants);
        return "Admin/list_adherant";
    }

    @GetMapping("/details_adherant")
    @ResponseBody
    @CrossOrigin(origins = "http://localhost:8080")
    public ResponseEntity<?> getDetailAdherantApi(@RequestParam("id") int adherantId) {
        Adherant adherant = adherantService.findById(adherantId).orElse(null);
        if (adherant == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Adhérant non trouvé");
        }
        java.util.Date today = new java.util.Date();
        int quotaRestant = pretService.getQuotaRestant(adherant);
        boolean abonne = abonnementService.estAbonne(adherant.getIdAdherent(), today);
        boolean penalise = penaliteService.estPenalise(adherant, today);
        HashMap<String, Object> result = new HashMap<>();
        result.put("quotaRestant", quotaRestant);
        result.put("estAbonne", abonne);
        result.put("estPenalise", penalise);
        return ResponseEntity.ok(result);
    }
}
