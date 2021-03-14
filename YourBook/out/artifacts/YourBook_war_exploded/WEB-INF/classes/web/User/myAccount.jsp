<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Serena D">

    <title>myAccount|YourBook</title>

    <!-- Bootstrap core CSS -->
    <link href="../CSS/myAccount.css" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/HomePage.css">
</head>
<body id="page-top">
<%@ include file="../navBar.jsp" %>

<!-- Masthead-->
<header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">
        <h1 class="masthead-heading text-uppercase mb-0"><%=user.getNome()%></h1>
    </div>
</header>

<!-- Portfolio Section-->
<section class="page-section portfolio" id="portfolio">
    <div class="container">
        <!-- Portfolio Section Heading-->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Profilo</h2>
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- Portfolio Grid Items-->
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-12 mb-5">
                <h3>Informazioni Personali</h3>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><strong>Id: </strong><%=user.getId_utente()%></li>
                    <li class="list-group-item"><strong>Nazionalitá: </strong><%=user.getNazionalita()%></li>
                    <li class="list-group-item"><strong>Email: </strong><%=user.getEmail()%></li>
                    <li class="list-group-item"><strong>Etá: </strong><%=user.getEta()%></li>
                </ul>
            </div>
            <!-- Portfolio Item WishList-->
            <div class="col-md-6 col-lg-6 mb-5">
                <a href="../myWishList.jsp">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white"><i
                                    class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="../Immagini/books.svg" alt=""/>
                        <h1 align="center">WishList</h1>
                    </div>
                </a>
            </div>
            <!-- Portfolio Item Aggiungi libro-->
            <div class="col-md-6 col-lg-6 mb-5">
                <a href="../InsertBook.jsp">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal2">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white"><i
                                    class="fas fa-plus fa-3x"></i></div>
                        </div>
                        <img class="img-fluid" src="../Immagini/preferitBook.svg" alt=""/>
                        <h1 align="center">Aggiungi libri</h1>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>



<%@ include file="../footer.jsp" %>

<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Contact form JS-->
<script src="assets/mail/jqBootstrapValidation.js"></script>

<!-- Core theme JS-->
<script src="../JS/myAccount.js"></script>
</body>
</html>
