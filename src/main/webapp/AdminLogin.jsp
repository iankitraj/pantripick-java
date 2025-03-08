<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdminLogin - PantriPick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Background Zoom Animation */
        @keyframes bgZoom {
            0% { transform: scale(1); }
            100% { transform: scale(1.1); }
        }

        /* Floating Particles Animation */
        @keyframes float {
            0% { transform: translateY(0); opacity: 0.6; }
            50% { transform: translateY(-20px); opacity: 1; }
            100% { transform: translateY(0); opacity: 0.6; }
        }

        /* Gradient Moving Animation */
        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Fade-in Slide Animation */
        @keyframes fadeInSlide {
            0% { opacity: 0; transform: translateY(-50px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        /* Background Image */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
            overflow: hidden;
            background: url('Image/home.png') no-repeat center center/cover;
        }

        /* Animated Background */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(5px);
            z-index: -1;
            animation: bgZoom 10s infinite alternate ease-in-out;
        }

        /* Floating Particles */
        .particle {
            position: absolute;
            width: 10px;
            height: 10px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 50%;
            opacity: 0.6;
            animation: float 5s infinite ease-in-out;
        }

        /* Random positioning for particles */
        .particle:nth-child(1) { top: 20%; left: 10%; animation-delay: 0s; }
        .particle:nth-child(2) { top: 40%; left: 30%; animation-delay: 1s; }
        .particle:nth-child(3) { top: 60%; left: 20%; animation-delay: 2s; }
        .particle:nth-child(4) { top: 80%; left: 50%; animation-delay: 3s; }
        .particle:nth-child(5) { top: 30%; left: 70%; animation-delay: 4s; }
        .particle:nth-child(6) { top: 70%; left: 90%; animation-delay: 5s; }

        /* Main Container */
        .container {
            display: flex;
            width: 50%;
            max-width: 800px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.3);
            border-radius: 15px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            position: relative;
            z-index: 2;
            animation: fadeInSlide 1.2s ease-in-out;
        }

        /* Image Container */
        .image-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .image-container img {
            width: 100%;
            max-width: 300px;
            max-height: 350px;
            object-fit: contain;
            transition: transform 0.5s ease-in-out;
        }

        .image-container:hover img {
            transform: scale(1.1);
        }

        /* Login Box */
        .login-container {
            flex: 1;
            padding: 60px;
            text-align: center;
            border-radius: 10px;
        }

        /* Input Fields Animation */
        .form-control {
            border-radius: 25px;
            padding: 12px;
            transition: all 0.3s ease-in-out;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 15px rgba(0, 123, 255, 0.5);
        }

        /* Button Ripple Effect */
        .btn-login {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
            border-radius: 25px;
            padding: 14px 30px;
            width: 100%;
            border: none;
            position: relative;
            overflow: hidden;
            font-weight: bold;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .btn-login:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }

        /* Ripple Effect */
        .btn-login:active::after {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.3);
            top: 0;
            left: 0;
            border-radius: 50%;
            transform: scale(0);
            animation: ripple 0.6s ease-out;
        }

        @keyframes ripple {
            0% { transform: scale(0); opacity: 1; }
            100% { transform: scale(2); opacity: 0; }
        }

        /* Links */
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

    <!-- Floating Particles -->
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>

    <div class="container">
        <div class="image-container">
            <img src="<%=request.getContextPath()%>/Image/Signupimg.jpeg" alt="Admin Illustration">
        </div>
        <div class="login-container">
            <h2>ADMIN LOGIN</h2>
            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-login">Login</button>
            </form>
        </div>
    </div>

</body>
</html>
