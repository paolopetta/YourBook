<%@ page import="java.util.Collection" %>
<%@ page import="model.LibriBean" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: pavil
  Date: 17/01/2021
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Collection<?> libri = (Collection<?>) request.getAttribute("libri");
    if(libri == null ) {
        response.sendRedirect(response.encodeRedirectURL("../LibriManagement"));
        return;
    }
%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Dashboard</title>
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/Admin/assets/img/brand/favicon.png" type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin/assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
    <!-- Page plugins -->
    <!-- Argon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin/assets/css/argon.css?v=1.2.0" type="text/css">
</head>

<body>
<!-- Sidenav -->
<nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">
        <!-- Brand -->
        <div class="sidenav-header  align-items-center">
            <a class="navbar-brand" href="javascript:void(0)">
                <img src="https://i.imgur.com/o5ODS7P.png" class="navbar-brand-img" alt="...">
            </a>
        </div>
        <div class="navbar-inner">
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                <!-- Nav items -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link " href="${pageContext.request.contextPath}/Admin/adminManagement.jsp">
                            <i class="ni ni-tv-2 text-primary"></i>
                            <span class="nav-link-text">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/Admin/libriManagement.jsp">
                            <i class="ni ni-books text-orange"></i>
                            <span class="nav-link-text">Gestisci libri</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Admin/userManagement.jsp">
                            <i class="ni ni-circle-08 text-primary "></i>
                            <span class="nav-link-text">Gestisci utenti</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/Admin/adminProfileManagement.jsp">
                            <i class="ni ni-single-02 text-yellow"></i>
                            <span class="nav-link-text">Gestisci admin</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- Main content -->
<div class="main-content" id="panel">
    <!-- Topnav -->
    <nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Search form -->
                <form class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
                    <div class="form-group mb-0">
                        <div class="input-group input-group-alternative input-group-merge">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                            </div>
                            <input class="form-control" placeholder="Cerca" id="ricercaLibri" onkeyup="ricerca('ricercaLibri', 'listaLibri')" type="text">
                        </div>
                    </div>
                    <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </form>
            </div>
        </div>
    </nav>
    <!-- Header -->
    <!-- Header -->
    <div class="header bg-primary pb-6">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                    <div class="col-lg-6 col-7">
                        <h6 class="h2 text-white d-inline-block mb-0">Gestione Libri</h6>
                        <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">Gestione Libri</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>

    <!-- Page content -->
    <div class="container-fluid mt--6">
        <div class="row">
            <div class="col">
                <div class="card" id="tabellaLibri">
                    <!-- Card header -->
                    <div class="card-header border-0">
                        <h3 class="mb-0">Libri</h3>

                    </div>
                    <!-- Light table -->
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                            <tr>
                                <th scope="col" class="sort" data-sort="name">Modifica</th>
                                <th scope="col" class="sort" data-sort="name">Titolo</th>
                                <th scope="col" class="sort" data-sort="isbn">Isbn</th>
                                <th scope="col" class="sort" data-sort="autore">Autore</th>
                                <th scope="col" class="sort" data-sort="anno">Anno</th>
                                <th scope="col" class="sort" data-sort="pubblicazione">Pubblicazione</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>

                            <%
                                if(libri != null && libri.size() > 0) {

                                    Iterator<?> it  = libri.iterator();
                            %>

                            <tbody class="list" id="listaLibri">

                            <%
                                while(it.hasNext()) {
                                    LibriBean bean = (LibriBean) it.next();
                            %>

                            <tr>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                            <a class="dropdown-item" href="#">Modifica</a>
                                            <a class="dropdown-item" href="#">Elimina</a>
                                        </div>
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="media align-items-center">
                                        <a href="#" class="avatar rounded-circle mr-3">
                                            <img alt="Image placeholder" src="<%=bean.getImmagine()%>">
                                        </a>
                                        <div class="media-body">
                                            <span class="name mb-0 text-sm"><%=bean.getTitolo()%></span>
                                        </div>
                                    </div>
                                </th>
                                <td><%=bean.getIsbn()%></td>
                                <td><%=bean.getAutore()%></td>
                                <td><%=bean.getAnno_pubb()%></td>
                                <td><%=bean.getCasaEditrice()%></td>


                            </tr>

                            <% 		} %>

                            </tbody>
                            <% 		} %>
                        </table>
                    </div>

                    <!-- Card footer -->
                    <div class="card-footer py-4">
                        <nav aria-label="...">
                            <ul class="pagination justify-content-end mb-0">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">
                                        <i class="fas fa-angle-left"></i>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">
                                        <i class="fas fa-angle-right"></i>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Argon Scripts -->
<!-- Core -->
<script src="${pageContext.request.contextPath}/Admin/assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/Admin/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/Admin/assets/vendor/js-cookie/js.cookie.js"></script>
<script src="${pageContext.request.contextPath}/Admin/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/Admin/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
<!-- Optional JS -->
<script src="${pageContext.request.contextPath}/Admin/assets/vendor/chart.js/dist/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/Admin/assets/vendor/chart.js/dist/Chart.extension.js"></script>
<!-- Argon JS -->
<script src="${pageContext.request.contextPath}/Admin/assets/js/argon.js?v=1.2.0"></script>
<script src="../JS/Admin.js"></script>
</body>


</html>



