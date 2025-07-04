<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Admin - Bibliothèque</title>
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
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 400px;
            width: 90%;
            text-align: center;
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
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
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.5);
        }

        button {
            background-color: #667eea;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            font-size: 1.1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            width: 100%;
        }

        button:hover {
            background-color: #5a6cd1;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        button:hover::before {
            left: 100%;
        }

        .erreur {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #5a6cd1;
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 1.5rem;
            }

            input[type="text"],
            input[type="password"],
            button {
                font-size: 0.9rem;
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Connexion Administrateur</h2>
        <!-- Afficher le message d'erreur s'il existe -->
        <c:if test="${not empty erreur}">
            <div class="erreur">${erreur}</div>
        </c:if>
        <form action="login" method="post">
            <div class="form-group">
                <label for="nom">Nom d'utilisateur :</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="mdp">Mot de passe :</label>
                <input type="password" id="mdp" name="mdp" required>
            </div>
            <button type="submit">Se connecter</button>
        </form>
        <a href="/" class="back-link">Retour a l'accueil</a>
    </div>
</body>
</html>