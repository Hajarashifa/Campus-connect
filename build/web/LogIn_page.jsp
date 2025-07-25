<%@page import="com.Data.entities.User"%>
<%@page import="com.Data.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Log In</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            background-color: #f6f9fb;
        }

        .primary-background {
            background: #a7c7e7 !important; /* pastel blue */
        }

        .banner-background {
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 68% 91%, 31% 96%, 0 89%, 0 0);
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            border-color: #88bde9;
            box-shadow: 0 0 0 0.2rem rgba(135, 181, 225, 0.25);
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <%@include file="normal_navbar.jsp" %>

    <%
        User user2 = (User) session.getAttribute("adminUser");
        if (user2 != null) {
            response.sendRedirect("admin_home.jsp");
        }
    %>

    <main class="d-flex align-items-center primary-background banner-background p-4" style="height: 70vh">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-user-plus fa-3x"></span>
                            <p class="mt-2">Log In Here</p>
                        </div>

                        <% 
                            Message m = (Message) session.getAttribute("msg");
                            if (m != null) {
                        %>
                            <div class="alert alert-danger" role="alert">
                                <%= m.getContent() %>
                            </div>
                        <% 
                                session.removeAttribute("msg");
                            } 
                        %>

                        <div class="card-body">
                            <form action="LoginServlet" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary px-4">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>

