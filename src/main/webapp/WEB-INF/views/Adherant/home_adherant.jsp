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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #ffffff 100%);
            min-height: 100vh;
            color: #fff; /* Font color set to white */
        }

        .sidebar {
            height: 100vh;
            width: 280px;
            position: fixed;
            top: 0;
            left: 0;
            background: rgba(44, 62, 80, 0.95);
            backdrop-filter: blur(10px);
            padding: 30px 0;
            box-shadow: 2px 0 20px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .sidebar-header {
            padding: 0 30px 30px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 30px;
        }

        .sidebar-header h2 {
            color: #ecf0f1;
            font-size: 24px;
            font-weight: 300;
            text-align: center;
        }

        .sidebar-header .user-info {
            text-align: center;
            margin-top: 15px;
        }

        .user-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea, #ffffff);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 10px;
            color: white;
            font-size: 24px;
            font-weight: bold;
        }

        .user-name {
            color: #bdc3c7;
            font-size: 14px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
        }

        .sidebar-menu li {
            margin-bottom: 5px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            color: #ecf0f1;
            padding: 18px 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .sidebar-menu a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transition: left 0.5s;
        }

        .sidebar-menu a:hover::before {
            left: 100%;
        }

        .sidebar-menu a:hover {
            background: rgba(52, 73, 94, 0.8);
            transform: translateX(5px);
            border-left: 4px solid #667eea;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
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
            <li><a href="#">Mes prets</a></li>
            <li><a href="#">Mes reservations</a></li>
            <li><a href="#">Mon profil</a></li>
             <li><a href="render_insertPret">Faire une pret</a></li>
            <li><a href="#">Deconnexion</a></li>
        </ul>
    </div>
</body>
</html>