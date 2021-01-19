<%--
  Created by IntelliJ IDEA.
  User: pavil
  Date: 17/01/2021
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="script" href="JS/HomePage.js">
    <title>Title</title>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand js-scroll-trigger" href="#"><img src="https://i.imgur.com/o5ODS7P.png" alt="logo YourBook"></a>

    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/prodotti" >Inserisci Titolo</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="ChiSiamo.jsp">Chi Siamo</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/CartServlet">Libri</a>
            </li>
        </ul>

    </div>
</nav>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
