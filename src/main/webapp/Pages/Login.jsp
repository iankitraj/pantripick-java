<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String errorMessage = request.getParameter("error"); // Error message from URL
%>

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

        .container-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 40px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
        }

        .image-container {
            width: 300px;
            height: auto;
        }

        .image-container img {
            width: 100%;
            border-radius: 15px;
            transition: transform 0.5s ease-in-out;
        }

        .image-container:hover img {
            transform: scale(1.1);
        }

        .login-container {
            background: white;
            color: black;
            padding: 40px;
            width: 420px;
            border-radius: 15px;
            text-align: center;
            position: relative;
            overflow: hidden;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }

        .login-container h2 {
            font-size: 24px;
            font-weight: bold;
        }

        .login-container form input {
            margin-bottom: 15px;
            border-radius: 10px;
            padding: 10px;
            border: 1px solid lightgray;
            transition: 0.3s ease-in-out;
            width: 100%;
        }

        .login-container form input:focus {
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.4);
        }

        .btn-login {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
            border-radius: 25px;
            padding: 12px 25px;
            width: 100%;
            font-weight: bold;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background: linear-gradient(45deg, #0056b3, #007bff);
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        .link a {
            color: black;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            color: royalblue;
        }

        .alert-box {
            position: relative;
            text-align: center;
            padding: 10px;
            background: #ff4d4d;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            margin-bottom: 10px;
            overflow: hidden;
        }

        .moving-line {
            position: absolute;
            bottom: -3px;
            left: 100%;
            width: 100%;
            height: 3px;
            background: white;
            animation: moveLine 3s linear forwards;
        }

        @keyframes moveLine {
            from { left: 100%; }
            to { left: 0%; }
        }

        @media (max-width: 768px) {
            .container-wrapper {
                flex-direction: column;
                gap: 20px;
            }

            .image-container {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>
    <div class="container-wrapper">
        <div class="image-container">
            <img src="<%= request.getContextPath()%>/Image/Signupimg.jpeg" alt="Login Illustration">
        </div>
        <div class="login-container">
            <h2>LOGIN HERE</h2>
            <% if (errorMessage != null) { %>
                <div id="error-box" class="alert-box">
                    <%= errorMessage %>
                    <div class="moving-line"></div>
                </div>
            <% } %>
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
                <a href="<%= request.getContextPath() %>/ForgetPassword.jsp">Forgot Password?</a> | <a href="Signup.jsp">Sign Up</a>
            </div>
        </div>
    </div>

    <script>
        window.onload = function () {
            let errorBox = document.getElementById("error-box");
            if (errorBox) {
                setTimeout(function () {
                    window.history.replaceState(null, null, "<%= request.getContextPath() %>/Pages/Login.jsp");
                    errorBox.style.display = "none";
                }, 3000);
            }
        };
    </script>
</body>
</html>
