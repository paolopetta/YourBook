<%@ page import="java.util.Collection" %>
<%@ page import="model.LibriBean" %>
<%@ page import="java.util.List" %>
<%@ page import="model.WishlistBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    WishlistBean wishlist = (WishlistBean) session.getAttribute("wishlist");
    if (wishlist == null) {
        response.sendRedirect(response.encodeRedirectURL("./WishlistServlet"));
        return;
    }%>
<!DOCTYPE html>
<html lang="it">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Serena D">

    <title>myWishList|YourBook</title>

    <!-- Bootstrap core CSS -->
    <link href="CSS/myWishList.css" rel="stylesheet">

</head>

<body>

<%@ include file="navBar.jsp" %>
<header class="testata"></header>

<%
    List<LibriBean> libriWishlist = wishlist.getItems();
%>

<!-- Page Content -->
<div class="container2">

    <!-- Blog Entries Column -->
    <div class="colmd8">

        <h1 class="my-4" id="wishlist">WishList</h1>
        <button onclick="window.location.href='<%=response.encodeURL("WishlistServlet?action=clearWishlist")%>'"
                class="btn btn-primary" id="svuotaWish">Svuota
        </button>

        <%
            if (libriWishlist.size() > 0) {
                for (LibriBean libro : libriWishlist) {
        %>

        <!-- Blog Post -->
        <div class="card2 mb4">
            <img class="card-img-top2" src="<%=libro.getImmagine()%>" alt="Copertina">
            <div class="card-body2">
                <h2 class="card-title"><%=libro.getTitolo()%>
                </h2>
                <p class="card-text"><strong>Isbn: </strong><%=libro.getIsbn()%>
                </p>
                <p class="card-text"><strong>Pubblicazione: </strong><%=libro.getAnno_pubb()%>
                </p>
                <p class="card-text"><strong>Autore: </strong><%=libro.getAutore()%>
                </p>
                <a href="WishlistServlet?action=deleteBook&id=<%=libro.getIsbn()%>" class="btn btn-primary">Elimina</a>
            </div>
        </div>

        <%
            }
        } else {
        %>
        <h3>Non ci sono articoli</h3>
        <%}%>

    </div>
</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script src="JS/HomePage.js"></script>
</body>
</html>
