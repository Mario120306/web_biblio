<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mes prêts</title>
</head>
<body>
    <h2>Liste de mes prêts</h2>
    <c:if test="${empty prets}">
        <p>Aucun prêt trouvé.</p>
    </c:if>
    <c:if test="${not empty prets}">
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>Livre</th>
                <th>Exemplaire</th>
                <th>Date début</th>
                <th>Date fin</th>
                <th>Type de prêt</th>
                <th>Rendu</th>
            </tr>
            <c:forEach var="pret" items="${prets}">
                <tr>
                    <td>${pret.exemplaire.livre.titre}</td>
                    <td>${pret.exemplaire.idExemplaire}</td>
                    <td>${pret.dateDebut}</td>
                    <td>${pret.dateFin}</td>
                    <td>${pret.typePret.type}</td>
                    <td>
                        <% 
                            if ("1".equals(String.valueOf(pageContext.getAttribute("pret.rendu")))) {
                                out.print("Le livre est rendu");
                            } else {
                                out.print("En cours de lecture");
                            }
                        %>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <br>
    <a href="#">Retour à l'accueil</a>
</body>
</html>