<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Demande de pret</title>
</head>
<body>
    <h2>Demander un pret de livre</h2>
    <form action="insert_pret" method="post">
        <label for="id_exemplaire">Livre (exemplaire) :</label>
        <select id="id_exemplaire" name="id_exemplaire" required>
            <c:forEach var="exemplaire" items="${exemplaires}">
                <option value="${exemplaire.idExemplaire}">
                    ${exemplaire.livre.titre} (Exemplaire n°${exemplaire.idExemplaire})
                </option>
            </c:forEach>
        </select>
        <br><br>

        <label for="id_type">Type de prêt :</label>
        <select id="id_type" name="id_type" required>
            <c:forEach var="typePret" items="${types}">
                <option value="${typePret.idType}">
                    ${typePret.type}
                </option>
            </c:forEach>
        </select>
        <br><br>

        <label for="date_debut">Date debut :</label>
        <input type="date" id="date_debut" name="date_debut" required>
        <br><br>

        <label for="date_fin">Date fin :</label>
        <input type="date" id="date_fin" name="date_fin" required>
        <br><br>

        <button type="submit">Demander le pret</button>
    </form>

    <c:if test="${not empty message}">
        <div style="color:green;">${message}</div>
    </c:if>
    <c:if test="${not empty erreur}">
        <div style="color:red;">${erreur}</div>
    </c:if>
</body>
</html>