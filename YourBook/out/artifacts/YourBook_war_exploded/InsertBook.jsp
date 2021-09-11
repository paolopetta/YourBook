<%@ page import="java.util.Collection" %>
<%@ page import="model.LibriBean" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Collection<?> libri = (Collection<?>) request.getAttribute("libri");
    UserBean userBean = (UserBean) session.getAttribute("utente");
    if (libri == null) {
        response.sendRedirect(response.encodeRedirectURL("./Libri?action=retrieveIns"));
        return;
    }

%>
<html>
<head>
    <title>Inserisci Libro</title>
    <link rel="stylesheet" href="CSS/HomePage.css">
</head>
<body>
<%@ include file="navBar.jsp" %>

<header class="testata"></header>
<div class="text-Inserisci">
    <h1 align="center">Inserisci il titolo che hai letto</h1>
    <h3 align="center">Puoi scegliere il titolo che hai letto tra quelli presenti sul sito e lasciare la tua
        valutazione</h3>
</div>
<form action="${pageContext.request.contextPath}/Libri?action=insRating" method="POST">
    <select style="display: none" name="id">
        <option selected="selected"><%=userBean.getId_utente()%></option>
    </select>
    <div class="inserisciTitolo">
        <select name="isbn" class="form-control">
            <%
                if (libri != null && libri.size() > 0) {

                    Iterator<?> it = libri.iterator();
                    while (it.hasNext()) {
                        LibriBean bean = (LibriBean) it.next();
            %>
            <option value="<%=bean.getIsbn()%>"><%=bean.getTitolo()%></option>

            <%
                    }
                }
            %> //chiusura parentesi if e while
        </select>
        <a href="${pageContext.request.contextPath}/RichiestaInserimento.jsp">Il libro non é presente in questo elenco?</a>
    </div>

    <div class="inserisciTitolo">
        <select name="valutazione" class="form-control">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>
    </div>
    <%if (userBean != null) {%>
    <div class="inserisciTitolo">
        <button type="submit" class="btn btn-primary mb-2">Valuta</button>
    </div>

    <%} else {%>
    <br>
    <p align="center">Per valutare accedi o registrati</p>
    <%}%>
</form>


<%@ include file="footer.jsp" %>

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
