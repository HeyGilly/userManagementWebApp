<%--
  Created by IntelliJ IDEA.
  User: heygilly
  Date: 11/27/22
  Time: 10:27 PM
  This page will be the layout for the user form
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>User Form</title>
        <!-- Boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/5d0c1b436d.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-success">

        <!-- Navigation -->
        <nav class="container-fluid shadow bg-light">
            <header class="d-flex container flex-wrap justify-content-center py-3 mb-4">
                <a href="https://github.com/HeyGilly" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                    <span class="fs-4">User Management App</span>
                </a>

                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a href="<%=request.getContextPath()%>/list"  class="nav-link active" aria-current="page">
                            Users
                        </a>
                    </li>
                </ul>
            </header>
        </nav>




    </body>
</html>