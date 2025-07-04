<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Réservations</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            position: sticky;
            top: 0;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Liste des Réservations</h1>
            <div class="actions">
                <a href="/add_reservation" class="btn btn-primary">Ajouter une réservation</a>
            </div>
        </div>

        <c:if test="${not empty reservations}">
            <table>
                <thead>
                    <tr>
                        <th>Date Réservation</th>
                        <th>Date Début Prêt</th>
                        <th>Date Fin Prêt</th>
                        <th>Exemplaire</th>
                        <th>Status</th>
                        <th>Adhérent</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${reservations}" var="reservation">
                        <tr>
                            <td>${reservation.idReservation}</td>
                            <td>
                                <fmt:formatDate value="${reservation.dateReservation}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${reservation.dateDebutPret}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${reservation.dateFinPret}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>${reservation.exemplaire.idExemplaire}</td>
                            <td>${reservation.status.nomStatus}</td>
                            <td>${reservation.adherant.nom} ${reservation.adherant.prenom}</td>
                            <td>
                                <a href="valider_reservation">Valider</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty reservations}">
            <p>Aucune réservation trouvée.</p>
        </c:if>
    </div>
</body>
</html>