<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste de mes penalites - Bibliotheque</title>
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
            background: #0288d1; /* Bleu plus foncé pour l'avatar */
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
            color: #e0f7fa; /* Cyan clair pour harmoniser avec le turquoise */
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
            background: rgba(255, 255, 255, 0.1);
            transform: translateX(8px);
            border-left: 4px solid #0288d1; /* Bordure bleu foncé pour survol */
            color: #ffffff;
        }

        .sidebar-menu a.active {
            background: rgba(255, 255, 255, 0.15);
            border-left: 4px solid #0288d1; /* Bleu foncé pour l'élément actif */
        }

        .container {
            margin-left: 340px;
            padding: 40px;
            max-width: 1200px;
        }

        h2 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 30px;
            text-align: center;
            letter-spacing: -0.02em;
        }

        .loan-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .loan-table th,
        .loan-table td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
            color: #333333;
        }

        .loan-table th {
            background-color: #374151; /* Gris anthracite pour l'en-tête du tableau */
            color: #ffffff;
            font-weight: 600;
        }

        .loan-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .loan-table tr:hover {
            background-color: #f3f4f6; /* Gris clair pour survol */
        }

        .action-button {
            background-color: #40c4ff; /* Bouton turquoise */
            color: #ffffff;
            border: none;
            padding: 10px 14px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.9rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            margin-right: 8px;
            display: inline-block;
            position: relative;
            overflow: hidden;
        }

        .action-button:hover {
            background-color: #0288d1; /* Bleu plus foncé pour survol */
            box-shadow: 0 4px 10px rgba(64, 196, 255, 0.3);
        }

        .action-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.4s;
        }

        .action-button:hover::before {
            left: 100%;
        }

        .action-button:disabled {
            background-color: #6b7280;
            cursor: not-allowed;
        }

        .status-returned {
            color: #2e7d32;
            font-weight: 600;
        }

        .status-pending {
            color: #0288d1; /* Bleu turquoise pour statut en cours */
            font-weight: 600;
        }

        .message,
        .erreur {
            text-align: center;
            margin-bottom: 25px;
            padding: 15px;
            border-radius: 6px;
            font-size: 0.9rem;
        }

        .message {
            background-color: #e6f3fa; /* Turquoise clair pour message de succès */
            color: #01579b;
        }

        .erreur {
            background-color: #fee2e2;
            color: #991b1b;
        }

        .back-link {
            display: inline-block;
            margin-top: 25px;
            color: #40c4ff; /* Lien turquoise */
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .back-link:hover {
            color: #0288d1; /* Bleu plus foncé pour survol */
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                padding: 20px 0;
            }

            .container {
                margin-left: 0;
                padding: 20px;
            }

            .loan-table {
                font-size: 0.85rem;
            }

            .loan-table th,
            .loan-table td {
                padding: 10px;
            }

            .action-button {
                padding: 8px 12px;
                font-size: 0.85rem;
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
            <li><a href="liste_penalite" class="active">Mes penalites</a></li>
            <li><a href="faire_reservation">Faire une reservation</a></li>
            <li><a href="#">Mon profil</a></li>
             <li><a href="render_insertPret">Faire un pret</a></li>
            <li><a href="#">Deconnexion</a></li>
        </ul>
    </div>

    <div class="container">
        <h2>Liste de mes penalites</h2>
        <!-- Afficher les messages de confirmation ou d'erreur -->
        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>
        <c:if test="${not empty erreur}">
            <div class="erreur">${erreur}</div>
        </c:if>
        <c:if test="${empty penalites}">
            <p style="color: #333333; text-align: center;">Aucun penalite trouve.</p>
        </c:if>
        <c:if test="${not empty penalites}">
            <table class="loan-table">
                <thead>
                    <tr>
                        <th>Date debut  penalite </th>
                        <th>Date fin penalite </th>
                        <th>Adherant </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="penalite" items="${penalites}">
                        <tr>
                            <td>${penalite.getDebutPenalite()}</td>
                            <td>${penalite.getFinPenalite()}</td>
                            <td>${penalite.adherant.getNom()} ${penalite.adherant.getNom()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <br>
        <a href="retour" class="back-link">Retour a l'accueil</a>
    </div>
</body>
</html>