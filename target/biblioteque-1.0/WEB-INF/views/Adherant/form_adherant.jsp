<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Adherent</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(145deg, #2a2a72 0%, #009ffd 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #1a1a1a;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
            padding: 50px;
            max-width: 450px;
            width: 95%;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        h2 {
            font-size: 2.2rem;
            margin-bottom: 30px;
            color: #1a1a1a;
            font-weight: 600;
            letter-spacing: -0.02em;
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        label {
            display: block;
            font-size: 1.1rem;
            margin-bottom: 10px;
            color: #1a1a1a;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #009ffd;
            background-color: #ffffff;
            box-shadow: 0 0 8px rgba(0, 159, 253, 0.3);
        }

        button {
            background: linear-gradient(90deg, #009ffd 0%, #2a2a72 100%);
            color: white;
            border: none;
            padding: 14px 28px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            position: relative;
            overflow: hidden;
        }

        button:hover {
            background: linear-gradient(90deg, #0086d6 0%, #1e1e5a 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 159, 253, 0.3);
        }

        button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.25), transparent);
            transition: left 0.4s;
        }

        button:hover::before {
            left: 100%;
        }

        @media (max-width: 600px) {
            .container {
                padding: 30px;
                width: 90%;
            }

            h2 {
                font-size: 1.8rem;
                margin-bottom: 20px;
            }

            input[type="text"],
            input[type="password"],
            button {
                font-size: 0.95rem;
                padding: 10px;
            }

            .form-group {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Connexion Adherent</h2>
        <form action="adherent_login" method="post">
            <div class="form-group">
                <label for="nom">Nom :</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="password">Mot de passe :</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Se connecter</button>
        </form>
    </div>
</body>
</html>