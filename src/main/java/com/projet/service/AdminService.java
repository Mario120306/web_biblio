package com.projet.service;

import com.projet.entity.Admin;
import com.projet.repository.AdminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    public boolean verifierAdmin(String nom, String mdp) {
        Admin admin = adminRepository.findByNom(nom);
        return Admin.verifierAdmin(admin, nom, mdp);
    }
}
