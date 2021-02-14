<%--
  Created by IntelliJ IDEA.
  User: pavil
  Date: 07/01/2021
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>YourBook</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <title>HomePage</title>
    <link rel="stylesheet" href="CSS/HomePage.css">
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
        <li class="nav-item" id="cercaNavbar">
          <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
              <div class="searchbar">
                <input class="search_input" type="text" name="" placeholder="Cerca...">
                <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
              </div>
            </div>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/index.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/InsertBook.jsp" >Inserisci Titolo</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="ChiSiamo.jsp">Chi Siamo</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/Libri">Libri</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/myWishlist.jsp">Wishlist</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/login.jsp">Accedi</a>
        </li>
      </ul>

    </div>
  </nav>

  <!-- Masthead-->
  <header class="masthead">
    <div class="container">
      <div class="masthead-subheading">Benvenuto su YourBook!</div>
      <div class="masthead-heading text-uppercase">Siamo felici di averti sul nostro sito</div>
      <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Vai ai Libri</a>
    </div>
  </header>
  <!-- Services-->
  <section class="page-section" id="services">
    <div class="container">
      <div class="text-center">
        <h2 class="section-heading text-uppercase">Services</h2>
        <h3 class="section-subheading text-muted">Semplifichiamo la tua scelta del libro.</h3>
      </div>
      <div class="row text-center">
        <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
          <h4 class="my-3">Modulo di IA</h4>
          <p class="text-muted">Il nostro modulo di Intelligenza artificiale ti suggerirá i titoli piú adatti a te.</p>
        </div>
        <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
          <h4 class="my-3">Responsive Design</h4>
          <p class="text-muted">Puoi navigare sul nostro sito da qualsiasi dispositivo.</p>
        </div>
        <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
          <h4 class="my-3">Web Security</h4>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
        </div>
      </div>
    </div>
  </section>
  <!-- Portfolio Grid-->
  <section class="page-section bg-light" id="portfolio">
    <div class="container">
      <div class="text-center">
        <h2 class="section-heading text-uppercase">Portfolio</h2>
        <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
      </div>
      <div class="row">
        <div class="col-lg-4 col-sm-6 mb-4">
          <div class="portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
              </div>
              <img class="img-fluid" src="assets/img/portfolio/01-thumbnail.jpg" alt="" />
            </a>
            <div class="portfolio-caption">
              <div class="portfolio-caption-heading">Threads</div>
              <div class="portfolio-caption-subheading text-muted">Illustration</div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 mb-4">
          <div class="portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
              </div>
              <img class="img-fluid" src="assets/img/portfolio/02-thumbnail.jpg" alt="" />
            </a>
            <div class="portfolio-caption">
              <div class="portfolio-caption-heading">Explore</div>
              <div class="portfolio-caption-subheading text-muted">Graphic Design</div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 mb-4">
          <div class="portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
              </div>
              <img class="img-fluid" src="assets/img/portfolio/03-thumbnail.jpg" alt="" />
            </a>
            <div class="portfolio-caption">
              <div class="portfolio-caption-heading">Finish</div>
              <div class="portfolio-caption-subheading text-muted">Identity</div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
          <div class="portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
              </div>
              <img class="img-fluid" src="assets/img/portfolio/04-thumbnail.jpg" alt="" />
            </a>
            <div class="portfolio-caption">
              <div class="portfolio-caption-heading">Lines</div>
              <div class="portfolio-caption-subheading text-muted">Branding</div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
          <div class="portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
              </div>
              <img class="img-fluid" src="assets/img/portfolio/05-thumbnail.jpg" alt="" />
            </a>
            <div class="portfolio-caption">
              <div class="portfolio-caption-heading">Southwest</div>
              <div class="portfolio-caption-subheading text-muted">Website Design</div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6">
          <div class="portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
              </div>
              <img class="img-fluid" src="assets/img/portfolio/06-thumbnail.jpg" alt="" />
            </a>
            <div class="portfolio-caption">
              <div class="portfolio-caption-heading">Window</div>
              <div class="portfolio-caption-subheading text-muted">Photography</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- About-->
  <section class="page-section" id="about">
    <div class="container">
      <div class="text-center">
        <h2 class="section-heading text-uppercase">About</h2>
        <h3 class="section-subheading text-muted">Puntiamo di crescere insieme a voi.</h3>
      </div>
      <ul class="timeline">
        <li>
          <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/1.jpg" alt="" /></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4>2018</h4>
              <h4 class="subheading">Iscrizione ad Unisa</h4>
            </div>
            <div class="timeline-body"><p class="text-muted">Nel 2018 ci siamo iscritti ad unisa alla facoltá di informatica pronti per intraprendere questo splendido percorso</p></div>
          </div>
        </li>
        <li class="timeline-inverted">
          <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/2.jpg" alt="" /></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4>II Anno</h4>
              <h4 class="subheading">Primo progetto web di TSW</h4>
            </div>
            <div class="timeline-body"><p class="text-muted">Al II Anno é partito il primo semplice progetto web</p></div>
          </div>
        </li>
        <li>
          <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/3.jpg" alt="" /></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4>III Anno</h4>
              <h4 class="subheading">Progettazione YourBook</h4>
            </div>
            <div class="timeline-body"><p class="text-muted">L'idea del progetto YourBook comincia a balenare nelle nostre menti</p></div>
          </div>
        </li>

        <li class="timeline-inverted">
          <div class="timeline-image">
            <h4>
              Be Part
              <br />
              Of Our
              <br />
              Story!
            </h4>
          </div>
        </li>
      </ul>
    </div>
  </section>
  <!-- Team-->
  <section class="page-section bg-light" id="team">
    <div class="container">
      <div class="text-center">
        <h2 class="section-heading text-uppercase">Il nostro splendido Team</h2>
        <h3 class="section-subheading text-muted">Insieme abbiamo lavorato a YourBook</h3>
      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="assets/img/team/1.jpg" alt="" />
            <h4>Paolo Petta</h4>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="assets/img/team/2.jpg" alt="" />
            <h4>Serena D'Urso</h4>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="assets/img/team/3.jpg" alt="" />
            <h4>Riccardo Amaro</h4>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
      </div>
    </div>
  </section>

  <%@ include file= "footer.jsp" %>

  <!-- Bootstrap core JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Third party plugin JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
  <!-- Contact form JS-->
  <script src="assets/mail/jqBootstrapValidation.js"></script>
  <script src="assets/mail/contact_me.js"></script>
  <!-- Core theme JS-->
  <script src="JS/HomePage.js"></script>
  </body>
</html>
