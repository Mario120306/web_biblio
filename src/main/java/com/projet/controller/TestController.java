package com.projet.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.stereotype.Controller;

@Controller
public class TestController {

    @GetMapping("/")
    public String hello(Model model){
        model.addAttribute("test","varianle");
        return "index";
    }
    @GetMapping("/admin")
    public String admin_form(Model model){
        model.addAttribute("test","varianle");
        return "Admin/form_admin";
    }
    @GetMapping("/adherent")
    public String adherant_form(Model model){
        model.addAttribute("test","varianle");
        return "Adherant/form_adherant";
    }
}
