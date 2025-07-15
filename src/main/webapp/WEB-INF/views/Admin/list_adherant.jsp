<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Adhérants</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
        }
        .table-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        .back-link:hover {
            background-color: #2563eb;
            color: white;
            transition: all 0.3s ease;
        }
        .detail-btn:hover {
            background-color: #1e40af;
            transition: all 0.3s ease;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h1 class="text-3xl font-bold text-gray-800 mb-6 text-center">Liste des Adhérants</h1>
        <div class="shadow-lg rounded-lg overflow-hidden">
            <table class="w-full bg-white">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="py-3 px-6 text-left text-sm font-semibold text-gray-600">Nom</th>
                        <th class="py-3 px-6 text-left text-sm font-semibold text-gray-600">Prénom</th>
                        <th class="py-3 px-6 text-left text-sm font-semibold text-gray-600">Quota</th>
                        <th class="py-3 px-6 text-left text-sm font-semibold text-gray-600">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="adherant" items="${adherants}">
                        <tr class="border-b hover:bg-gray-50">
                            <td class="py-4 px-6 text-gray-700">${adherant.nom}</td>
                            <td class="py-4 px-6 text-gray-700">${adherant.prenom}</td>
                            <td class="py-4 px-6 text-gray-700">${adherant.profil.quotaPret}</td>
                            <td class="py-4 px-6">
                                <a href="details_adherant?id=${adherant.idAdherent}" class="detail-btn inline-block bg-blue-600 text-white px-4 py-2 rounded-md text-sm font-medium">Détail</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="retour_admin" class="back-link inline-block mt-6 bg-gray-600 text-white px-4 py-2 rounded-md text-sm font-medium">← Retour à l'accueil</a>
    </div>
</body>
</html>