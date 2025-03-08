<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AllOrders - PantriPick Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">

    <style>
        /* Background Image */
        body {
            font-family: Arial, sans-serif;
            background: url('Image/orders-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        /* Overlay for better readability */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
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

        /* Orders container */
        .container {
            background: rgba(255, 255, 255, 0.9);
            color: black;
            border-radius: 20px;
            padding: 30px;
            margin: 50px auto;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            width: 90%;
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
            text-transform: uppercase;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            animation: slideIn 0.8s ease-in-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ddd;
            transition: all 0.3s ease-in-out;
        }

        th {
            font-weight: bold;
            background: rgba(0, 0, 0, 0.05);
        }

        tr:hover {
            background-color: rgba(0, 0, 0, 0.1);
            transform: scale(1.01);
        }

        /* Cancel button */
        .cancel-btn {
            background-color: #ff4d4d;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            border: none;
            font-size: 14px;
            transition: all 0.3s ease-in-out;
        }

        .cancel-btn:hover {
            background-color: darkred;
            transform: scale(1.1);
            box-shadow: 0 4px 10px rgba(255, 77, 77, 0.5);
        }

        .cancel-btn:active {
            background-color: #b30000;
            transform: scale(0.95);
        }
    </style>
</head>
<body>
    <% request.setAttribute("pageName", "All Orders"); %>
    <%-- Include the AdminNavbar.jsp file --%>
    <jsp:include page="AdminNavbar.jsp" />

    <%-- Orders Container --%>
    <div class="container">
        <h2>All Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Items</th>
                    <th>Quantity</th>
                    <th>Cost</th>
                    <th>Recipient</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- Example Order Data --%>
                <%
                    // Mock orders data (replace with backend data in production)
                    String[][] orders = {
                        {"OD001", "Amul Cheese Block - Qty: 1<br>Quaker Rolled Oats - Qty: 2", "3", "₹720", "Rishabh"},
                        {"OD002", "Amul Cheese Block - Qty: 1<br>Quaker Rolled Oats - Qty: 2", "2", "₹57", "Ankit"},
                        {"OD003", "Amul Cheese Block - Qty: 1<br>Quaker Rolled Oats - Qty: 2", "4", "₹40", "Shailendra"},
                        {"OD004", "Amul Cheese Block - Qty: 1<br>Quaker Rolled Oats - Qty: 2", "1", "₹50", "Lakshya"},
                        {"OD005", "Amul Cheese Block - Qty: 1<br>Quaker Rolled Oats - Qty: 1", "3", "₹70", "Raj"},
                        {"OD006", "Amul Cheese Block - Qty: 1<br>Quaker Rolled Oats - Qty: 2", "1", "₹20", "Anu"}	
                    };

                    for (String[] order : orders) {
                %>
                <tr>
                    <td><%= order[0] %></td>
                    <td><%= order[1] %></td>
                    <td>Total Items: <%= order[2] %></td>
                    <td><%= order[3] %></td>
                    <td><%= order[4] %></td>
                    <td><button class="cancel-btn">Cancel</button></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
