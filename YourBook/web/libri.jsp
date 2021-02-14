<%@ page import="java.util.ArrayList" %>
<%@ page import="model.LibriBean" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collection" %><%--
  Created by IntelliJ IDEA.
  User: pavil
  Date: 25/01/2021
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Collection<?> libri = (Collection<?>) request.getAttribute("libri");
    if(libri == null ) {
        response.sendRedirect(response.encodeRedirectURL("./Libri"));
        return;
    }
    LibriBean libro = (LibriBean) request.getAttribute("Libro");
%>

<html>
<head>
    <title>Libri</title>
</head>
<body>
<%@ include file= "navBar.jsp" %>
<header class="testata"></header>

<%
    if(libri != null && libri.size() > 0) {

        Iterator<?> it  = libri.iterator();
%>
<div class="row row-cols-1 row-cols-md-4" id="libriUser">

    <%
        while(it.hasNext()) {
            LibriBean bean = (LibriBean) it.next();
    %>

    <div class="col mb-4">
        <div class="card" >
            <img src="<%=bean.getImmagine()%>" class="card-img-top" alt="..." width="500" height="300">
            <div class="card-body">
                <h5 class="card-title" align="center"><%=bean.getTitolo()%></h5>
                <p class="card-text" align="center"><strong>Isbn:</strong><br><%=bean.getIsbn()%><br>
                    <strong>Anno pubblicazione:</strong><br><%=bean.getAnno_pubb()%><br>
                    <strong>Autore:</strong><br><%=bean.getAutore()%>
                </p>
                <a href="WishlistServlet?action=addBook&id=<%=bean.getIsbn()%>" class="btn btn-primary" align="center">Aggiungi alla wishlist</a>
            </div>
        </div>
    </div>

    <% 		} %>
</div>
<% }%>

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




