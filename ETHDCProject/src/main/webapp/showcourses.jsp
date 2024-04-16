<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
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
            font-family: Arial, sans-serif; 
        }
        
        .containers {
            max-width: 1000px; 
            margin: 50px auto; 
        }
        
        h3 {
            margin-bottom: 20px;
        }
        
        table {
            width: 100%; 
            border-collapse: collapse; 
            margin-bottom: 30px;
        }
        
        th, td {
            padding: 15px;
            text-align: left; 
            border-bottom: 1px solid #dee2e6; 
        }
        
        th {
            background-color: #007bff; 
            color: #fff; 
        }
        
        .btn {
            padding: 8px 16px; 
        }
        
        .btn-primary {
            background-color: #007bff; 
            border-color: #007bff; 
        }
        
        .btn-primary:hover {
            background-color: #0056b3; 
            border-color: #0056b3; 
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
 <div class="containers">
    <h3>Courses</h3>
    <table>
        <thead>
            <tr>
                <th scope="col">CourseId</th>
                <th scope="col">CourseName</th>
                <th scope="col">Department</th>
                <th scope="col">InstructorID</th>
                <th scope="col">MaxCapacity</th>
                <th scope="col">CStatus</th>
                <th scope="col">Update</th>
                <th scope="col">Delete</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection con1=null;
            Statement st1 = null;
            ResultSet rs1=null;

            try{
                con1=DBConnectivity.getConnection();
                st1=con1.createStatement();
                rs1=st1.executeQuery("select * from courses");

                while(rs1.next()){
            %>
            <tr>
                <td><%= rs1.getString("courseid") %></td>
                <td><%= rs1.getString("coursename") %></td>
                <td><%= rs1.getString("department") %></td>
                <td><%= rs1.getString("instructorid") %></td>
                <td><%= rs1.getString("maxcapacity") %></td>
                <td><%= rs1.getString("cstatus") %></td>
                <td><a href='updatecourse.jsp?c=<%= rs1.getString("courseid") %>' class="btn btn-primary">Update</a></td>
                <td>
                    <form action='course?d=<%= rs1.getString("courseid") %>' method="post">
                        <button type="submit" name="action" value="/deleteCourses" class="btn btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
            <% }
            } catch(Exception e){
                e.printStackTrace();
            }
            %>
            <tr>
                <td colspan="10"><a href='courseadd.jsp' class="btn btn-primary">Add Course</a></td>
            </tr>
        </tbody>
    </table>
</div>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>