package com.projet.service;

import com.projet.entity.TypePret;
import com.projet.repository.TypePretRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypePretService {

    @Autowired
    private TypePretRepository typePretRepository;

    public List<TypePret> getAllTypePrets() {
        return typePretRepository.findAll();
    }

    public TypePret save(TypePret typePret) {
        return typePretRepository.save(typePret);
    }

    public void deleteById(int id) {
        typePretRepository.deleteById(id);
    }

    public java.util.Optional<TypePret> findById(int id) {
        return typePretRepository.findById(id);
    }
}
