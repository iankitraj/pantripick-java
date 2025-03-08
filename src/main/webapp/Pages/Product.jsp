<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Products Available</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .products-container {
            max-width: 900px;
            width: 100%;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
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

        .category-title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 30px;
        }

        .product-card {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .product-card img {
            width: 150px;
            height: 150px;
            object-fit: contain;
            border-radius: 8px;
            background: #f0f0f0;
        }
    </style>
</head>

<body>
<%@ include file="navbar.jsp" %>
    <div class="products-container">
        <div class="products-title">
            <span style="font-weight: 100">PRODUCTS&nbsp;</span><span style="font-weight: bold">AVAILABLE</span>
        </div>

        <!-- Dairy, Bread & Eggs -->
        <h5 class="category-title">Dairy, Bread & Eggs</h5>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="product-card">
                    <img src="<%= request.getContextPath() %>/Image/bread.webp" alt="Product Image" />
                    <p>Britannia Brown Bread</p>
                    <p>₹30</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="product-card">
                    <img src="<%= request.getContextPath() %>/Image/dahi.webp" alt="Product Image" />
                    <p>Amul Masti Dahi</p>
                    <p>₹70</p>
                </div>
            </div>
            
            <div class="col-md-3">
            <a href="Details.jsp">
                <div class="product-card">
                    <img src="<%= request.getContextPath() %>/Image/keloggs.jpg" alt="Product Image" />
                    
                    <p>Honey Corn Flakes</p>
                    <p>₹278</p>
                    
                </div></a>
            </div>
            <div class="col-md-3">
                <div class="product-card">
                    <img src="<%= request.getContextPath() %>/Image/eggs.webp" alt="Product Image" />
                    <p>Eggs Tray</p>
                    <p>₹100</p>
                </div>
            </div>
        </div>

        <!-- Fruits & Vegetables -->
        <h5 class="category-title">Fruits & Vegetables</h5>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="product-card">
                    <img src="./placeholder.png" alt="Product Image" />
                    <p>Text</p>
                    <p>₹60</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="product-card">
                    <img src="./placeholder.png" alt="Product Image" />
                    <p>Text</p>
                    <p>₹60</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="product-card">
                    <img src="./placeholder.png" alt="Product Image" />
                    <p>Text</p>
                    <p>₹60</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="product-card">
                    <img src="./placeholder.png" alt="Product Image" />
                    <p>Text</p>
                    <p>₹60</p>
                </div>
            </div>
        </div>

        <!-- Snacks & Munchies -->
        <h5 class="category-title">Snacks & Munchies</h5>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="product-card">
                    <img src="./placeholder.png" alt="Product Image" />
                    <p>Text</p>
                    <p>₹50</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="product-card">
                    <img src="./placeholder.png" alt="Product Image" />
                    <p>Text</p>
                    <p>₹50</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="product-card">
                    <img src="./placeholder.png" alt="Product Image" />
                    <p>Text</p>
                    <p>₹50</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="product-card">
                    <img src="./placeholder.png" alt="Product Image" />
                    <p>Text</p>
                    <p>₹50</p>
                </div>
            </div>
        </div>
    </div>
    	
</body>
</html>