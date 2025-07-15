<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil Adherent</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: #f4f4f9; /* Fond gris clair neutre */
            min-height: 100vh;
            color: #333333; /* Couleur de texte sombre */
        }

        .sidebar {
            height: 100vh;
            width: 300px;
            position: fixed;
            top: 0;
            left: 0;
            background: #40c4ff; /* Bleu turquoise pour la sidebar */
            padding: 40px 0;
            box-shadow: 4px 0 15px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            border-right: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar-header {
            padding: 0 30px 30px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            margin-bottom: 40px;
            text-align: center;
        }

        .sidebar-header h2 {
            color: #ffffff; /* Texte blanc pour contraste */
            font-size: 26px;
            font-weight: 500;
            letter-spacing: -0.02em;
        }

        .sidebar-header .user-info {
            margin-top: 20px;
        }

        .user-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: #0288d1; /* Bleu plus foncé pour l'avatar, en harmonie avec le turquoise */
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 12px;
            color: #ffffff;
            font-size: 28px;
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .user-name {
            color: #e0f7fa; /* Texte cyan clair pour harmoniser avec le turquoise */
            font-size: 15px;
            font-weight: 400;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
        }

        .sidebar-menu li {
            margin-bottom: 8px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            color: #ffffff;
            padding: 16px 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            position: relative;
            font-size: 1.05rem;
            font-weight: 400;
            border-radius: 8px;
            margin: 0 15px;
        }

        .sidebar-menu a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.4s;
        }

        .sidebar-menu a:hover::before {
            left: 100%;
        }

        .sidebar-menu a:hover {
            background: rgba(255, 255, 255, 0.1); /* Effet de survol subtil */
            transform: translateX(8px);
            border-left: 4px solid #0288d1; /* Bordure bleu foncé pour le survol */
            color: #ffffff;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                padding: 20px 0;
            }

            .sidebar-header {
                padding: 0 20px 20px;
                margin-bottom: 20px;
            }

            .sidebar-header h2 {
                font-size: 22px;
            }

            .user-avatar {
                width: 60px;
                height: 60px;
                font-size: 24px;
            }

            .sidebar-menu a {
                padding: 14px 20px;
                font-size: 1rem;
                margin: 0 10px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="user-avatar">A</div>
            <div class="user-name">Adherent</div>
            <h2>Bibliotheque</h2>
        </div>
        <ul class="sidebar-menu">
            <li><a href="#">Voir les livres</a></li>
            <li><a href="liste_pret">Mes prets</a></li>
            <li><a href="faire_reservation">Faire une reservation</a></li>
            <li><a href="render_penalite">Mes penalites </a></li>
            <li><a href="render_insertPret">Faire un pret</a></li>
            <li><a href="#">Deconnexion</a></li>
        </ul>
    </div>
</body>
</html>