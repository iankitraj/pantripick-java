<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FooterPage -- PantriPick</title>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        .footer {
            background-color: black;
            color: white;
            text-align: center;
            padding: 20px 0;
            width: 100%;
        }

        .footer-nav {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 10px;
        }

        .footer-nav a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease-in-out;
        }

        .footer-nav a:hover {
            color: #ff6600;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 10px;
        }

        .social-icons a {
            color: white;
            font-size: 24px;
            transition: transform 0.3s ease-in-out, color 0.3s;
        }

        .social-icons a:hover {
            transform: scale(1.2);
        }

        .social-icons .fa-facebook-f:hover { color: #1877f2; }
        .social-icons .fa-instagram:hover { color: #E4405F; }
        .social-icons .fa-x-twitter:hover { color: #1da1f2; }
        .social-icons .fa-linkedin-in:hover { color: #0077b5; }
        .social-icons .fa-youtube:hover { color: #ff0000; }

        .footer p {
            margin: 10px 0;
            font-size: 14px;
        }

        @media (max-width: 600px) {
            .footer-nav {
                flex-direction: column;
                gap: 10px;
            }
            .social-icons a {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

<footer>
    <div class="footer">
        <nav class="footer-nav">
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="about.jsp">About Us</a>
            <a href="contact.jsp">Contact</a>
        </nav>

        <p>Follow us on:</p>
        <div class="social-icons">
            <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://twitter.com/" target="_blank"><i class="fab fa-x-twitter"></i></a>
            <a href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube"></i></a>
        </div>
        
        <p>© 2025 PantriPick. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
