<%@ page import="java.sql.*, jakarta.servlet.http.*" %>
<%
    HttpSession sessionUser = request.getSession(false);
    String userEmail = (sessionUser != null) ? (String) sessionUser.getAttribute("user") : null;

    if (userEmail == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String name = "", email = "", password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

        String query = "SELECT * FROM user WHERE email = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, userEmail);
        rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            password = rs.getString("password");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    String message = (String) request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .profile-container {
            max-width: 500px;
            margin: 80px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
        .btn-primary {
            transition: 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="profile-container">
    <h2 class="text-center">User Profile</h2>
    
    <!-- Show Update Message -->
    <% if (message != null) { %>
        <div id="updateMessage" class="alert alert-success text-center"><%= message %></div>
    <% } %>

    <form action="<%= request.getContextPath() %>/UpdateProfileServlet" method="POST">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" readonly>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Update Profile</button>
    </form>
    <a href="Home.jsp" class="btn btn-secondary w-100 mt-3">Back to Home</a>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        let messageBox = document.getElementById("updateMessage");
        if (messageBox) {
            setTimeout(() => {
            	window.location.href = "Pages/Home.jsp";
            }, 3000);
        }
    });
</script>

</body>
</html>
