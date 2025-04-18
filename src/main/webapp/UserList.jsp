<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List - PantriPick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(-45deg, #1a1a2e, #16213e, #0f3460);
            background-size: 300% 300%;
            animation: bgAnimation 10s infinite alternate;
            color: white;
            text-align: center;
            padding: 20px;
        }

        @keyframes bgAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            width: 90%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #007bff;
            color: white;
        }

        tr:hover {
            background: #f2f2f2;
        }

        .btn-danger {
            padding: 5px 10px;
            font-size: 12px;
        }

        #searchInput {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<%@ include file="AdminNavbar.jsp" %>

<div class="container">
    <h2>Users List</h2>
    <input type="text" id="searchInput" class="form-control" placeholder="Search by name..." onkeyup="searchUsers()">

    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody id="userTable">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");

                String query = "SELECT name, email, password FROM user";
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
        %>
        <tr data-email="<%=email%>">
            <td><%=name%></td>
            <td><%=email%></td>
            <td><%=password%></td>
            <td>
                <button class="btn btn-danger" onclick="removeUser('<%=email%>', this.closest('tr'))">Remove</button>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script>
    function removeUser(email, rowElement) {
        // Log the email for debugging
        console.log("Trying to remove user with email:", email);

        // Confirm before removing the user
        if (!confirm("Are you sure you want to remove this user?")) return;

        fetch("RemoveUserServlet", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "email=" + encodeURIComponent(email)
        })
        .then(response => response.text())
        .then(result => {
            console.log("Server response:", result);  // Log the response
            if (result.trim() === "success") {
                rowElement.remove();  // Remove row from table if success
                Toastify({
                    text: "User removed successfully ✅",
                    duration: 3000,
                    gravity: "top",
                    position: "center",
                    backgroundColor: "#28a745"
                }).showToast();
            } else {
                Toastify({
                    text: "Error: " + result + " ✖",
                    duration: 3000,
                    gravity: "top",
                    position: "center",
                    backgroundColor: "#dc3545"
                }).showToast();
            }
        })
        .catch(error => {
            console.error("Error:", error);
            Toastify({
                text: "Error occurred ✖",
                duration: 3000,
                gravity: "top",
                position: "center",
                backgroundColor: "#dc3545"
            }).showToast();
        });
    }
</script>

</body>
</html>