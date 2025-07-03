package com.projet.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "type_pret")
public class TypePret {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_type")
    private int idType;

    @Column(name = "type")
    private String type;

    public TypePret() {}

    public TypePret(int idType, String type) {
        this.idType = idType;
        this.type = type;
    }

    public int getIdType() {
        return idType;
    }

    public void setIdType(int idType) {
        this.idType = idType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
