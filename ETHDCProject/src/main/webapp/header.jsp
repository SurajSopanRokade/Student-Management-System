<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header Example</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
  .header {
      background-color: #28a745; 
      color: #fff;
      padding: 10px 0;
  }

  .btn-custom {
      margin-left: 10px;
   }
</style>
</head>
<body>
<%

HttpSession sess = request.getSession();
String loggedIn = (String) sess.getAttribute("user");
System.out.println(loggedIn);

%>
<header class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Student Management System</h2>
                </div>
                 <div class="col-md-6 text-right">
                 <a href="index.jsp" class="btn btn-danger btn-custom">Home</a>
                <% if (loggedIn != null) { %>
                    <a href="Logout.jsp" class="btn btn-danger btn-custom">Logout</a>
                     <% if (loggedIn != null && loggedIn.equals("rahul")) { %>
                    <a href="AdminDashboard.jsp" class="btn btn-danger btn-custom">AdminDashboard</a>
                     <% }%>
                <% } else { %>
                    <a href="login.jsp" class="btn btn-warning btn-custom">Login</a>
                    <a href="signup.jsp" class="btn btn-primary btn-custom">Signup</a>
                <% } %>
            </div>
            </div>
        </div>
    </header>
</body>
</html>


