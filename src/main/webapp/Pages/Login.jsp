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
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            position: relative;
            background: linear-gradient(45deg, #ffdde1, #ee9ca7);
            animation: backgroundAnimation 10s infinite alternate;
        }

        @keyframes backgroundAnimation {
            0% {
                background: linear-gradient(45deg, #ffdde1, #ee9ca7);
            }
            100% {
                background: linear-gradient(45deg, #ee9ca7, #ffdde1);
            }
        }

        /* Floating particles */
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            overflow: hidden;
            z-index: -1;
        }
        
        .particles span {
            position: absolute;
            width: 10px;
            height: 10px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            animation: float 10s linear infinite;
        }
        
        @keyframes float {
            0% {
                transform: translateY(0);
                opacity: 1;
            }
            100% {
                transform: translateY(-100vh);
                opacity: 0;
            }
        }

        /* Main container */
        .container {
            display: flex;
            width: 40%;
            max-width: 600px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            overflow: hidden;
            background: white;
            animation: slideIn 1.2s ease-in-out;
        }

        .image-container {
            flex: 1;
            overflow: hidden;
            position: relative;
        }

        .image-container img {
            width: 100%;
            height: auto;
            max-width: 250px;
            max-height: 300px;
            display: block;
            margin: auto;
            object-fit: contain;
            transition: transform 0.5s ease-in-out;
        }
        
        .image-container:hover img {
            transform: scale(1.1);
        }

        .login-container {
            flex: 1;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 50px;
            text-align: center;
            border-radius: 10px;
        }

        .btn-login {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
            border-radius: 25px;
            padding: 12px 25px;
            width: 100%;
            border: none;
            transition: transform 0.3s, box-shadow 0.3s;
            font-weight: bold;
            position: relative;
            overflow: hidden;
        }

        .btn-login:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        .link a {
            color: black;
            text-decoration: none;
            transition: color 0.3s;
            font-weight: bold;
        }

        .link a:hover {
            color: blue;
        }
    </style>
</head>
<body>
    <div class="particles">
        <!-- Generating floating particles dynamically -->
        <script>
            for (let i = 0; i < 20; i++) {
                let particle = document.createElement("span");
                let size = Math.random() * 10 + "px";
                particle.style.width = size;
                particle.style.height = size;
                particle.style.left = Math.random() * 100 + "%";
                particle.style.top = Math.random() * 100 + "%";
                particle.style.animationDuration = Math.random() * 5 + 5 + "s";
                document.querySelector(".particles").appendChild(particle);
            }
        </script>
    </div>

    <div class="container">
        <div class="image-container">
            <img src="<%=request.getContextPath()%>/Image/Signupimg.jpeg" alt="Signup Illustration">
        </div>
        <div class="login-container">
            <h2>LOGIN HERE</h2>
            <form action="UserLoginServlet" method="POST">
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
    </div>
</body>
</html>