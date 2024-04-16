<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
    }
    .containers {
        margin-top: 50px;
    }
</style>
<script>
function validateForm() {
    var username = document.forms["signupForm"]["username"].value;
    var userpass = document.forms["signupForm"]["userpass"].value;
    var email = document.forms["signupForm"]["email"].value;
    var dateofbirth = document.forms["signupForm"]["dateofbirth"].value;
    var contactno = document.forms["signupForm"]["contactno"].value;

    if (username == "") {
        alert("Name must be filled out");
        return false;
    }
    if (userpass == "") {
        alert("Password must be filled out");
        return false;
    }
    if (email == "") {
        alert("Email must be filled out");
        return false;
    }
    if (dateofbirth == "") {
        alert("Date of Birth must be filled out");
        return false;
    }
    if (contactno == "") {
        alert("Contact must be filled out");
        return false;
    }
}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="containers">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Sign Up</h3>
                </div>
                <div class="card-body">
                    <form name="signupForm" action="signs" method="post" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label for="username">Enter Name</label>
                            <input type="text" class="form-control" id="username" name="username">
                        </div>
                        <div class="form-group">
                            <label for="userpass">Enter Password</label>
                            <input type="password" class="form-control" id="userpass" name="userpass">
                        </div>
                        <div class="form-group">
                            <label for="email">Enter Email</label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="dateofbirth">Enter Date of Birth</label>
                            <input type="text" class="form-control" id="dateofbirth" name="dateofbirth">
                        </div>
                        <div class="form-group">
                            <label for="contactno">Enter Contact</label>
                            <input type="text" class="form-control" id="contactno" name="contactno">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
