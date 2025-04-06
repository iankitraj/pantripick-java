<%@ page import="java.util.*, java.sql.*, com.pantripick.Order, com.pantripick.OrderDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %> <!-- Yeh add kiya hai ₹ sahi dikhane ke liye -->
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

    OrderDAO orderDAO = new OrderDAO(conn);
    List<Order> orders = orderDAO.getAllOrders();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Orders</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f0f0f0;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* Removed background big text (body::before) */

        .navbar {
            position: relative;
            z-index: 2;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            color: #333;
            border-radius: 20px;
            padding: 30px;
            margin: 100px auto 50px auto;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            width: 90%;
            position: relative;
            z-index: 1;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 32px;
            color: #222;
            letter-spacing: 2px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            animation: slideIn 1s ease-in-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        th, td {
            text-align: left;
            padding: 14px 20px;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        th {
            background: #f8f8f8;
            font-weight: 600;
            color: #555;
        }

        tr:hover {
            background-color: #f2f2f2;
            transition: background 0.3s;
        }

        .cancel-btn {
            padding: 8px 18px;
            background: linear-gradient(135deg, #ff4b2b, #ff416c);
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .cancel-btn:hover {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            transform: scale(1.05);
        }

        .no-orders {
            text-align: center;
            padding: 50px;
            font-size: 18px;
            color: #777;
        }
    </style>
</head>
<body>

<!-- Admin Navbar Import -->
<div class="navbar">
    <%@ include file="AdminNavbar.jsp" %>
</div>

<div class="container">
    <h2>All Orders</h2>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Recipient</th>
                <th>Total Items</th>
                <th>Total Cost</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <% 
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) { 
        %>
            <tr>
                <td><%= order.getOrderId() %></td>
                <td><%= order.getRecipient() %></td>
                <td><%= order.getTotalItems() %></td>
                <td>₹<%= String.format("%.2f", order.getTotalCost()) %></td>
                <td>
                    <form action="<%= request.getContextPath() %>/CancelOrderServlet" method="POST">
                        <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                        <button type="submit" class="cancel-btn">Cancel</button>
                    </form>
                </td>
            </tr>
        <% 
                }
            } else { 
        %>
            <tr>
                <td colspan="5" class="no-orders">No Orders Found</td>
            </tr>
        <% 
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
