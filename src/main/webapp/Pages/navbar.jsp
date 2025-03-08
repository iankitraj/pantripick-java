<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navbar - PantriPick</title>

    <!-- ✅ Font Awesome (Fix for missing icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* Reset Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f8f9fa;
        }

        /* Navbar Styling */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            padding: 15px 50px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: black;
        }

        .nav-links a {
            text-decoration: none;
            color: black;
            margin: 0 15px;
            font-size: 18px;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #007bff;
            font-weight: bold;
        }

        .icon-container {
            display: flex;
            align-items: center;
            gap: 20px;
            position: relative;
        }

        .icon-container i {
            font-size: 20px;
            cursor: pointer;
            color: black;  /* ✅ Ensuring visibility */
            transition: transform 0.2s, color 0.3s;
        }

        .icon-container i:hover {
            transform: scale(1.1);
            color: #007bff;
        }

        /* Profile Dropdown */
        .profile-dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            top: 35px;
            background: white;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px;
            width: 120px;
            text-align: center;
        }

        .dropdown-content a {
            display: block;
            text-decoration: none;
            color: black;
            padding: 8px;
            font-size: 16px;
            transition: background 0.3s;
        }

        .dropdown-content a:hover {
            background: #007bff;
            color: white;
            border-radius: 5px;
        }

        .profile-dropdown.active .dropdown-content {
            display: block;
        }

           header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: white;
        padding: 15px 50px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
    }
    .icon-container {
        display: flex;
        align-items: center;
        gap: 20px;
    }
    .profile-icon, .fa-shopping-cart, .search-icon {
        font-size: 20px;
        cursor: pointer;
        color: black;
        transition: transform 0.2s, color 0.3s;
    }
    .profile-icon:hover, .fa-shopping-cart:hover, .search-icon:hover {
        transform: scale(1.1);
        color: #007bff;
    }
    .search-container {
        display: flex;
        align-items: center;
        border: 1px solid #ccc;
        padding: 5px;
        border-radius: 5px;
        background: white;
    }
    .search-container input {
        border: none;
        outline: none;
        font-size: 16px;
        width: 150px;
    }
    body {
        padding-top: 80px; /* To prevent content from hiding behind fixed header */
    }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let profileDropdown = document.querySelector(".profile-dropdown");
            let profileIcon = document.querySelector(".profile-icon");

            // Toggle dropdown on click
            profileIcon.addEventListener("click", function (event) {
                event.stopPropagation();
                profileDropdown.classList.toggle("active");
            });

            // Close dropdown when clicking outside
            document.addEventListener("click", function (event) {
                if (!profileDropdown.contains(event.target)) {
                    profileDropdown.classList.remove("active");
                }
            });

            // Search Functionality
            document.querySelector(".search-icon").addEventListener("click", function () {
                let query = document.querySelector(".search-input").value;
                if (query.trim() !== "") {
                    window.location.href = "search.jsp?query=" + encodeURIComponent(query);
                }
            });
        });
    </script>
</head>
<body>
    <header style="width: 100%; position: fixed; top: 0; left: 0; z-index: 1000;">
    <div class="logo">PantriPick</div>
    <nav class="nav-links">
        <a href="Home.jsp">Home</a>
        <a href="Product.jsp">Products</a>
        <a href="About.jsp">About</a>
        <a href="Contact.jsp">Contact</a>
    </nav>
    <div class="icon-container">
        <div class="search-container">
            <input type="text" class="search-input" placeholder="Search...">
            <i class="fas fa-search search-icon"></i>
        </div>
        <div class="profile-dropdown">
            <i class="fas fa-user profile-icon"></i>
            <div class="dropdown-content">
                <a href="Login.jsp">Sign In</a>
                <a href="Signup.jsp">Sign Up</a>
            </div>
        </div>
        <a href="Cart.jsp"><i class="fas fa-shopping-cart"></i></a>
    </div>
</header>
</body>
</html>
