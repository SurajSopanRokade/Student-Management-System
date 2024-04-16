<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.proj.utility.DBConnectivity" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
   
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        
        body {
            background-color: #f8f9fa;
            margin-top: 50px; 
        }
        .card-body {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    
<jsp:include page="header.jsp"></jsp:include>
<div class="card-body">
    <form action="UpdateRecord" method="post">
        <%
            String u = request.getParameter("u");
            int userid = Integer.parseInt(u);
            
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                con = DBConnectivity.getConnection();
                ps = con.prepareStatement("SELECT * FROM signup WHERE userid=?");
                ps.setInt(1, userid);
                rs = ps.executeQuery();
                
                if (rs.next()) {
        %>
       <div class="form-group">
       <label for="userid">User ID:</label>
       <input type="text" class="form-control" name="userid" id="userid" value="<%= rs.getString("userid") %>" readonly>
       </div>
       <div class="form-group">
       <label for="username">Username:</label>
       <input type="text" class="form-control" name="username" id="username" value="<%= rs.getString("username") %>">
       </div>
       <div class="form-group">
       <input type="hidden" class="form-control" name="userpass" id="userpass" value="<%= rs.getString("userpass") %>">
       </div>
       <div class="form-group">
       <label for="userroles">User Roles:</label>
       <input type="text" class="form-control" name="userroles" id="userroles" value="<%= rs.getString("userroles") %>">
       </div>
       <div class="form-group">
       <label for="email">Email:</label>
       <input type="text" class="form-control" name="email" id="email" value="<%= rs.getString("email") %>">
       </div>
       <div class="form-group">
       <label for="dateofbirth">Date of Birth:</label>
       <input type="text" class="form-control" name="dateofbirth" id="dateofbirth" value="<%= rs.getString("dateofbirth") %>">
       </div>
       <div class="form-group">
       <label for="contactno">Contact No:</label>
       <input type="text" class="form-control" name="contactno" id="contactno" value="<%= rs.getString("contactno") %>">
       </div>

        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } 
        %>
        <input type="submit" name="submit" value="Update" id="update" class="form-control button">
    </form>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

