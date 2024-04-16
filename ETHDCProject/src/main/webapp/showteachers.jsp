<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.proj.utility.DBConnectivity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Successful</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
   
    body {
        background-color: #f8f9fa;
    }
    .containers {
        margin-top: 50px;
    }
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .edit-btn {
        color: #007bff;
        text-decoration: none;
        cursor: pointer;
    }
    .edit-btn:hover {
        text-decoration: underline;
    }
    .delete-btn {
        color: #dc3545;
        text-decoration: none;
        cursor: pointer;
    }
    .delete-btn:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="containers">
    <table class="table">
        <thead class="thead-light">
            <tr>
                <th scope="col">UserId</th>
                <th scope="col">UserName</th>
                <!-- <th scope="col">UserPassword</th> -->
                <th scope="col">UserRoles</th>
                <th scope="col">Email</th>
                <th scope="col">DateOfBirth</th>
                <th scope="col">ContactNo</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                con = DBConnectivity.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from signup");
                
                while(rs.next()) {
                	if(rs.getString("userroles").equals("3")){
            %>
            <tr>
                <td><%= rs.getString("userid") %></td>
                <td><%= rs.getString("username") %></td>
                <%-- <td><%= rs.getString("userpass") %></td> --%>
                <td><%= rs.getString("userroles") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("dateofbirth") %></td>
                <td><%= rs.getString("contactno") %></td>
                <td><a href='updatereco.jsp?u=<%= rs.getString("userid") %>' class="edit-btn">Edit</a></td>
                <td>
                    <form action='DeleteRecord?d=<%= rs.getString("userid") %>' method="post">
                        <button type="submit" name="delete" value="delete" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
            <% }}
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
            <tr>
                <td colspan="10"><a href='signup.jsp' class="btn btn-primary">Add Teacher</a></td>
            </tr>
        </tbody>
    </table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>