<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer - PantriPick</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        .footer {
            background-color: #1a1a1a;
            color: white;
            padding: 40px 0;
        }
        .footer a {
            text-decoration: none;
            color: #bbb;
            transition: color 0.3s;
        }
        .footer a:hover {
            color: #007bff;
        }
        .social-icons a {
            font-size: 20px;
            margin: 0 10px;
            color: #bbb;
        }
        .social-icons a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>

<footer class="footer text-center text-md-start">
    <div class="container">
        <div class="row">
            <!-- Brand Info -->
            <div class="col-md-4">
                <h2 class="fw-bold">PantriPick</h2>
                <p class="text-secondary">Your trusted pantry shopping solution.</p>
            </div>

            <!-- Quick Links -->
            <div class="col-md-4">
                <h3 class="fs-5 fw-semibold">Quick Links</h3>
                <ul class="list-unstyled">
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="Product.jsp">Products</a></li>
                    <li><a href="About.jsp">About</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
                </ul>
            </div>

            <!-- Social Media -->
            <div class="col-md-4">
                <h3 class="fs-5 fw-semibold">Follow Us</h3>
                <div class="social-icons mt-2">
                    <a href="https://www.facebook.com" target="_blank" class="me-2"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com" target="_blank" class="me-2"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.twitter.com" target="_blank" class="me-2"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>
        
        <!-- Copyright -->
        <div class="border-top mt-4 pt-3 text-secondary text-center">
            © 2025 PantriPick. All rights reserved.
        </div>
    </div>
</footer>

</body>
</html>
