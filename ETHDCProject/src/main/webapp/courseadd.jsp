<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <h3>Add New Course Form</h3>
        <form action="course" method="post">
            <div class="form-group">
                <label for="coursename">Enter Course Name</label>
                <input type="text" class="form-control" id="coursename" name="coursename" required>
            </div>
            <div class="form-group">
                <label for="department">Enter Department</label>
                <input type="text" class="form-control" id="department" name="department" required>
            </div>
            <div class="form-group">
                <label for="instructorid">Enter Instructor Id</label>
                <input type="text" class="form-control" id="instructorid" name="instructorid" required>
            </div>
           <!--  <div class="form-group">
                <label for="startdate">Enter Start date</label>
                <input type="text" class="form-control" id="startdate" name="startdate" required>
            </div>
            <div class="form-group">
                <label for="enddate">Enter End date</label>
                <input type="text" class="form-control" id="enddate" name="enddate" required>
            </div> -->
            <div class="form-group">
                <label for="maxcapacity">Enter Max Capacity</label>
                <input type="text" class="form-control" id="maxcapacity" name="maxcapacity" required>
            </div>
            <div class="form-group">
                <label for="cstatus">Enter Status</label>
                <input type="text" class="form-control" id="cstatus" name="cstatus" required>
            </div>
            <div class="form-group">
    <label>Are You Sure</label><br>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" id="actionYes" name="action" value="/addCourses" required>
        <label class="form-check-label" for="actionYes">Yes</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" id="actionNo" name="action" value="otherValue" required>
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
