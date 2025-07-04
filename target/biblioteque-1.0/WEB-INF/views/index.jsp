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
        }

        .container {
            text-align: center;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 90%;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .nav-links {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .nav-links a {
            display: inline-block;
            background-color: #667eea;
            color: white;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 5px;
            font-size: 1.2rem;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .nav-links a:hover {
            background-color: #5a6cd1;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
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
                padding: 20px;
            }

            h1 {
                font-size: 2rem;
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
        <h1>Bienvenue a la Bibliotheque</h1>
        <div class="nav-links">
            <a href="admin">Admin</a>
            <a href="adherent">Adherent</a>
        </div>
    </div>
</body>
</html>