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
        
        .card-body {
            max-width: 400px; 
            margin: 0 auto; 
            margin-top: 50px; 
            background-color: #fff; 
            padding: 20px; 
            border-radius: 10px; 
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); 
        }
        
        .form-group {
            margin-bottom: 20px; 
        }
        
        .form-control {
            border-radius: 5px; 
        }
        
        #update {
            width: 100%; 
            background-color: #007bff; 
            color: #fff; 
            border: none; 
            border-radius: 5px; 
            padding: 10px; 
            cursor: pointer; 
        }
        
        #update:hover {
            background-color: #0056b3; 
        }
    </style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="card-body">
        <form action="GradesServlet" method="post">
            <%
                String g = request.getParameter("g");
                int gradeid = Integer.parseInt(g);
                
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                
                try {
                    con = DBConnectivity.getConnection();
                    ps = con.prepareStatement("SELECT gradeid, studentid, grade, comments,instructorid, semester, years FROM grade WHERE gradeid=?");
                    ps.setInt(1, gradeid);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                  
            %>
<div class="form-group">
<label for="gradeid">Grade ID:</label>
<input type="text" class="form-control" name="gradeid" id="gradeid" value="<%= rs.getString("gradeid") %>">
</div>
<div class="form-group">
    <label for="studentid">Student ID:</label>
    <input type="text" class="form-control" name="studentid" id="studentid" value="<%= rs.getString("studentid") %>">
</div>
<div class="form-group">
    <label for="grade">Grade:</label>
    <input type="text" class="form-control" name="grade" id="grade" value="<%= rs.getString("grade") %>">
</div>
<div class="form-group">
    <label for="comments">Comments:</label>
    <input type="text" class="form-control" name="comments" id="comments" value="<%= rs.getString("comments") %>">
</div>
<div class="form-group">
    <label for="instructorid">Instructor ID:</label>
    <input type="text" class="form-control" name="instructorid" id="instructorid" value="<%= rs.getString("instructorid") %>">
</div>
<div class="form-group">
    <label for="semester">Semester:</label>
    <input type="text" class="form-control" name="semester" id="semester" value="<%= rs.getString("semester") %>">
</div>
<div class="form-group">
    <label for="years">Years:</label>
    <input type="text" class="form-control" name="years" id="years" value="<%= rs.getString("years") %>">
</div>

 <div class="form-group">
 <input type="hidden" class="form-control" name="action" value="/updateGrades">
</div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } 
                
            %>
            <input type="submit" name="submit" value="Update" id="update">
        </form>
    </div>
    
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>