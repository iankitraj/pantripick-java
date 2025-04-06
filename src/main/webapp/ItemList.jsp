<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Item List (Admin)</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #071b3c, #0c1f3f);
            color: #fff;
        }

        .container {
            background: #fff;
            color: #000;
            max-width: 900px;
            margin: 30px auto;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.4);
        }

        h2 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
        }

        #searchInput {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
            font-size: 15px;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e8f0fe;
        }

        img {
            width: 60px;
            height: 60px;
            object-fit: contain;
        }

        .btn-danger {
            background-color: #e74c3c;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }
    </style>

    <script>
        function searchProducts() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let rows = document.querySelectorAll("#productTable tbody tr");

            rows.forEach(row => {
                let name = row.querySelector("td:nth-child(2)").textContent.toLowerCase();
                row.style.display = name.includes(input) ? "" : "none";
            });
        }
    </script>
</head>
<body>

<%@ include file="AdminNavbar.jsp" %>

<div class="container">
    <h2>Item List</h2>
    <input type="text" id="searchInput" onkeyup="searchProducts()" placeholder="Search product name...">

    <table id="productTable">
        <thead>
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Qty</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM products");

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String quantity = rs.getString("quantity");
                    String price = rs.getString("price");
                    String image = rs.getString("image");
        %>
            <tr>
                <td><img src="<%= image %>" alt="Product Image"></td>
                <td><%= name %></td>
                <td><%= quantity %></td>
                <td>&#8377;<%= price %></td>
                <td>
                    <form action="<%= request.getContextPath() %>/DeleteProductServlet" method="POST">
                        <input type="hidden" name="productId" value="<%= id %>">
                        <button type="submit" class="btn-danger">Remove</button>
                    </form>
                </td>
            </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e + "</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
