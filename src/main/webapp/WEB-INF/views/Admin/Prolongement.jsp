<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Prolongements</title>
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
            max-width: 900px;
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
        .status-pending {
            color: #ffc107;
            font-weight: bold;
        }
        .status-confirmed {
            color: #17a2b8;
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
        .back-link {
            display: inline-block;
            margin: 24px auto 0 auto;
            color: #667eea;
            text-decoration: none;
            font-size: 1.08rem;
            font-weight: 500;
            transition: color 0.3s, text-decoration 0.3s;
            border-bottom: 1.5px solid transparent;
            border-radius: 4px;
            padding: 6px 18px;
            background: #f7f9fc;
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.07);
        }
        .back-link:hover {
            color: #5a6cd1;
            text-decoration: underline;
            border-bottom: 1.5px solid #5a6cd1;
            background: #e9f0fb;
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
        <a href="#home" class="logo">Bibliotheque</a>
        <ul class="nav-links">
            <li><a href="#home">Accueil</a></li>
            <li><a href="render_gestion">Gestion Réservation</a></li>
            <li><a href="render_prologement" class="active">Gestion des Prolongements</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
        <button class="hamburger">☰</button>
    </nav>

    <div class="admin-header">
        <div class="admin-avatar" aria-label="Icône administrateur">&#128274;</div>
        <div class="admin-title">Espace administrateur</div>
    </div>

    <div class="container">
        <h2>Liste des Prolongements</h2>
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
                    <th>Date Prolongement</th>
                    <th>Statut</th>
                    <th>Adhérent</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="prolongement" items="${prolongements}">
                    <tr>
                        <td><fmt:formatDate value="${prolongement.dateProlongement}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${prolongement.status.nomStatus == 'en attente' || prolongement.status.nomStatus == 'En attente'}">
                                    <span class="status-pending">En attente</span>
                                </c:when>
                                <c:when test="${prolongement.status.nomStatus == 'confirmee' || prolongement.status.nomStatus == 'Confirmée' || prolongement.status.nomStatus == 'Confirme'}">
                                    <span class="status-confirmed">Confirmée</span>
                                </c:when>
                                <c:when test="${prolongement.status.nomStatus == 'annulee' || prolongement.status.nomStatus == 'Annulée'}">
                                    <span style="color: #dc3545; font-weight: bold;">Annulée</span>
                                </c:when>
                                <c:otherwise>
                                    <span>${prolongement.status.nomStatus}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${prolongement.adherent.nom} ${prolongement.adherent.prenom}</td>
                        <td>
                            <c:if test="${prolongement.status.nomStatus == 'en attente' || prolongement.status.nomStatus == 'En attente'}">
                                <form action="${pageContext.request.contextPath}/accepter_prolongement" method="post" class="return-form" style="display: inline-block; margin-left: 10px;">
                                    <input type="hidden" name="id_prolongement" value="${prolongement.idProlongement}">
                                    <input type="submit" class="rendu-button" value="Accepter">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty prolongements}">
                    <tr>
                        <td colspan="4" style="text-align: center;">Aucun prolongement enregistré</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>  
     <a href="retour_admin" class="back-link">&#8592; Retour a l'accueil</a>
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