<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup - PantriPick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(-45deg, #ff9a9e, #fad0c4, #fad0c4, #ffdde1);
            background-size: 400% 400%;
            color: white;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            animation: fadeIn 1.5s ease-in-out, bgAnimation 6s infinite linear;
        }

        @keyframes bgAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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
            animation: slideIn 1.2s ease-in-out;
        }

        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
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

        .signup-container {
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

        .signup-container h2 {
            font-size: 24px;
            font-weight: bold;
            animation: fadeIn 1s ease-in-out;
        }

        .signup-container form input {
            margin-bottom: 15px;
            border-radius: 10px;
            padding: 10px;
            border: 1px solid lightgray;
            transition: 0.3s ease-in-out;
            width: 100%;
        }

        .signup-container form input:focus {
            border-color: #ff4b2b;
            box-shadow: 0 0 10px rgba(255, 75, 43, 0.4);
        }

        .btn-signup {
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            color: white;
            border-radius: 25px;
            padding: 12px 25px;
            width: 100%;
            font-weight: bold;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-signup:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(255, 75, 43, 0.4);
        }

        .link a {
            color: black;
            text-decoration: none;
            font-weight: bold;
        }

        .link a:hover {
            color: royalblue;
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
        <!-- Signup Image -->
        <div class="image-container">
            <img src="<%=request.getContextPath()%>/Image/Signupimg.jpeg" alt="Signup Illustration">
        </div>

        <!-- Signup Form -->
        <div class="signup-container">
            <h2>SIGN UP HERE</h2>
            <form action="<%= request.getContextPath() %>/SignupServlet" method="post">
                <div class="mb-3">
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                </div>
                <div class="mb-3">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-signup">Sign Up</button>
            </form>
            <div class="link">Already a member? <a href="Login.jsp">Log In</a></div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
