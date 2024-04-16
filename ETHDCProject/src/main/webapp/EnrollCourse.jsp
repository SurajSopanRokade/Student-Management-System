<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="com.proj.utility.DBConnectivity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
 
    body {
        background-color: #f8f9fa; 
    }

    .signup-form {
        max-width: 400px; 
        margin: 0 auto; 
        margin-top: 50px; 
        background-color: #fff;
        padding: 20px; 
        border-radius: 10px; 
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); 
    }

    .signup-form h3 {
        margin-bottom: 20px; 
        text-align: center; 
    }

    .signup-form button[type="submit"] {
        width: 100%; 
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="signup-form">
        <h3>Enroll Course Form</h3>
        <form action="GradesServlet" method="post">
            <div class="form-group">
                <label for="courseid">Enter Course id</label>
                <input type="text" class="form-control" id="courseid" name="courseid" required>
            </div>
            <div class="form-group">
                <label for="username">Enter Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="userpass">Enter password</label>
                <input type="text" class="form-control" id="userpass" name="userpass" required>
            </div>
            <div class="form-group">
    <label>Are You Sure</label><br>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" id="actionYes" name="action" value="/EnrollCourse" required>
        <label class="form-check-label" for="actionYes">Yes</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" id="actionNo" name="action" value="" required>
        <label class="form-check-label" for="actionNo">No</label>
    </div>
</div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>