<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bibliotheque - Accueil</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            color: #2c3e50;
            background-image: url('data:image/svg+xml;utf8,<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="20" cy="20" r="1.5" fill="%23667eea" fill-opacity="0.08"/></svg>');
        }
        .container {
            text-align: center;
            padding: 48px 36px 36px 36px;
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 18px;
            box-shadow: 0 12px 32px rgba(102, 126, 234, 0.10), 0 2px 8px rgba(44, 62, 80, 0.08);
            max-width: 440px;
            width: 95%;
            position: relative;
        }
        .biblio-header {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 18px;
        }
        .biblio-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 60%, #aab6fb 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2.2rem;
            font-weight: bold;
            margin-bottom: 10px;
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.15);
        }
        .biblio-title {
            font-size: 1.25rem;
            color: #667eea;
            font-weight: 600;
            margin-bottom: 2px;
        }
        h1 {
            font-size: 2.2rem;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        .nav-links {
            display: flex;
            justify-content: center;
            gap: 22px;
            margin-top: 18px;
        }
        .nav-links a {
            display: inline-block;
            background-color: #667eea;
            color: white;
            text-decoration: none;
            padding: 13px 32px;
            border-radius: 6px;
            font-size: 1.18rem;
            font-weight: 600;
            transition: background 0.3s, box-shadow 0.3s, transform 0.2s;
            position: relative;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.10);
        }
        .nav-links a:hover {
            background-color: #5a6cd1;
            transform: translateY(-2px) scale(1.04);
            box-shadow: 0 6px 18px rgba(102, 126, 234, 0.18);
        }
        .nav-links a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }
        .nav-links a:hover::before {
            left: 100%;
        }
        @media (max-width: 600px) {
            .container {
                padding: 20px 5px 20px 5px;
            }
            h1 {
                font-size: 1.3rem;
            }
            .biblio-avatar {
                width: 48px;
                height: 48px;
                font-size: 1.2rem;
            }
            .nav-links {
                flex-direction: column;
                gap: 15px;
            }
            .nav-links a {
                padding: 10px 20px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="biblio-header">
            <div class="biblio-avatar" aria-label="Icône bibliothèque">&#128218;</div>
            <div class="biblio-title">Bienvenue a la Bibliotheque</div>
        </div>
        <h1>Portail d'acces</h1>
        <div class="nav-links">
            <a href="admin">Espace Admin</a>
            <a href="adherent">Espace Adherent</a>
        </div>
    </div>
</body>
</html>