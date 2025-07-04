<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demande de pret</title>
    <style>
        body {
            background: linear-gradient(to bottom right, #f3f4f6, #e5e7eb);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 100%;
            max-width: 400px;
            margin: 16px;
            background: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.08);
            border-radius: 8px;
            padding: 24px;
        }
        h2 {
            font-size: 1.5rem;
            font-weight: bold;
            color: #1f2937;
            margin-bottom: 24px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 24px;
        }
        label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: #374151;
            margin-bottom: 4px;
        }
        select, input[type="date"] {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
            font-size: 1rem;
            outline: none;
            transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        select:focus, input[type="date"]:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.3);
        }
        button {
            width: 100%;
            background-color: #4f46e5;
            color: #ffffff;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.15s ease-in-out;
        }
        button:hover {
            background-color: #4338ca;
        }
        button:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.5);
        }
        .message {
            margin-top: 16px;
            padding: 16px;
            border-radius: 6px;
            text-align: center;
            font-size: 0.875rem;
        }
        .success {
            background-color: #d1fae5;
            color: #065f46;
        }
        .error {
            background-color: #fee2e2;
            color: #991b1b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Demander un pret de livre</h2>
        <form action="insert_pret" method="post">
            <div class="form-group">
                <label for="id_exemplaire">Livre (exemplaire) :</label>
                <select id="id_exemplaire" name="id_exemplaire" required>
                    <c:forEach var="exemplaire" items="${exemplaires}">
                        <option value="${exemplaire.idExemplaire}">
                            ${exemplaire.livre.titre} (Exemplaire ${exemplaire.idExemplaire})
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="id_type">Type de pret :</label>
                <select id="id_type" name="id_type" required>
                    <c:forEach var="typePret" items="${types}">
                        <option value="${typePret.idType}">
                            ${typePret.type}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="date_debut">Date debut :</label>
                <input type="date" id="date_debut" name="date_debut" required>
            </div>

            <div class="form-group">
                <label for="date_fin">Date fin :</label>
                <input type="date" id="date_fin" name="date_fin" required>
            </div>

            <div>
                <button type="submit">Demander le pret</button>
            </div>
        </form>

        <c:if test="${not empty message}">
            <div class="message success">${message}</div>
        </c:if>
        <c:if test="${not empty erreur}">
            <div class="message error">${erreur}</div>
        </c:if>
    </div>
</body>
</html>