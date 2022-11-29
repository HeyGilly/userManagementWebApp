<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <body class="bg-success p-0 m-0">

        <!-- Navigation -->
        <nav class="container-fluid shadow bg-light p-0 m-0">
            <header class="d-flex container flex-wrap justify-content-center py-3">
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

        <!-- Main Section -->
        <main class="container-fluid h-100 p-0 m-0 d-flex align-items-center">
            <div class="container border bg-light rounded shadow-lg p-3">
                <!-- Header -->
                <h1>List of Users</h1>
                <hr />
                <!-- Add new User Button -->
                <div class="">
                    <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New User</a>
                </div>
                <br />

                <c:if test="${not empty listUser}">
                    <!-- Whole Table -->
                    <table class="table table-bordered border-success">
                        <!-- Table Header -->
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Username</th>
                            <th scope="col">City</th>
                            <th scope="col">State</th>
                            <th scope="col">Actions</th>
                        </tr>
                        <!-- Table Body -->
                        <tbody>
                            <!-- Fetches all the user from UserServlet.java with the listUser Method -->
                            <c:forEach var="user" items="${listUser}">
                                <tr>
                                    <th scope="row"><c:out value="${user.id}"/></th>
                                    <td> <c:out value="${user.first_name}"/></td>
                                    <td> <c:out value="${user.last_name}"/></td>
                                    <td> <c:out value="${user.email}"/> </td>
                                    <td> <c:out value="${user.username}"/> </td>
                                    <td> <c:out value="${user.city}"/> </td>
                                    <td> <c:out value="${user.state}"/> </td>
                                    <td>
                                        <a href="edit?id=<c:out value='${user.id}'/>" class="btn btn-warning">Edit</a>
                                        &nbsp &nbsp &nbsp &nbsp
                                        <a href="delete?id=<c:out value='${user.id}'/> " class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty listUser}">
                    <div class="alert alert-warning" role="alert">
                        No Users have been added!
                    </div>
                </c:if>
            </div>
        </main>


    <!-- Footer -->
        <div class="container-fluid bg-light fixed-bottom">
            <footer class="container py-3">
                <div class="col d-flex align-items-center justify-content-center">
                    <a class="text-dark text-decoration-none" href="https://www.linkedin.com/in/heygilly/">
                        <span class="mb-3 mb-md-0 text-dark fw-bold">HeyGilly 2022</span>
                    </a>
                </div>
            </footer>
        </div>



    </body>
</html>