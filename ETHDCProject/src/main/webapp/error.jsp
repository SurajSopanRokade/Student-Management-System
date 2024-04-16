<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        
        .containers{
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
        }

        h1 {
            color: #333333;
        }

        p {
            color: #666666;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="containers">
        <h1>Welcome to Our Website</h1>
        <p>Please sign up to continue.</p>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
