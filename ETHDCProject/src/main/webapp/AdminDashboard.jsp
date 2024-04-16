<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Website</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
  }
  
  h1 {
    text-align: center;
    color: blue;
    
  }
  nav {
    text-align: center;
    margin-bottom: 20px;
  }
  nav a {
    display: inline-block;
    padding: 10px 20px;
    margin: 20px 10px;
    text-decoration: none;
    color: #fff;
    background-color: #007bff;
    border-radius: 5px;
    transition: background-color 0.3s ease;
  }
  /* nav a:hover {
    background-color: red;
  } */
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="containers">
  <h1>Welcome <%=session.getAttribute("user") %>  Admin</h1>
  <nav>
    <a href="admin.jsp">Students</a>
    <a href="showteachers.jsp">Teachers</a>
    <a href="showcourses.jsp">Courses</a>
  </nav>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
