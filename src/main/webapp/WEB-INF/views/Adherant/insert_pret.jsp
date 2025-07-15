<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demande de pret</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333333; /* Couleur de texte sombre */
        }

        .container {
            width: 100%;
            max-width: 450px;
            margin: 20px;
            background: #ffffff;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 30px;
            border-left: 4px solid #40c4ff; /* Bordure turquoise pour cohérence */
        }

        h2 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 30px;
            text-align: center;
            letter-spacing: -0.02em;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-size: 0.9rem;
            font-weight: 500;
            color: #1a1a1a;
            margin-bottom: 8px;
        }

        select, input[type="date"] {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            background-color: #f8f9fa;
            font-size: 1rem;
            outline: none;
            transition: all 0.3s ease;
        }

        select:focus, input[type="date"]:focus {
            border-color: #40c4ff; /* Turquoise pour le focus */
            box-shadow: 0 0 6px rgba(64, 196, 255, 0.3);
            background-color: #ffffff;
        }

        button {
            width: 100%;
            background: #40c4ff; /* Bouton turquoise */
            color: #ffffff;
            padding: 12px 16px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        button:hover {
            background: #0288d1; /* Bleu plus foncé pour le survol */
            box-shadow: 0 4px 10px rgba(64, 196, 255, 0.3);
        }

        button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.4s;
        }

        button:hover::before {
            left: 100%;
        }

        .message {
            margin-top: 20px;
            padding: 15px;
            border-radius: 6px;
            text-align: center;
            font-size: 0.875rem;
        }

        .success {
            background-color: #e6f3fa; /* Fond turquoise clair pour succès */
            color: #01579b;
        }

        .error {
            background-color: #fee2e2;
            color: #991b1b;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #40c4ff; /* Lien turquoise */
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #0288d1; /* Bleu plus foncé pour survol */
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin: 15px;
            }

            h2 {
                font-size: 1.5rem;
                margin-bottom: 20px;
            }

            select, input[type="date"], button {
                font-size: 0.95rem;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Demander un pret de livre</h2>
        <form action="insert_pret" method="post">
            <div class="form-group">
                <label for="id_exemplaire">Livre (exemplaire) :</label>
                <select id="id_exemplaire" name="id_exemplaire" required>
                    <c:forEach var="exemplaire" items="${exemplaires}">
                        <option value="${exemplaire.idExemplaire}">
                            ${exemplaire.livre.titre} (Exemplaire ${exemplaire.idExemplaire})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="id_type">Type de pret :</label>
                <select id="id_type" name="id_type" required>
                    <c:forEach var="typePret" items="${types}">
                        <option value="${typePret.idType}">
                            ${typePret.type}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="date_debut">Date debut :</label>
                <input type="date" id="date_debut" name="date_debut" required>
            </div>

            <div class="form-group">
                <label for="date_fin">Date fin :</label>
                <input type="date" id="date_fin" name="date_fin" required>
            </div>

            <div>
                <button type="submit">Demander le pret</button>
            </div>
        </form>

        <c:if test="${not empty message}">
            <div class="message success">${message}</div>
        </c:if>
        <c:if test="${not empty erreur}">
            <div class="message error">${erreur}</div>
        </c:if>

        <a href="retour" class="back-link">Retour a l'accueil</a>
    </div>
</body>
</html>