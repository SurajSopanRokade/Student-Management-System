<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
   
    body {
        background-color: #f8f9fa; 
    }

    .login-form {
        max-width: 400px; 
        margin: 0 auto; 
        margin-top: 50px; 
        background-color: #fff; 
        padding: 20px; 
        border-radius: 10px; 
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); 
    }

    .login-form h3 {
        margin-bottom: 20px; 
        text-align: center; 
    }

    .login-form button[type="submit"] {
        width: 100%; 
    }
</style>
<script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("userpass").value;

        if (username.trim() === "") {
            alert("Please enter your username.");
            return false;
        }
        if (password.trim() === "") {
            alert("Please enter your password.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <div class="login-form">
        <h3>Login Form</h3>
        <form action="logins" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">Enter Name</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="userpass">Enter Password</label>
                <input type="password" class="form-control" id="userpass" name="userpass" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

