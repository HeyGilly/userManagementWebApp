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


        <!-- Main Section - Form-->
        <main class="container-fluid mt-5 h-75 p-0 m-0 d-flex align-items-center justify-content-center w-100">
            <!-- Start of form and Title -->
            <c:if test="${user != null}">
                <form class="shadow-lg bg-light border px-5 py-3 w-50 rounded" action="update" method="post">
                    <h3>Edit User</h3>
            </c:if>
            <c:if test="${user == null}">
                <form class="shadow-lg border bg-light px-5 py-3 w-50 rounded" action="insert" method="post" autocomplete="off">
                    <h3>Add New User</h3>
            </c:if>

                    <!-- Hidden ID -->
                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
                    </c:if>

                    <!-- First Name -->
                    <div class="mb-3">
                        <label for="UserFirstName" class="form-label">First Name:</label>
                        <input type="text" value="<c:out value='${user.first_name}' />" name="first_name" class="form-control" id="UserFirstName" placeholder="John">
                    </div>
                    <!-- Last Name -->
                    <div class="mb-3">
                        <label for="UserLastName" class="form-label">Last Name:</label>
                        <input type="text" value="<c:out value='${user.last_name}' />" name="last_name" class="form-control" id="UserLastName" placeholder="Doe">
                    </div>
                    <!-- Email -->
                    <div class="mb-3">
                        <label for="UserEmail" class="form-label">Email address</label>
                        <input type="email" value="<c:out value='${user.email}'/>" name="email" class="form-control" id="UserEmail" placeholder="name@example.com">
                    </div>
                    <!-- Username -->
                    <div class="mb-3">
                        <label for="UserName" class="form-label">username:</label>
                        <input type="text" value="<c:out value='${user.username}'/>" name="username" class="form-control" id="UserName" placeholder="HelloWorld">
                    </div>
                    <!-- City -->
                    <div class="mb-3">
                        <label for="UserCity" class="form-label">City</label>
                        <input type="text" class="form-control" value="<c:out value='${user.city}'/>" name="city" id="UserCity" placeholder="Wonderland">
                    </div>
                    <!-- State -->
                    <div class="mb-3">
                        <label for="UserState" class="form-label">State</label>
                        <select id="UserState"  name="state" class="form-select">
                            <option selected>Choose...</option>
                            <option value="AL">AL</option>
                            <option value="AK">AK</option>
                            <option value="AZ">AZ</option>
                            <option value="AR">AR</option>
                            <option value="CA">CA</option>
                            <option value="CO">CO</option>
                            <option value="CT">CT</option>
                            <option value="DE">DE</option>
                            <option value="FL">FL</option>
                            <option value="GA">GA</option>
                            <option value="HI">HI</option>
                            <option value="ID">ID</option>
                            <option value="IN">IN</option>
                            <option value="IA">IA</option>
                            <option value="KS">KS</option>
                            <option value="LA">LA</option>
                            <option value="ME">ME</option>
                            <option value="MD">MD</option>
                            <option value="MA">MA</option>
                            <option value="MI">MI</option>
                            <option value="MN">MN</option>
                            <option value="MS">MS</option>
                            <option value="MO">MO</option>
                            <option value="MT">MT</option>
                            <option value="NE">NE</option>
                            <option value="NV">NV</option>
                            <option value="NH">NH</option>
                            <option value="NJ">NJ</option>
                            <option value="NM">NM</option>
                            <option value="NY">NY</option>
                            <option value="NC">NC</option>
                            <option value="ND">ND</option>
                            <option value="OH">OH</option>
                            <option value="OK">OK</option>
                            <option value="OR">OR</option>
                            <option value="PA">PA</option>
                            <option value="RI">RI</option>
                            <option value="SC">SC</option>
                            <option value="SD">SD</option>
                            <option value="TN">TN</option>
                            <option value="TX">TX</option>
                            <option value="UT">UT</option>
                            <option value="VT">VT</option>
                            <option value="VA">VA</option>
                            <option value="WA">WA</option>
                            <option value="WV">WV</option>
                            <option value="WI">WI</option>
                            <option value="WY">WY</option>
                        </select>
                    </div>


                <button type="submit" class="btn btn-primary">Submit</button>
            </form>


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
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
