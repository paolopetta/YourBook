<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<!-- Page Content -->
<div class="container2">

    <!-- Blog Entries Column -->
    <div class="colmd8">

        <h1 class="my-4">WishList</h1>

        <!-- Blog Post -->
        <div class="card2 mb4">
            <img class="card-img-top2" src="http://placehold.it/60" alt="Card image cap">
            <div class="card-body2">
                <h2 class="card-title">Titolo 3</h2>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                    nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus
                    possimus, veniam magni quis!</p>
                <a href="#" class="btn btn-primary">Read More &rarr;</a>
            </div>
        </div>

        <!-- Blog Post -->
        <div class="card2 mb4">
            <img class="card-img-top2" src="http://placehold.it/60" alt="Card image cap">
            <div class="card-body2">
                <h2 class="card-title">Titolo 2</h2>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                    nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus
                    possimus, veniam magni quis!</p>
                <a href="#" class="btn btn-primary">Read More &rarr;</a>
            </div>
        </div>

        <!-- Blog Post -->
        <div class="card2 mb4">
            <img class="card-img-top2" src="http://placehold.it/60" alt="Card image cap">
            <div class="card-body2">
                <h2 class="card-title">Titolo 3</h2>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque,
                    nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus
                    possimus, veniam magni quis!</p>
                <a href="#" class="btn btn-primary">Read More &rarr;</a>
            </div>
        </div>

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb4">
            <li class="page-item">
                <a class="page-link" href="#">&larr; Older</a>
            </li>
            <li class="page-item disabled">
                <a class="page-link" href="#">Newer &rarr;</a>
            </li>
        </ul>

    </div>
    <!-- /.container -->

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

</body>
</html>
