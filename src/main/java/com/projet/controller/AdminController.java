package com.projet.controller;

/*import com.fasterxml.jackson.annotation.JsonCreator.Mode;*/
/*import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;*/
import com.projet.entity.Penalite;
import com.projet.entity.Pret;
import com.projet.entity.Prolongement;
import com.projet.entity.Status;
import com.projet.entity.Reservation;
import com.projet.entity.TypePret;
import com.projet.service.AdminService;
import com.projet.service.PenaliteService;
import com.projet.service.ProlongementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.projet.service.PretService;
import com.projet.service.ReservationService;

import java.util.List;     
import java.util.concurrent.TimeUnit;
import java.util.Date;
/*import java.io.ObjectInputFilter.Status;*/
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

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private ProlongementService prolongementService;

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
                long  joursRetard = TimeUnit.DAYS.convert(
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
                    int longeur=(int) joursRetard;
                    calendar.add(Calendar.DAY_OF_YEAR, longeur); // Pénalité de 10 jours
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
    ){
        Reservation reservation = reservationService.findById(id_reservation);
        Status status =new Status(2,"Confirmée");
        reservation.setStatus(status);
        reservationService.save(reservation);
        Pret pret = new Pret();
        pret.setAdherant(reservation.getAdherant());
        pret.setExemplaire(reservation.getExemplaire());
        pret.setDateDebut(reservation.getDateDebutPret());
        pret.setDateFin(reservation.getDateFinPret());
        pret.setRendu(0);
        TypePret typePret = new TypePret(2,"Long terme");
        pret.setTypePret(typePret);
        pretService.save(pret);
        List<Reservation> reservations = reservationService.findAll();
        model.addAttribute("reservations", reservations);
        return "Admin/Reservation";
    }
    @GetMapping("/render_prologement")
    public String  renderProlongement(Model model) {
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
            Status status = new Status(2, " Confirme");
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
    @GetMapping("retour_admin")
    public String retourAdmin(Model model) {
        List<Pret> listePrets = pretService.findAll();
        model.addAttribute("prets", listePrets);
        return "Admin/home";
    }
}