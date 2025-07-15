<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Livres - Bibliothèque</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }
        
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }
        
        tr:hover {
            background-color: #f5f5f5;
        }
        
        .back-link {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        .back-link:hover {
            background-color: #2980b9;
        }
        
        /* Style alterné pour les lignes */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        /* Style responsive */
        @media screen and (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }
            
            .container {
                width: 95%;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Liste des Livres</h1>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Titre</th>
                    <th>ISBN</th>
                    <th>Langue</th>
                    <th>Année</th>
                    <th>Pages</th>
                    <th>Auteur</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${livres}" var="livre">
                    <tr>
                        <td>${livre.idLivre}</td>
                        <td>${livre.titre}</td>
                        <td>${livre.isbn}</td>
                        <td>${livre.langue}</td>
                        <td>${livre.anneePublication}</td>
                        <td>${livre.nbPage}</td>
                        <td>${livre.auteur.prenomAuteur} ${livre.auteur.nomAuteur}</td>
                        <td>
                            <a href="details_livre?id=${livre.idLivre}" class="back-link">Détails</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <a href="retour_admin" class="back-link">&#8592; Retour a l'accueil</a>
    </div>
</body>
</html>