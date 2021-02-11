<%--
  Created by IntelliJ IDEA.
  User: pavil
  Date: 17/01/2021
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title>Login</title>
    <link rel="stylesheet" href="CSS/Login.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<%@ include file= "navBar.jsp" %>
<header class="testata"></header>
<div class="container h-100">
    <div class="d-flex justify-content-center h-100">
        <div class="user_card">
            <div class="d-flex justify-content-center">
                <div class="brand_logo_container">
                    <img src="https://i.imgur.com/o5ODS7P.png" class="brand_logo" alt="logo YourBook">
                </div>
            </div>
            <div class="d-flex justify-content-center form_container">
                <form>
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" name="" class="form-control input_user" value="" placeholder="username">
                    </div>
                    <div class="input-group mb-2">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" name="" class="form-control input_pass" value="" placeholder="password">
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customControlInline">
                            <label class="custom-control-label" for="customControlInline">Ricordami</label>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center mt-3 login_container">
                        <button type="button" name="button" class="btn login_btn">Login</button>
                    </div>
                </form>
            </div>

            <div class="mt-4">
                <div class="d-flex justify-content-center links"> Non hai un account?
                    <a href="#" class="ml-2 nonReg">Registrati</a>
                </div>
                <div class="d-flex justify-content-center links">
                    <a href="#" class="nonReg">Password dimenticata?</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file= "footer.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
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
