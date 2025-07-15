<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Détails du Livre</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .container { max-width: 800px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }
        .error { color: red; }
        .book-details { margin-top: 20px; }
        .book-details p { margin: 5px 0; }
        .book-details ul { margin: 5px 0; padding-left: 20px; }
        .back-link { display: inline-block; margin-top: 20px; padding: 8px 15px; 
                    background-color: #3498db; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Détails du Livre</h1>
        <div id="details">
            <p>Chargement en cours...</p>
        </div>
        <a href="render_list_livre" class="back-link">Retour à la liste</a>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const id = urlParams.get('id');

            if (!id || isNaN(id)) {
                showError("ID de livre invalide");
                return;
            }

            fetch(`/api/details_livre?id=${id}`)  // 🟢 API correcte ici
                .then(handleResponse)
                .then(displayBookDetails)
                .catch(handleError);
        });

        function handleResponse(response) {
            if (!response.ok) {
                throw new Error(`Erreur HTTP: ${response.status}`);
            }
            return response.json();
        }

        function displayBookDetails(book) {
            const detailsDiv = document.getElementById('details');

            if (!book) {
                showError("Aucune donnée reçue");
                return;
            }

            let categoriesHTML = "<p><strong>Catégories:</strong> Aucune</p>";
            if (book.categories && book.categories.length > 0) {
                categoriesHTML = `
                    <p><strong>Catégories:</strong></p>
                    <ul>
                        ${book.categories.map(c => `<li>${c}</li>`).join('')}
                    </ul>
                `;
            }

            const html = `
                <div class="book-details">
                    <h2>${book.titre || 'Non spécifié'}</h2>
                    <p><strong>ID:</strong> ${book.id || 'N/A'}</p>
                    <p><strong>Auteur:</strong> ${book.auteur || 'Inconnu'}</p>
                    <p><strong>Année de publication:</strong> ${book.annee || 'Non spécifiée'}</p>
                    ${categoriesHTML}
                </div>
            `;

            detailsDiv.innerHTML = html;
        }

        function handleError(error) {
            console.error("Erreur:", error);
            showError(`Impossible de charger les détails: ${error.message}`);
        }

        function showError(message) {
            document.getElementById('details').innerHTML = `<p class="error">${message}</p>`;
        }
    </script>
</body>
</html>
