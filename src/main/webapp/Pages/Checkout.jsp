<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("Pages/Login.jsp");
        return;
    }

    int userId = (Integer) session.getAttribute("user_id");
    double total = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

        String query = "SELECT p.price, c.quantity FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");
            total += price * quantity;
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Checkout</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet"
    />
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .checkout-container {
            max-width: 650px;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .checkout-title {
            display: flex;
            align-items: center;
            font-size: 22px;
            font-weight: bold;
        }
        .checkout-title::after {
            content: '';
            flex-grow: 1;
            height: 2px;
            background-color: black;
            margin-left: 10px;
        }
        .form-control {
            border: 1px solid #ffcc00;
            border-radius: 6px;
        }
        .form-control:focus {
            border-color: #ff9900;
            box-shadow: 0 0 5px rgba(255, 153, 0, 0.5);
        }
        .place-order-btn {
            background-color: #28a745;
            color: white;
            border: 1px solid #28a745;
            border-radius: 6px;
            padding: 8px 15px;
            font-weight: bold;
        }
        .place-order-btn:hover {
            background-color: #218838;
        }
        .back-to-cart {
            text-decoration: none;
            color: #155724;
            font-weight: bold;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="checkout-container">
    <a href="Cart.jsp" class="back-to-cart">← Go Back to Cart</a>

    <div class="checkout-title mt-2">
        CHECK <span style="font-weight: bold">OUT</span>
    </div>

    <p class="fw-bold mt-3">Total Amount to be paid: ₹<%= total %></p>

    <form action="<%= request.getContextPath() %>/PlaceOrderServlet" method="POST">
        <div class="row g-3">
            <div class="col-md-6">
                <input type="text" class="form-control" name="firstName" placeholder="First Name" required />
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control" name="lastName" placeholder="Last Name" required />
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control" name="phone" placeholder="Phone number" required />
            </div>
            <div class="col-md-6">
                <input type="email" class="form-control" name="email" placeholder="Email address" required />
            </div>
            <div class="col-12">
                <input type="text" class="form-control" name="address1" placeholder="Address Line 1" required />
            </div>
            <div class="col-12">
                <input type="text" class="form-control" name="address2" placeholder="Address Line 2" />
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control" name="city" placeholder="City" required />
            </div>
            <div class="col-md-6">
                <input type="text" class="form-control" name="state" placeholder="State" required />
            </div>
            <div class="col-12">
                <input type="text" class="form-control" name="pincode" placeholder="PIN Code" required />
            </div>
            <div class="col-12 text-end">
                <button type="submit" class="place-order-btn">Place Order</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
