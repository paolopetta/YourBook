<%--
  Created by IntelliJ IDEA.
  User: pavil
  Date: 17/01/2021
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inserisci Libro</title>
    <link rel="stylesheet" href="CSS/HomePage.css">
</head>
<body>
<%@ include file= "navBar.jsp" %>

<header class="testata"></header>
<div class="text-Inserisci">
    <h1 align="center">Inserisci il titolo che hai letto</h1>
    <h3 align="center">Puoi scegliere il titolo che hai letto tra quelli presenti sul sito e lasciare la tua valutazione</h3>
</div>

<div class="inserisciTitolo">
    <select class="form-control">
        <option>Libri</option>
    </select>
    <a href="#">Il libro non é presente in questo elenco?</a>
</div>

<div class="inserisciTitolo">
    <select class="form-control">
        <option>Valutazione</option>
    </select>
</div>
<div class="inserisciTitolo">
    <button type="submit" class="btn btn-primary mb-2">Valuta</button>
</div>


<%@ include file= "footer.jsp" %>

<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Contact form JS-->
<script src="assets/mail/jqBootstrapValidation.js"></script>
<script src="assets/mail/contact_me.js"></script>
<script src="JS/HomePage.js"></script>
</body>
</html>
