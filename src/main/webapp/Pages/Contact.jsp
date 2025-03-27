<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            padding-top: 80px; /* Prevents navbar overlap */
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

        .store-locations {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .store-card {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .store-card:hover {
            transform: scale(1.05);
        }

        .store-card h3 {
            color: #ff6600;
            margin-bottom: 5px;
        }

        .store-card p {
            font-size: 16px;
            margin: 5px 0;
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
                <h2>Our Stores in Rajkot</h2>
                <div class="store-locations">
                    <div class="store-card">
                        <h3>PantriPick - Kalawad Road</h3>
                        <p>Shop No. 12, ABC Complex, Kalawad Road, Rajkot</p>
                        <p>Tel: +91 9876543210</p>
                    </div>

                    <div class="store-card">
                        <h3>PantriPick - Yagnik Road</h3>
                        <p>GF-5, XYZ Plaza, Yagnik Road, Rajkot</p>
                        <p>Tel: +91 9765432109</p>
                    </div>

                    <div class="store-card">
                        <h3>PantriPick - 150 Feet Ring Road</h3>
                        <p>Opp. ABC Mall, 150 Feet Ring Road, Rajkot</p>
                        <p>Tel: +91 9988776655</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button class="back-to-top" onclick="scrollToTop()">↑</button>

    <script>
        window.onscroll = function() {
            let btn = document.querySelector(".back-to-top");
            if (document.documentElement.scrollTop > 200) {
                btn.style.display = "block";
            } else {
                btn.style.display = "none";
            }
        };

        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: "smooth" });
        }
    </script>
</body>

</html>
