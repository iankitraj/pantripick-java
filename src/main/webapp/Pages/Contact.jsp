<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - PantriPick</title>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(to right, #ffdde1, #ffdde1);
            color: #333;
        }

        .container {
            max-width: 1100px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            border-radius: 12px;
            text-align: center;
            animation: fadeIn 1.5s ease-in-out;
        }

        h1 {
            font-size: 42px;
            background: linear-gradient(to right, #007bff, #ff6600);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 20px;
            animation: bounceIn 1.2s ease-in-out;
        }

        .content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
        }

        .image-section {
            flex: 1;
            text-align: center;
            padding: 20px;
        }

        .image-section img {
            width: 100%;
            max-width: 400px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            transition: transform 0.4s ease-in-out;
        }

        .image-section img:hover {
            transform: scale(1.1);
        }

        .info-section {
            flex: 1;
            text-align: left;
            padding: 20px;
            opacity: 0;
            animation: slideIn 1.5s ease-in-out forwards;
        }

        .info-section h2 {
            font-size: 26px;
            color: #007bff;
            margin-bottom: 12px;
        }

        .info-section p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 12px;
        }

        .btn {
            display: inline-block;
            background: linear-gradient(to right, #007bff, #ff6600);
            color: white;
            padding: 12px 30px;
            font-size: 18px;
            border-radius: 25px;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .btn:hover {
            transform: scale(1.1);
        }

        .feedback-form {
            margin-top: 30px;
            padding: 25px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1.5s ease-in-out;
        }

        .feedback-form h2 {
            color: #007bff;
            margin-bottom: 15px;
        }

        .feedback-form input, .feedback-form textarea {
            width: 80%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s;
        }

        .feedback-form input:focus, .feedback-form textarea:focus {
            border-color: #007bff;
            outline: none;
            transform: scale(1.02);
        }

        .feedback-form button {
            background: linear-gradient(to right, #007bff, #ff6600);
            color: white;
            padding: 12px 30px;
            border: none;
            cursor: pointer;
            font-size: 18px;
            border-radius: 25px;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .feedback-form button:hover {
            transform: scale(1.1);
        }

        .back-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: linear-gradient(to right, #007bff, #ff6600);
            color: white;
            padding: 12px 18px;
            border-radius: 50%;
            font-size: 22px;
            cursor: pointer;
            display: none;
            transition: 0.3s;
        }

        .back-to-top:hover {
            transform: scale(1.1);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes bounceIn {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container">
        <h1>Contact <strong>Us</strong></h1>
        <div class="content">
            <div class="image-section">
                <img src="<%= request.getContextPath() %>/Image/img2.jpeg" alt="Store Interior">
            </div>
            <div class="info-section">
                <h2>Our Store</h2>
                <p>Address Line 1</p>
                <p>Address Line 2</p>
                <p>Tel: (Your Phone Number)</p>
                <p>Email: (Your Email Address)</p>
                <h2>Careers at PantriPick</h2>
                <p>Learn more about our terms and job openings</p>
               <!--  <a href="#" class="btn">Explore Jobs</a> -->
            </div>
        </div>
    </div>
</body>
</html>
