<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil Adhérant</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .sidebar {
            height: 100vh;
            width: 220px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50;
            padding-top: 30px;
        }
        .sidebar a {
            display: block;
            color: #ecf0f1;
            padding: 16px;
            text-decoration: none;
            transition: background 0.2s;
        }
        .sidebar a:hover {
            background-color: #34495e;
        }
        .main-content {
            margin-left: 240px;
            padding: 30px;
        }
        h1 {
            color: #2c3e50;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <a href="#">Voir les livres</a>
        <a href="#">Mes prêts</a>
        <a href="#">Mes réservations</a>
        <a href="#">Mon profil</a>
        <a href="#">Déconnexion</a>
    </div>
    <div class="main-content">
        <h1>Bienvenue sur votre espace adhérant !</h1>
        <p>Sélectionnez une action dans le menu à gauche.</p>
    </div>
</body>
</html>