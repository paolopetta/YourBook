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

<div class="cont">
    <div class="formArea">
        <div class="formCol">
            <form action="" method="post" name="registrazione">
                <table>
                    <tr>
                        <td><label for="nome">Nome</label></td>
                        <td><input type="text" id="nome" name="nome" placeholder="Mario"></td>
                    </tr>

                    <tr>
                        <td><label for="cognome">Cognome</label></td>
                        <td><input type="text" id="cognome" name="cognome" placeholder="Rossi"></td>
                    </tr>

                    <tr>
                        <td><label for="email">Email</label></td>
                        <td><input type="email" id="email" name="email" placeholder="mariorossi@posta.it"></td>
                    </tr>

                    <tr>
                        <td><label for="pwd">Password</label></td>
                        <td><input type="password" id="pwd" name="pwd" placeholder="password"></td>
                    </tr>


                    <tr>
                        <td><label for="Confpwd">Conferma Password</label></td>
                        <td><input type="password" id="Confpwd" name="Confpwd" placeholder="password"></td>
                    </tr>

                    <tr>
                        <td><label for="nazionalita">Nazionalità</label></td>
                        <td><select id="nazionalita" name="nazionalita">
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
                        </td>
                    </tr>

                    <tr>
                        <td><label for="eta">Anno di nascita</label></td>
                        <td><select id="eta" name="eta">
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
                        </select></td>
                    </tr>

                </table>
                <output name="result" for="result">
                </output>

                <button type="bottone">Registrati!</button>
            </form>
        </div>
        <div class="logoCol">
            <h1>Registrati a YourBook adesso!</h1>
            <img src="Immagini/logoYourBook.png" alt="Logo YourBook"/>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
