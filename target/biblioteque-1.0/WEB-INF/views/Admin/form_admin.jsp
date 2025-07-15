<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Admin - Bibliotheque</title>
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
            /* Ajout d'un motif subtil */
            background-image: url('data:image/svg+xml;utf8,<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="20" cy="20" r="1.5" fill="%23667eea" fill-opacity="0.08"/></svg>');
        }

        .container {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 18px;
            box-shadow: 0 12px 32px rgba(102, 126, 234, 0.10), 0 2px 8px rgba(44, 62, 80, 0.08);
            padding: 44px 36px 32px 36px;
            max-width: 410px;
            width: 95%;
            text-align: center;
            position: relative;
        }

        .admin-header {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 18px;
        }
        .admin-avatar {
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
        .admin-title {
            font-size: 1.25rem;
            color: #667eea;
            font-weight: 600;
            margin-bottom: 2px;
        }
        h2 {
            font-size: 2rem;
            margin-bottom: 18px;
            color: #2c3e50;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            display: block;
            font-size: 1rem;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: 500;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 11px;
            border: 1.5px solid #dde2f1;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s, box-shadow 0.3s;
            background: #f7f9fc;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 7px rgba(102, 126, 234, 0.18);
            background: #fff;
        }
        button {
            background-color: #667eea;
            color: white;
            border: none;
            padding: 13px 0;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s, box-shadow 0.3s, transform 0.2s;
            width: 100%;
            margin-top: 8px;
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.10);
        }
        button:hover {
            background-color: #5a6cd1;
            transform: translateY(-2px) scale(1.02);
            box-shadow: 0 6px 18px rgba(102, 126, 234, 0.18);
        }
        .erreur {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 18px;
            font-size: 0.98rem;
        }
        .back-link {
            display: inline-block;
            margin-top: 24px;
            color: #667eea;
            text-decoration: none;
            font-size: 1.08rem;
            font-weight: 500;
            transition: color 0.3s, text-decoration 0.3s;
            border-bottom: 1.5px solid transparent;
        }
        .back-link:hover {
            color: #5a6cd1;
            text-decoration: underline;
            border-bottom: 1.5px solid #5a6cd1;
        }
        @media (max-width: 600px) {
            .container {
                padding: 18px 7px 18px 7px;
            }
            h2 {
                font-size: 1.3rem;
            }
            .admin-avatar {
                width: 54px;
                height: 54px;
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="admin-header">

        </div>
        <h2>Connexion Administrateur</h2>
        <!-- Afficher le message d'erreur s'il existe -->
        <c:if test="${not empty erreur}">
            <div class="erreur">${erreur}</div>
        </c:if>
        <form action="login" method="post" autocomplete="on">
            <div class="form-group">
                <label for="nom">Nom d'utilisateur :</label>
                <input type="text" id="nom" name="nom" required autocomplete="username">
            </div>
            <div class="form-group">
                <label for="mdp">Mot de passe :</label>
                <input type="password" id="mdp" name="mdp" required autocomplete="current-password">
            </div>
            <button type="submit">Se connecter</button>
        </form>
        <a href="/" class="back-link">&#8592; Retour a l'accueil</a>
    </div>
</body>
</html>