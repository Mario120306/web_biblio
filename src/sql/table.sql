
CREATE TABLE auteur(
   id_Auteur INT AUTO_INCREMENT,
   nom_auteur VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_Auteur)
);

CREATE TABLE livre(
   id_livre INT AUTO_INCREMENT,
   titre VARCHAR(50),
   date_sortie DATE,
   exemplaire INT,
   id_Auteur INT NOT NULL,
   PRIMARY KEY(id_livre),
   FOREIGN KEY(id_Auteur) REFERENCES auteur(id_Auteur)
);

CREATE TABLE categorie(
   id_categorie INT AUTO_INCREMENT,
   nom_categorie VARCHAR(50),
   PRIMARY KEY(id_categorie)
);

CREATE TABLE type_adherent(
   id_type_adherent INT AUTO_INCREMENT,
   nom_type_adherent VARCHAR(50),
   quota INT,
   PRIMARY KEY(id_type_adherent)
);

CREATE TABLE adherent(
   id_adherent INT AUTO_INCREMENT,
   nom_adherent VARCHAR(50),
   id_type_adherent INT NOT NULL,
   PRIMARY KEY(id_adherent),
   FOREIGN KEY(id_type_adherent) REFERENCES type_adherent(id_type_adherent)
);

CREATE TABLE pret(
   id_pret INT AUTO_INCREMENT,
   date_pret DATE,
   date_retour DATE,
   date_prolongation DATE,
   id_adherent INT NOT NULL,
   id_livre INT NOT NULL,
   PRIMARY KEY(id_pret),
   FOREIGN KEY(id_adherent) REFERENCES adherent(id_adherent),
   FOREIGN KEY(id_livre) REFERENCES livre(id_livre)
);

CREATE TABLE reservation(
   id_reservation INT AUTO_INCREMENT,
   date_reservation DATE,
   date_debut_pret DATE,
   date_fin_pret DATE,
   id_livre INT NOT NULL,
   id_adherent INT NOT NULL,
   PRIMARY KEY(id_reservation),
   FOREIGN KEY(id_livre) REFERENCES livre(id_livre),
   FOREIGN KEY(id_adherent) REFERENCES adherent(id_adherent)
);

CREATE TABLE livre_categorie(
   id_livre INT AUTO_INCREMENT,
   id_categorie INT,
   PRIMARY KEY(id_livre, id_categorie),
   FOREIGN KEY(id_livre) REFERENCES livre(id_livre),
   FOREIGN KEY(id_categorie) REFERENCES categorie(id_categorie)
);
