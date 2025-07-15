<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord Admin</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #ffffff 100%);
            min-height: 100vh;
            color: #2c3e50;
            background-image: url('data:image/svg+xml;utf8,<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="20" cy="20" r="1.5" fill="%23667eea" fill-opacity="0.08"/></svg>');
        }
        .navbar {
            background-color: #2c3e50;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.13);
        }
        .navbar .logo {
            color: white;
            font-size: 1.7rem;
            font-weight: bold;
            text-decoration: none;
            letter-spacing: 1px;
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
            font-size: 1.08rem;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background 0.3s, color 0.3s;
        }
        .nav-links a:hover, .nav-links a.active {
            background-color: #667eea;
            color: #fff;
        }
        .hamburger {
            display: none;
            font-size: 24px;
            color: white;
            background: none;
            border: none;
            cursor: pointer;
        }
        .admin-header {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 18px;
            margin-top: 30px;
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
        .container {
            background-color: rgba(255,255,255,0.98);
            border-radius: 18px;
            box-shadow: 0 12px 32px rgba(102, 126, 234, 0.10), 0 2px 8px rgba(44, 62, 80, 0.08);
            padding: 36px 18px 28px 18px;
            max-width: 1100px;
            width: 97%;
            margin: 32px auto 0 auto;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        .loan-table {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.07);
            border-radius: 10px;
            overflow: hidden;
        }
        .loan-table th, .loan-table td {
            padding: 13px 10px;
            text-align: left;
            border-bottom: 1px solid #e3e6f0;
        }
        .loan-table th {
            background-color: #667eea;
            color: white;
            font-weight: 600;
            font-size: 1.05rem;
        }
        .loan-table tr:nth-child(even) {
            background-color: #f7f9fc;
        }
        .loan-table tr:hover {
            background-color: #e9f0fb;
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
        .message, .erreur {
            text-align: center;
            margin-bottom: 18px;
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
        @media screen and (max-width: 900px) {
            .container {
                padding: 10px 2px 10px 2px;
            }
            .loan-table th, .loan-table td {
                padding: 8px 4px;
                font-size: 0.98rem;
            }
        }
        @media screen and (max-width: 600px) {
            .container {
                padding: 2px 0 2px 0;
            }
            .admin-header {
                margin-top: 10px;
            }
            .admin-avatar {
                width: 48px;
                height: 48px;
                font-size: 1.2rem;
            }
            .loan-table th, .loan-table td {
                font-size: 0.89rem;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#home" class="logo">Bibliothèque</a>
        <ul class="nav-links">
            <li><a href="#home" class="active">Accueil</a></li>
            <li><a href="render_gestion">Gestion Reservation</a></li>
            <li><a href="render_prologement">Gestion des prologement</a></li>
            <li><a href="render_list_livre">List des livres</a></li>
        </ul>
        <button class="hamburger">☰</button>
    </nav>

    <div class="admin-header">
        <div class="admin-avatar" aria-label="Icône administrateur">&#128274;</div>
        <div class="admin-title">Espace administrateur</div>
    </div>

    <div class="container">
        <h2>Liste des Prêts</h2>
        <!-- Afficher les messages de confirmation ou d'erreur -->
        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>
        <c:if test="${not empty erreur}">
            <div class="erreur">${erreur}</div>
        </c:if>
        <table class="loan-table">
            <thead>
                <tr>
                    <th>Date Debut</th>
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
                        <td><fmt:formatDate value="${pret.dateDebut}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${pret.dateFin}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${pret.rendu == 1}">
                                    <span class="status-returned">Le livre est rendu</span>
                                </c:when>
                                <c:when test="${pret.rendu == 0}">
                                    <span class="status-pending">En cours de lecture</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-pending">En cours de lecture</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${pret.typePret.type}</td>
                        <td>${pret.adherant.nom} ${pret.adherant.prenom}</td>
                        <td>${pret.exemplaire.livre.titre}</td>
                        <td>
                            <c:choose>
                                <c:when test="${pret.rendu == 1}">
                                    <button class="rendu-button" disabled>
                                        <i class="fas fa-check"></i> Livre rendu
                                    </button>
                                </c:when>
                                <c:when test="${pret.rendu == 0}">
                                    <form action="${pageContext.request.contextPath}/rendre_livre" method="get" class="return-form">
                                        <input type="hidden" name="pretId" value="${pret.idPret}">
                                        <div class="date-picker-container">
                                            <label for="date_rendu_${pret.idPret}">Date de retour :</label>
                                            <c:set var="today" value="<%= new java.util.Date() %>"/>
                                            <input type="date" id="date_rendu_${pret.idPret}" name="date_rendu" 
                                                   value="<fmt:formatDate value='${today}' pattern='yyyy-MM-dd'/>"
                                            >
                                        </div>
                                        <button type="submit" class="rendu-button">
                                            <i class="fas fa-book"></i>rendre
                                        </button>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-pending">
                                        <i class="fas fa-hourglass-half"></i> En cours
                                    </span>
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

        document.addEventListener('click', (e) => {
            if (!e.target.closest('.navbar')) {
                navLinks.classList.remove('active');
            }
        });
    </script>
</body>
</html>