<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Admin</title>
</head>
<body>
    <h2>Connexion Administrateur</h2>
    <form action="login" method="post">
        <label for="nom">Nom d'utilisateur :</label>
        <input type="text" id="nom" name="nom" required>
        <br><br>
        <label for="mdp">Mot de passe :</label>
        <input type="password" id="mdp" name="mdp" required>
        <br><br>
        <button type="submit">Se connecter</button>
    </form>
</body>
</html>