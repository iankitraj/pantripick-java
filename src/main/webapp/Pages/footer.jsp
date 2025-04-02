<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Footer</title>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .footer {
            background-color: black;
            color: white;
            text-align: center;
            padding: 5px 0; /* Further reduced padding */
            width: 100%;
            position: relative;
            bottom: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .footer-nav {
            display: flex;
            justify-content: center;
            gap: 8px; /* Reduced gap */
            flex-wrap: wrap;
            margin-bottom: 3px; /* Reduced margin */
        }

        .footer-nav a {
            color: white;
            text-decoration: none;
            font-size: 12px; /* Smaller font size */
            transition: color 0.3s ease-in-out;
        }

        .footer-nav a:hover {
            color: #ff6600;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 6px; /* Reduced gap */
            margin-top: 3px;
        }

        .social-icons a {
            color: white;
            font-size: 14px; /* Smaller icon size */
            transition: transform 0.3s ease-in-out, color 0.3s;
        }

        .social-icons a:hover {
            transform: scale(1.1);
        }

        .footer p {
            margin: 2px 0; /* Further reduced margin */
            font-size: 10px; /* Smaller text size */
        }

        @media (max-width: 600px) {
            .footer-nav {
                flex-direction: column;
                gap: 3px; /* Reduced gap for mobile */
            }
            .social-icons a {
                font-size: 12px; /* Smaller size for mobile */
            }
        }
    </style>
</head>
<body>

<footer class="footer">

    <p>Follow us on:</p>
    <div class="social-icons">
        <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
        <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
        <a href="https://twitter.com/" target="_blank"><i class="fab fa-x-twitter"></i></a>
        <a href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
        <a href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube"></i></a>
    </div>
    
    <p>© 2025 PantriPick. All rights reserved.</p>
</footer>

</body>
</html>
