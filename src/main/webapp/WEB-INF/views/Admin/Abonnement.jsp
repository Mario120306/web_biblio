<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nouvel Abonnement</title>
    <style>
        /* Police moderne et variables CSS */
        @font-face {
            font-family: 'ModernSans';
            src: local('Arial'), local('Helvetica');
        }
        
        :root {
            --primary: #2c3e50;
            --secondary: #34495e;
            --accent: #3498db;
            --success: #2ecc71;
            --danger: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --shadow: 0 4px 8px rgba(0,0,0,0.1);
            --radius: 6px;
            --transition: all 0.3s ease;
        }
        
        /* Reset et base */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'ModernSans', sans-serif;
            line-height: 1.6;
            background-color: #f5f7fa;
            color: var(--dark);
            padding: 20px;
        }
        
        /* Conteneur principal */
        .main-container {
            max-width: 700px;
            margin: 30px auto;
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
        }
        
        /* En-tête */
        .form-header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 25px;
            text-align: center;
            position: relative;
        }
        
        .form-header h2 {
            font-size: 1.8em;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        /* Contenu du formulaire */
        .form-body {
            padding: 30px;
        }
        
        /* Groupes de formulaire */
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--secondary);
            font-size: 0.95em;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #dfe6e9;
            border-radius: var(--radius);
            font-size: 1em;
            transition: var(--transition);
            background-color: #f8fafc;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--accent);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        /* Boutons */
        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: var(--radius);
            cursor: pointer;
            font-weight: 500;
            font-size: 1em;
            transition: var(--transition);
            flex: 1;
            text-align: center;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-primary {
            background-color: var(--accent);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: var(--danger);
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }
        
        /* Messages d'alerte */
        .alert {
            padding: 15px;
            margin-bottom: 25px;
            border-radius: var(--radius);
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }
        
        .alert:before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
        }
        
        .alert-success {
            background-color: rgba(46, 204, 113, 0.1);
            color: #27ae60;
        }
        
        .alert-success:before {
            background-color: var(--success);
        }
        
        .alert-error {
            background-color: rgba(231, 76, 60, 0.1);
            color: #c0392b;
        }
        
        .alert-error:before {
            background-color: var(--danger);
        }
        
        .alert-icon {
            margin-right: 10px;
            font-weight: bold;
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .alert {
            animation: fadeIn 0.3s ease-out;
        }
        
        /* Date picker personnalisé */
        input[type="date"] {
            position: relative;
        }
        
        input[type="date"]::-webkit-calendar-picker-indicator {
            opacity: 0;
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
        }
        
        .date-wrapper {
            position: relative;
        }
        
        .date-wrapper:after {
            content: '📅';
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
        }
        
        /* Effet de focus amélioré */
        .form-group:focus-within label {
            color: var(--accent);
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="form-header">
            <h2>Créer un nouvel abonnement</h2>
        </div>
        
        <div class="form-body">
            <!-- Messages d'alerte -->
            <c:if test="${not empty message}">
                <div class="alert alert-success">
                    <span class="alert-icon">✓</span>
                    ${message}
                </div>
            </c:if>
            <c:if test="${not empty erreur}">
                <div class="alert alert-error">
                    <span class="alert-icon">!</span>
                    ${erreur}
                </div>
            </c:if>
            
            <form action="creer_abonnement" method="post">
                <div class="form-group">
                    <label for="idAdherent">Adhérent</label>
                    <select id="idAdherent" name="idAdherent" class="form-control" required>
                        <option value="">-- Sélectionnez un adhérent --</option>
                        <c:forEach items="${adherants}" var="adherant">
                            <option value="${adherant.idAdherent}" ${param.idAdherent == adherant.idAdherent ? 'selected' : ''}>
                                ${adherant.nom} ${adherant.prenom}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="dateDebut">Date de début</label>
                    <div class="date-wrapper">
                        <input type="date" id="dateDebut" name="dateDebut" class="form-control" value="${param.dateDebut}" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="dateFin">Date de fin</label>
                    <div class="date-wrapper">
                        <input type="date" id="dateFin" name="dateFin" class="form-control" value="${param.dateFin}" required>
                    </div>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                    <a href="retour_admin" class="btn btn-secondary">Annuler</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Script pour définir la date de début à aujourd'hui par défaut
        document.addEventListener('DOMContentLoaded', function() {
            const dateDebutField = document.getElementById('dateDebut');
            if (!dateDebutField.value) {
                const today = new Date();
                const formattedDate = today.toISOString().substr(0, 10);
                dateDebutField.value = formattedDate;
            }
            
            // Calcul automatique de la date de fin (1 an après la date de début)
            document.getElementById('dateDebut').addEventListener('change', function() {
                const startDate = new Date(this.value);
                if (!isNaN(startDate.getTime())) {
                    const endDate = new Date(startDate);
                    endDate.setFullYear(endDate.getFullYear() + 1);
                    const formattedEndDate = endDate.toISOString().substr(0, 10);
                    document.getElementById('dateFin').value = formattedEndDate;
                }
            });
        });
    </script>
</body>
</html>