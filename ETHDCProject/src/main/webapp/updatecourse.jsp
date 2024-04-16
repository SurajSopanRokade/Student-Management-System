<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.proj.utility.DBConnectivity" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Course</title>
    
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
        <form action="course" method="post">
            <%
                String c = request.getParameter("c");
                int courseid = Integer.parseInt(c);
                
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                
                try {
                    con = DBConnectivity.getConnection();
                    ps = con.prepareStatement("SELECT * FROM courses WHERE courseid=?");
                    ps.setInt(1, courseid);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                       
            %>
                            <div class="form-group">
    <label for="courseid">Course ID:</label>
    <input type="text" class="form-control" id="courseid" name="courseid" value="<%= rs.getString("courseid") %>">
</div>
<div class="form-group">
    <label for="coursename">Course Name:</label>
    <input type="text" class="form-control" id="coursename" name="coursename" value="<%= rs.getString("coursename") %>">
</div>
<div class="form-group">
    <label for="department">Department:</label>
    <input type="text" class="form-control" id="department" name="department" value="<%= rs.getString("department") %>">
</div>
<div class="form-group">
    <label for="instructorid">Instructor ID:</label>
    <input type="text" class="form-control" id="instructorid" name="instructorid" value="<%= rs.getString("instructorid") %>">
</div>

<div class="form-group">
    <label for="maxcapacity">Max Capacity:</label>
    <input type="text" class="form-control" id="maxcapacity" name="maxcapacity" value="<%= rs.getString("maxcapacity") %>">
</div>
<div class="form-group">
    <label for="cstatus">Course Status:</label>
    <input type="text" class="form-control" id="cstatus" name="cstatus" value="<%= rs.getString("cstatus") %>">
</div>

  <div class="form-group">
   <input type="hidden" class="form-control" name="action" value="/updateCourses">
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
