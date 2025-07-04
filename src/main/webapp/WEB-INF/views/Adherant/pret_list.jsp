<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste de mes prets - Bibliotheque</title>
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
            color: #2c3e50;
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

        .sidebar-menu a.active {
            background: rgba(52, 73, 94, 0.8);
            border-left: 4px solid #667eea;
        }

        .container {
            margin-left: 320px;
            padding: 40px;
            max-width: 1200px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            text-align: center;
        }

        .loan-table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .loan-table th,
        .loan-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: #2c3e50;
        }

        .loan-table th {
            background-color: #2c3e50;
            color: white;
        }

        .loan-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .loan-table tr:hover {
            background-color: #f1f1f1;
        }

        .action-button {
            background-color: #667eea;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            transition: background-color 0.3s;
            margin-right: 5px;
            display: inline-block;
        }

        .action-button:hover {
            background-color: #5a6cd1;
        }

        .action-button:disabled {
            background-color: #6c757d;
            cursor: not-allowed;
        }

        .status-returned {
            color: #28a745;
            font-weight: bold;
        }

        .status-pending {
            color: #ffc107;
            font-weight: bold;
        }

        .message,
        .erreur {
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
        }

        .message {
            background-color: #d4edda;
            color: #155724;
        }

        .erreur {
            background-color: #f8d7da;
            color: #721c24;
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

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .container {
                margin-left: 0;
                padding: 20px;
            }

            .loan-table {
                font-size: 14px;
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
            <li><a href="liste_pret" class="active">Mes prets</a></li>
            <li><a href="faire_reservation">Faire une reservation</a></li>
            <li><a href="#">Mon profil</a></li>
            <li><a href="render_insertPret">Faire un pret</a></li>
            <li><a href="#">Deconnexion</a></li>
        </ul>
    </div>

    <div class="container">
        <h2>Liste de mes prets</h2>
        <!-- Afficher les messages de confirmation ou d'erreur -->
        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>
        <c:if test="${not empty erreur}">
            <div class="erreur">${erreur}</div>
        </c:if>
        <c:if test="${empty prets}">
            <p style="color: #2c3e50; text-align: center;">Aucun pret trouve.</p>
        </c:if>
        <c:if test="${not empty prets}">
            <table class="loan-table">
                <thead>
                    <tr>
                        <th>Livre</th>
                        <th>Exemplaire</th>
                        <th>Date debut</th>
                        <th>Date fin</th>
                        <th>Type de pret</th>
                        <th>Rendu</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pret" items="${prets}">
                        <tr>
                            <td>${pret.exemplaire.livre.titre}</td>
                            <td>${pret.exemplaire.idExemplaire}</td>
                            <td>${pret.dateDebut}</td>
                            <td>${pret.dateFin}</td>
                            <td>${pret.typePret.type}</td>
                            <td>
                                <!-- Debogage temporaire -->
                                <c:out value="Debug: rendu=${pret.rendu}, idPret=${pret.idPret}" />
                                <c:choose>
                                    <c:when test="${pret.rendu == 1}">
                                        <span class="status-returned">Le livre est rendu</span>
                                    </c:when>
                                    <c:when test="${pret.rendu == 0}">
                                        <span class="status-pending">En cours de lecture</span>
                                        <form action="prolonger" method="post" style="display: inline;">
                                            <input type="hidden" name="pretId" value="${pret.idPret}">
                                            <button type="submit" class="action-button">Prolonger</button>
                                        </form>
                                        <form action="rendre_livre" method="post" style="display: inline;">
                                            <input type="hidden" name="pretId" value="${pret.idPret}">
                                            <button type="submit" class="action-button">Rendre</button>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-pending">En cours de lecture</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <br>
        <a href="/" class="back-link">Retour a l'accueil</a>
    </div>
</body>
</html>