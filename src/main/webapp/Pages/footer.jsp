<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        .footer p {
            margin: 10px 0;
            font-size: 14px;
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
            color: #1da1f2;
            transform: scale(1.2);
        }
        @media (max-width: 600px) {
            .social-icons a {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<footer>

    <div class="footer">
        <p>You can also reach us on:</p>
        <div class="social-icons">
            <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://twitter.com/" target="_blank"><i class="fab fa-x-twitter"></i></a>
            <a href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube"></i></a>
        </div>
        <p>© 2025. PantriPick, All rights reserved.</p>
    </div>
    </footer>

</body>
</html>
