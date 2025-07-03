
-- Insertion dans la table categorie
INSERT INTO categorie (id_categorie, nom_categorie) VALUES
(1, 'Roman'),
(2, 'Science-Fiction'),
(3, 'Histoire'),
(4, 'Biographie');

-- Insertion dans la table auteur
INSERT INTO auteur (id_auteur, prenom_auteur_, nom_auteur) VALUES
(1, 'Victor', 'Hugo'),
(2, 'Isaac', 'Asimov'),
(3, 'J.K.', 'Rowling'),
(4, 'Michelle', 'Obama');

-- Insertion dans la table profil
INSERT INTO profil (id_profil, type_adherant, quota_pret, quota_reservation) VALUES
(1, 'Etudiant', 3, 2),
(2, 'Professeur', 5, 3),
(3, 'Anonyme', 1, 1),
(4, 'Professionnel', 10, 5);

-- Insertion dans la table status
INSERT INTO status (id_status, nom_status) VALUES
(1, 'En attente'),
(2, 'Confirme'),
(3, 'Annulee'),
(4, 'Termine');

-- Insertion dans la table type_pret (avec données supplémentaires)
INSERT INTO type_pret (id_type, type) VALUES
(1, 'Sur place'),
(2, 'Long terme'),
(3, 'Court terme'), -- Nouvelle entrée
(4, 'Réservé');     -- Nouvelle entrée

-- Insertion dans la table admin
INSERT INTO admin (id, nom, mdp) VALUES
(1, 'admin1', '123');

-- Insertion dans la table livre
INSERT INTO livre (id_livre, titre, isbn, langue, annee_publication, synopsis, nb_page, id_auteur) VALUES
(1, 'Les Miserables', '978-0140444308', 'Français', 1862, 'Epopee sur la justice', 1232, 1),
(2, 'Fondation', '978-0553293357', 'Anglais', 1951, 'Saga de science-fiction', 320, 2),
(3, 'Harry Potter a l ecole des sorciers', '978-2070643028', 'Français', 1997, 'Aventure d un jeune sorcier', 300, 3),
(4, 'Devenir', '978-1524763138', 'Français', 2018, 'Memoires de Michelle Obama', 448, 4);

-- Insertion dans la table exemplaire
INSERT INTO exemplaire (id_exemplaire, disponible, id_livre) VALUES
(1, 10, 1),
(2, 20, 1),
(3, 21, 2),
(4, 21, 3),
(5, 60, 4);

-- Insertion dans la table adherant
INSERT INTO adherant (id_adherent, nom, prenom, password, id_profil) VALUES
(1, 'Dupont', 'Jean', 'jean123', 1),
(2, 'Martin', 'Sophie', 'sophie456', 2),
(3, 'Durand', 'Pierre', 'pierre789', 3);

-- Insertion dans la table pret
INSERT INTO pret (id_pret, date_debut, date_fin, id_type, id_adherent, id_exemplaire,rendu) VALUES
(1, '2025-06-01', '2025-06-15', 1, 1, 2,'true');
(2, '2025-06-05', '2025-07-05', 2, 2, 5),
(3, '2025-06-10', '2025-06-24', 1, 3, 4);

-- Insertion dans la table reservation
INSERT INTO reservation (id_reservation, date_reservation, date_debut_pret, date_fin_pret, id_status, id_adherent) VALUES
(1, '2025-06-01', '2025-06-15', '2025-06-29', 1, 1),
(2, '2025-06-02', '2025-06-20', '2025-07-04', 2, 2),
(3, '2025-06-03', NULL, NULL, 3, 3);

-- Insertion dans la table prolongement
INSERT INTO prolongement (id_prolongement, date_prolongement, id_status, id_adherent) VALUES
(1, '2025-06-15', 2, 1),
(2, '2025-06-20', 1, 2);

-- Insertion dans la table penalite
INSERT INTO penalite (id_penalite, debut_penalite, fin_penalite, id_adherent) VALUES
(1, '2025-06-16', '2025-06-30', 1),
(2, '2025-06-20', '2025-07-04', 3);

-- Insertion dans la table categorie_livre
INSERT INTO categorie_livre (id_livre, id_categorie) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 4);