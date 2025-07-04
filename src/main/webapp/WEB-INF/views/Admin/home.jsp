<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord Admin</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .navbar {
            background-color: #2c3e50;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .navbar .logo {
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin-left: 20px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 15px;
            transition: background-color 0.3s, color 0.3s;
        }

        .nav-links a:hover {
            background-color: #34495e;
            border-radius: 5px;
        }

        .nav-links a.active {
            background-color: #3498db;
            border-radius: 5px;
        }

        .hamburger {
            display: none;
            font-size: 24px;
            color: white;
            background: none;
            border: none;
            cursor: pointer;
        }

        .loan-table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .loan-table th, .loan-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .loan-table th {
            background-color: #2c3e50;
            color: white;
            position: sticky;
            top: 0;
        }

        .loan-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .loan-table tr:hover {
            background-color: #f1f1f1;
        }

        .container {
            padding: 20px;
            margin-top: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .rendu-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .rendu-button:hover {
            background-color: #218838;
        }

        .rendu-button:disabled {
            background-color: #6c757d;
            cursor: not-allowed;
        }

        .status-pending {
            color: #ffc107;
            font-weight: bold;
        }

        .status-returned {
            color: #28a745;
            font-weight: bold;
        }

        @media screen and (max-width: 768px) {
            .hamburger {
                display: block;
            }

            .nav-links {
                display: none;
                width: 100%;
                position: absolute;
                top: 60px;
                left: 0;
                background-color: #2c3e50;
                flex-direction: column;
                text-align: center;
            }

            .nav-links.active {
                display: flex;
            }

            .nav-links li {
                margin: 10px 0;
            }

            .loan-table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#home" class="logo">Bibliothèque</a>
        <ul class="nav-links">
            <li><a href="#home" class="active">Accueil</a></li>
            <li><a href="render_reservation">Gestion Réservation</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
        <button class="hamburger">☰</button>
    </nav>

    <div class="container">
        <h2>Liste des Prêts</h2>
        <table class="loan-table">
            <thead>
                <tr>
                    <th>Date Début</th>
                    <th>Date Fin</th>
                    <th>Statut</th>
                    <th>Type</th>
                    <th>Adhérent</th>
                    <th>Exemplaire</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="pret" items="${prets}">
                    <tr>
                        <td>${pret.dateDebut}</td>
                        <td>${pret.dateFin}</td>
                        <td>
                            <!-- Débogage temporaire -->
                            <c:choose>
                                <c:when test="${pret.getRendu() == 1}">
                                    <span class="status-returned">Le livre est rendu</span>
                                </c:when>
                                <c:when test="${pret.getRendu() == 0}">
                                    <span class="status-pending">En cours de lecture</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-pending">En cours de lecture</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${pret.typePret.type}</td>
                        <td>${pret.adherant.nom} ${pret.adherant.prenom}</td>
                        <td>${pret.exemplaire.livre.titre} (ID: ${pret.exemplaire.idExemplaire})</td>
                        <td>
                            <c:choose>
                                <c:when test="${pret.getRendu() == 1}">
                                    <button class="rendu-button" disabled>Le livre est rendu</button>
                                </c:when>
                                <c:when test="${pret.getRendu() == 0}">
                                    <a href="prolonger?pretId=${pret.getIdPret()}" class="rendu-button">Render</a>
                                </c:when>
                                <c:otherwise>
                                    <span>En cours de lecture</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty prets}">
                    <tr>
                        <td colspan="7" style="text-align: center;">Aucun prêt enregistré</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <script>
        const hamburger = document.querySelector('.hamburger');
        const navLinks = document.querySelector('.nav-links');
        
        hamburger.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });

        // Fermer le menu lorsqu'on clique ailleurs
        document.addEventListener('click', (e) => {
            if (!e.target.closest('.navbar')) {
                navLinks.classList.remove('active');
            }
        });
    </script>
</body>
</html>