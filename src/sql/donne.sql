INSERT INTO admin (id_admin, nom, mdp) VALUES (1, 'admin', 'admin123');

INSERT INTO adherant (id_adherent, nom, prenom, password, id_profil)
VALUES (1, 'dupont', 'jean', 'motdepasse123', 1);

INSERT INTO profil (id_profil, type_adherant, quota_pret, quota_reservation)
VALUES (1, 'Etudiant', 5, 2);

UPDATE adherant
SET nom = 'durand', prenom = 'paul', password = '12', id_profil = 1
WHERE id_adherent = 1;

INSERT INTO categorie (id_categorie, nom_categorie) VALUES (1, 'Roman');
INSERT INTO categorie (id_categorie, nom_categorie) VALUES (2, 'Science');
INSERT INTO categorie (id_categorie, nom_categorie) VALUES (3, 'Histoire');
INSERT INTO categorie (id_categorie, nom_categorie) VALUES (4, 'Informatique');