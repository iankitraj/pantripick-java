<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AboutPage -- PantriPick</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: lightblue;
            color: #333;
        }

        .about-container {
            max-width: 1100px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
            opacity: 0;
            animation: fadeIn 1.2s forwards;
        }

        .about-title {
            font-size: 38px;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 20px;
            animation: slideDown 1s ease-out;
        }

        .about-title strong {
            color: #ff6600;
        }

        .image-section {
            width: 100%;
            text-align: center;
            padding: 20px;
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .image-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .image-container img {
            width: 200px;
            height: 200px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out, opacity 1s ease-in-out;
            opacity: 0;
            animation: fadeInImage 1.5s forwards;
        }

        .image-container img:hover {
            transform: scale(1.1);
        }

        .image-container p {
            margin-top: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #555;
        }

        .info-section {
            text-align: left;
            padding: 20px;
            opacity: 0;
            animation: slideLeft 1.2s ease-in-out forwards;
        }

        .info-section p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 15px;
        }

        .btn {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            font-size: 18px;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s, transform 0.2s;
        }

        .btn:hover {
            background-color: #ff6600;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .image-section {
                flex-direction: column;
                align-items: center;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideLeft {
            from { opacity: 0; transform: translateX(-30px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes fadeInImage {
            from { opacity: 0; transform: scale(0.8); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>

    <%@ include file="navbar.jsp"%>

    <div class="container about-container">
        <h1 class="about-title">
            About <strong>Us</strong>
        </h1>

        <div class="image-section">
            <div class="image-container">
                <img src="<%=request.getContextPath()%>/Image/img1.jpeg" alt="Store Interior">
                <p>Store Interior</p>
            </div>
            <div class="image-container">
                <img src="<%=request.getContextPath()%>/Image/img2.jpeg" alt="Fresh Produce">
                <p>Fresh Produce</p>
            </div>
            <div class="image-container">
                <img src="<%=request.getContextPath()%>/Image/img2.jpeg" alt="Shopping Aisle">
                <p>Shopping Aisle</p>
            </div>
        </div>

        <div class="info-section">
            <p>
                Welcome to <strong>PantriPick</strong>, your trusted neighborhood grocery shop. We are dedicated 
                to providing a variety of high-quality products to meet the needs of every shopper. From fresh 
                produce to everyday essentials, we aim to offer a wide selection of items to make your shopping 
                experience convenient and enjoyable.
            </p>

            <p>
                Our focus is on <strong>quality, service, and customer satisfaction</strong>. Whether you're coming in for a quick grocery 
                run or preparing for a big meal, we are here to support you with friendly service and a great selection.
            </p>

            <p>
                Thank you for choosing us. We look forward to serving you!
            </p>

           

        </div>
    </div>

</body>
</html>
