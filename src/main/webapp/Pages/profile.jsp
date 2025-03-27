<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>

<%
    // 🔍 Check if the user is logged in
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("userId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // ✅ Get user details from session
    int userId = (int) userSession.getAttribute("userId");
    String userName = (String) userSession.getAttribute("userName");
    String userEmail = (String) userSession.getAttribute("userEmail");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(45deg, #ffdde1, #ee9ca7);
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .profile-container {
            width: 40%;
            max-width: 500px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .btn-edit {
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .btn-edit:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }
    </style>
</head>
<body>

    <div class="profile-container">
        <h2>User Profile</h2>
        <hr>
        <p><strong>User ID:</strong> <%= userId %></p>
        <p><strong>Name:</strong> <%= userName %></p>
        <p><strong>Email:</strong> <%= userEmail %></p>

        <a href="editProfile.jsp" class="btn btn-edit">Edit Profile</a>
    </div>

</body>
</html>
