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
<style>
       
        body {
            background-color: #f8f9fa; 
            font-family: Arial, sans-serif; 
        }
        
        .containers {
            max-width: 800px; 
            margin: 50px auto; 
        }
        
        h3 {
            margin-bottom: 20px; 
            text-align:center;
        }
        
        table {
            width: 100%; 
            border-collapse: collapse; 
            margin-bottom: 30px; 
        }
        
        th, td {
            padding: 10px; 
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
 	<h3>Welcome <%=session.getAttribute("user") %> Sir</h3>
    <h3>Grades</h3>
    <table>
        <thead>
            <tr>
                <th scope="col">GradeId</th>
                <th scope="col">UserId</th>
                <th scope="col">UserName</th>
                <th scope="col">CourseName</th>
                <th scope="col">Grade</th>
                <th scope="col">comments</th>
                <th scope="col">Semester</th>
                <th scope="col">Years</th>
                <th scope="col">Update</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection con1=null;
            PreparedStatement st1 = null;
            ResultSet rs1=null;
           
			int userid=(int)(request.getAttribute("userid"));
			System.out.println("userid : "+userid);
            
            try{
            	String sql="select g.gradeid, s.userid, username, coursename, grade, comments, semester, years "+
                		"from signup s "+
                		"inner join grade g on (s.userid=g.studentid) "+
                		"inner join courses c on (g.courseid=c.courseid) "+
                		"where g.instructorid=? ";
                con1=DBConnectivity.getConnection();
                st1=con1.prepareStatement(sql);
                st1.setInt(1, userid);
                rs1=st1.executeQuery();
				
                while(rs1.next()){
            %>
            <tr>
            	<td><%= rs1.getString("gradeid") %></td>
                <td><%= rs1.getString("userid") %></td>
                <td><%= rs1.getString("username") %></td>
                <td><%= rs1.getString("coursename") %></td>
                <td><%= rs1.getString("grade") %></td>
                <td><%= rs1.getString("comments") %></td>
                <td><%= rs1.getString("semester") %></td>
                <td><%= rs1.getString("years") %></td>
                <td><a href='updategrades.jsp?g=<%= rs1.getString("gradeid") %>' class="btn btn-primary">Update</a></td>
            </tr>
            <% }
            } catch(Exception e){
                e.printStackTrace();
            }
            %>
    
        </tbody>
    </table>
</div>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>