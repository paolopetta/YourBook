<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Pagina di registrazione di YourBook">
    <meta name="author" content="Serena D">

    <title>Registrazione|YourBook</title>

    <!-- Bootstrap core CSS -->
    <link href="CSS/registration.css" rel="stylesheet">

</head>
<body>
<%@ include file="navBar.jsp" %>

<div id="container">
    <div id="formArea">
        <div id="formCol">
            <form action="" method="post" name="registrazione">
                <label for="nome">Nome:</label><br>
                <input type="text" id="nome" name="nome" placeholder="Mario">

                <label for="cognome">Cognome:</label><br>
                <input type="text" id="cognome" name="cognome" placeholder="Rossi">

                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" placeholder="mariorossi@posta.it">

                <label for="pwd">Password:</label><br>
                <input type="password" id="pwd" name="pwd" placeholder="password">

                <label for="Confpwd">Conferma Password:</label><br>
                <input type="password" id="Confpwd" name="Confpwd" placeholder="password">

                <label for="nazionalita">Nazionalit:</label>
                <select id="nazionalita" name="nazionalita">
                    <option value="Italia">Italia</option>
                    <option value="America">America</option>
                    <option value="Inghilterra">Inghilterra</option>
                    <option value="Arabia Saudita">Arabia Saudita</option>
                    <option value="Francia">Francia</option>
                    <option value="Germania">Germania</option>
                    <option value="Burundi">Burundi</option>
                    <option value="Giappone">Giappone</option>
                    <option value="Indonesia">Indonesia</option>
                    <option value="Australia">Australia</option>
                </select>

                <label for="eta">Anno di nascita:</label>
                <select id="eta" name="eta">
                    <option value="1998">1998</option>
                    <option value="1999">1999</option>
                    <option value="2000">2000</option>
                    <option value="2001">2001</option>
                    <option value="2002">2002</option>
                    <option value="2003">2003</option>
                    <option value="2004">2004</option>
                    <option value="2005">2005</option>
                    <option value="2006">2006</option>
                    <option value="2007">2007</option>
                </select>

                <output name="result" for="result">
                </output>

                <button type="bottone">Registrati!</button>
            </form>
        </div>
        <div id="logoCol">
            <h1>Registrati a YourBook adesso!</h1>
            <img src="Immagini/logoYourBook.png" alt="Logo YourBook"/>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
