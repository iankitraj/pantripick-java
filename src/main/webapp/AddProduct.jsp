<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AddProduct - PantriPick Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    
    <style>
        /* Background Image */
        body {
            font-family: Arial, sans-serif;
            background: url('Image/background.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        /* Overlay to improve text visibility */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6); /* Dark overlay */
            z-index: 0;
        }

        /* Navbar styles */
        header {
            background-color: rgba(34, 34, 34, 0.9);
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 2;
        }

        header .logo {
            font-weight: bold;
            font-size: 1.5rem;
        }

        header nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 1rem;
            transition: color 0.3s ease-in-out;
        }

        header nav a:hover {
            color: #ff9800;
        }

        /* Form container with fade-in animation */
        .container {
            background: rgba(255, 255, 255, 0.9);
            color: black;
            padding: 40px;
            border-radius: 20px;
            width: 400px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            margin: 50px auto;
            position: relative;
            z-index: 1;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Smooth input focus effect */
        .form-control {
            margin-bottom: 15px;
            transition: all 0.3s ease-in-out;
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
            border-color: #007bff;
            transform: scale(1.02);
        }

        /* File upload animation */
        .upload-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px dashed #ddd;
            padding: 20px;
            cursor: pointer;
            background-color: #f9f9f9;
            transition: all 0.3s ease-in-out;
        }

        .upload-btn:hover {
            border-color: #007bff;
            background: rgba(0, 123, 255, 0.1);
            transform: scale(1.05);
        }

        .upload-btn span {
            color: #555;
            transition: color 0.3s ease-in-out;
        }

        .upload-btn input[type="file"] {
            display: none;
        }

        /* Submit button styles */
        .btn-submit {
            background-color: black;
            color: white;
            border-radius: 25px;
            width: 100%;
            padding: 10px;
            transition: all 0.3s ease-in-out;
        }

        .btn-submit:hover {
            background-color: darkslategray;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .btn-submit:active {
            transform: translateY(1px);
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

    <% request.setAttribute("pageName", "Add Product"); %>
    <jsp:include page="AdminNavbar.jsp" />

    <div class="container">
        <h2>ADD ITEMS</h2>
        <form action="AddProductServlet" method="post" enctype="multipart/form-data">
            <input type="text" class="form-control" name="name" placeholder="Name" required>
            <input type="number" class="form-control" name="quantity" placeholder="Quantity" required>
            <input type="number" class="form-control" name="price" placeholder="Price" required>
            <textarea class="form-control" name="description" placeholder="Description" rows="3" required></textarea>
            
            <label class="upload-btn">
                <span>Upload Image</span>
                <input type="file" name="image" accept="image/*">
            </label>

            <br><br>
            <button type="submit" class="btn btn-submit">Add Product</button>
        </form>
    </div>

</body>
</html>
