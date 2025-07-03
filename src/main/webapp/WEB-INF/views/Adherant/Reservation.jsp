<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Faire une réservation</title>
</head>
<body>
    <h2>Faire une réservation</h2>

    <c:if test="${not empty message}">
        <div style="color: green;">${message}</div>
    </c:if>
    <c:if test="${not empty erreur}">
        <div style="color: red;">${erreur}</div>
    </c:if>

    <form action="insert_reservation" method="post">
        <label for="id_exemplaire">Livre (exemplaire) :</label>
        <select id="id_exemplaire" name="id_exemplaire" required>
            <c:forEach var="exemplaire" items="${exemplaires}">
                <option value="${exemplaire.idExemplaire}">
                    ${exemplaire.livre.titre} (Exemplaire n°${exemplaire.idExemplaire})
                </option>
            </c:forEach>
        </select>
        <br><br>

        <label for="date_debut_pret">Date début du prêt :</label>
        <input type="date" id="date_debut_pret" name="date_debut_pret" required>
        <br><br>

        <label for="date_fin_pret">Date fin du prêt :</label>
        <input type="date" id="date_fin_pret" name="date_fin_pret" required>
        <br><br>

        <button type="submit">Réserver</button>
    </form>
</body>
</html>