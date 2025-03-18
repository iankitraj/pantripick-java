<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - PantriPick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(45deg, #ffdde1, #ee9ca7);
            animation: backgroundAnimation 10s infinite alternate;
        }

        @keyframes backgroundAnimation {
            0% { background: linear-gradient(45deg, #ffdde1, #ee9ca7); }
            100% { background: linear-gradient(45deg, #ee9ca7, #ffdde1); }
        }

        .container {
            width: 40%;
            max-width: 500px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            background: white;
            padding: 30px;
            text-align: center;
        }

        .btn-login {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
            border-radius: 25px;
            padding: 12px;
            width: 100%;
            border: none;
            font-weight: bold;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .btn-login:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        .link a {
            color: black;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            color: blue;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>LOGIN HERE</h2>
        <form action="<%=request.getContextPath()%>/UserLoginServlet" method="POST">
            <div class="mb-3">
                <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-login">Login</button>
        </form>
        <div class="link">
            <a href="ForgetPassword.jsp">Forgot Password?</a> | <a href="Signup.jsp">Sign Up</a>
        </div>
    </div>

</body>
</html>
