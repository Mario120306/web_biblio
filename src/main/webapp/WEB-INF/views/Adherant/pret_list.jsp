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
                        <!-- Débogage temporaire -->
                        <c:out value="Debug: rendu=${pret.rendu}, idPret=${pret.idPret}" />
                        <c:choose>
                            <c:when test="${pret.getRendu()==1}">
                                Le livre est rendu
                            </c:when>
                            <c:when test="${pret.getRendu()==0}">
                                En cours de lecture <a href="prolonger?pretId=${pret.getIdPret()}">Prolonger</a>
                            </c:when>
                            <c:otherwise>
                                En cours de lecture
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <br>
    <a href="#">Retour à l'accueil</a>
</body>
</html>