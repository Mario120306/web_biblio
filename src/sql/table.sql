CREATE TABLE categorie(
   id_categorie INT,
   nom_categorie VARCHAR(50),
   PRIMARY KEY(id_categorie)
);

CREATE TABLE auteur(
   id_auteur INT,
   prenom_auteur_ VARCHAR(50),
   nom_auteur VARCHAR(50),
   PRIMARY KEY(id_auteur)
);

CREATE TABLE profil(
   id_profil INT,
   type_adherant VARCHAR(50),
   quota_pret INT,
   quota_reservation INT,
   PRIMARY KEY(id_profil)
);

CREATE TABLE status(
   id_status INT,
   nom_status VARCHAR(50),
   PRIMARY KEY(id_status)
);

CREATE TABLE type_pret(
   id_type INT,
   type VARCHAR(50),
   PRIMARY KEY(id_type)
);

CREATE TABLE admin(
   id INT,
   nom VARCHAR(50),
   mdp VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE livre(
   id_livre INT,
   titre VARCHAR(50),
   isbn VARCHAR(50),
   langue VARCHAR(50),
   annee_publication INT,
   synopsis VARCHAR(50),
   nb_page INT,
   id_auteur INT NOT NULL,
   PRIMARY KEY(id_livre),
   FOREIGN KEY(id_auteur) REFERENCES auteur(id_auteur)
);

CREATE TABLE exemplaire(
   id_exemplaire INT,
   disponible INT,
   id_livre INT NOT NULL,
   PRIMARY KEY(id_exemplaire),
   FOREIGN KEY(id_livre) REFERENCES livre(id_livre)
);

CREATE TABLE adherant(
   id_adherent INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   password VARCHAR(50),
   id_profil INT NOT NULL,
   PRIMARY KEY(id_adherent),
   FOREIGN KEY(id_profil) REFERENCES profil(id_profil)
);

CREATE TABLE pret(
   id_pret INT,
   date_debut DATE,
   date_fin DATE,
   rendu LOGICAL,
   id_type INT NOT NULL,
   id_adherent INT NOT NULL,
   id_exemplaire INT NOT NULL,
   PRIMARY KEY(id_pret),
   FOREIGN KEY(id_type) REFERENCES type_pret(id_type),
   FOREIGN KEY(id_adherent) REFERENCES adherant(id_adherent),
   FOREIGN KEY(id_exemplaire) REFERENCES exemplaire(id_exemplaire)
);

CREATE TABLE reservation(
   id_reservation INT,
   date_reservation DATE,
   date_debut_pret DATE,
   date_fin_pret DATE,
   id_exemplaire INT NOT NULL,
   id_status INT NOT NULL,
   id_adherent INT NOT NULL,
   PRIMARY KEY(id_reservation),
   FOREIGN KEY(id_exemplaire) REFERENCES exemplaire(id_exemplaire),
   FOREIGN KEY(id_status) REFERENCES status(id_status),
   FOREIGN KEY(id_adherent) REFERENCES adherant(id_adherent)
);

CREATE TABLE prolongement(
   id_prolongement INT,
   date_prolongement DATE,
   id_pret INT NOT NULL,
   id_status INT NOT NULL,
   id_adherent INT NOT NULL,
   PRIMARY KEY(id_prolongement),
   FOREIGN KEY(id_pret) REFERENCES pret(id_pret),
   FOREIGN KEY(id_status) REFERENCES status(id_status),
   FOREIGN KEY(id_adherent) REFERENCES adherant(id_adherent)
);

CREATE TABLE penalite(
   id_penalite INT,
   debut_penalite DATE,
   fin_penalite DATE,
   id_adherent INT NOT NULL,
   PRIMARY KEY(id_penalite),
   FOREIGN KEY(id_adherent) REFERENCES adherant(id_adherent)
);

CREATE TABLE categorie_livre(
   id_livre INT,
   id_categorie INT,
   PRIMARY KEY(id_livre, id_categorie),
   FOREIGN KEY(id_livre) REFERENCES livre(id_livre),
   FOREIGN KEY(id_categorie) REFERENCES categorie(id_categorie)
);
