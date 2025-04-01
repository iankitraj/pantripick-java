<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HomePage --PantriPick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            flex-direction: column;
            padding: 40px;
        }
        .container {
            max-width: 1000px;
            width: 100%;
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .hero-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 30px;
            padding-bottom: 170px;
            padding-top: 100px;
        }
        .hero-text h1 {
            font-size: 40px;
            font-weight: bold;
            color: #28a745;
        }
        .hero-text p {
            font-size: 34px;
            color: #333;
            font-weight: bold;
        }
        .hero-btns .btn {
            border-radius: 6px;
            padding: 8px 15px;
            font-weight: bold;
            margin-right: 10px;
        }
        .hero-img {
            max-width: 250px;
            border-radius: 12px;
        }
        .products-title {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
        }
        .products-title::after {
            content: '';
            flex-grow: 1;
            height: 2px;
            background-color: black;
            margin-left: 10px;
        }
        .category-card {
            background: #fff;
            padding: 15px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .category-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }
        .category-card img {
            width: 100px;
            height: 100px;
            object-fit: contain;
            border-radius: 8px;
            background: #f0f0f0;
        }
        .about-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 30px;
            margin-top: 40px;
        }
        .about-text h3 {
            font-size: 22px;
            font-weight: bold;
        }
        .about-img {
            border-radius: 12px;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<%
    // Check if user is logged in
    boolean isLoggedIn = (session.getAttribute("user") != null);
%>

<div class="container">
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-text">
            <h1>FRESH GROCERIES</h1>
            <p>STRAIGHT TO YOUR DOOR</p><br><br>
            <div class="hero-btns">
                <a href="<%= isLoggedIn ? "Product.jsp" : "Signup.jsp" %>" class="btn btn-outline-dark">Get Started →</a>
                <a href="<%= isLoggedIn ? "Product.jsp" : "Signup.jsp" %>" class="btn btn-success">Shop Now</a>
            </div>
        </div>
        <img src="<%= request.getContextPath()%>/Image/Grocery Bag.jpg" alt="Grocery Bag" height="350" width="300" class="hero-img">
    </div>

    <!-- Categories Section -->
    <div class="products-title">
        <span style="font-weight: 100">PRODUCTS&nbsp;</span><span style="font-weight: bold">CATEGORIES</span>
    </div>
    <div class="row g-4 mt-3">
        <%
            // Category List
            String[][] categories = {
                {"Dairy & Bread.jpg", "Dairy and Bread"},
                {"Fruits & Vegetables.jpg", "Fruits and Vegetables"},
                {"Cold Drinks and Juice.jpg", "Cold Drinks and Juice"},
                {"Snacks & Munchies.jpg", "Snacks and Munchies"},
                {"Biscuits.jpg", "Bakery and Biscuits"},
                {"Spices and Herbs.jpg", "Spices and Herbs"},
                {"Personal Care.jpg", "Personal Care"},
                {"Cleaning Essentials.jpeg", "Cleaning Essentials"}
            };

            for (String[] category : categories) {
        %>
        <div class="col-md-3">
            <div class="category-card">
                <img src="<%= request.getContextPath() %>/Image/<%= category[0] %>" alt="<%= category[1] %>">
                <p><%= category[1] %></p>
                <a href="<%= isLoggedIn ? "Product.jsp" : "Signup.jsp" %>" class="btn btn-sm btn-primary mt-2">Explore</a>
            </div>
        </div>
        <% } %>
    </div>

    <!-- About Section -->
    <div class="about-section row mt-5 p-4">
        <div class="col-md-6 d-flex flex-column justify-content-center">
            <h3 class="fw-bold">ABOUT US</h3>
            <p class="text-muted">
                We deliver fresh groceries to your home with the best quality and lowest prices. 
                Shop online from the comfort of your home and get everything you need, right at your doorstep.
            </p><br><br><br><br><br>
            <a href="About.jsp" class="btn btn-outline-dark mt-2">More Info →</a>
        </div>
        <div class="col-md-6 text-end">
            <img src="<%= request.getContextPath() %>/Image/Grocery Store.jpeg" alt="Grocery Store" class="about-img img-fluid">
        </div>
    </div>
</div> 

<%@ include file="footer.jsp" %>

</body>
</html>
