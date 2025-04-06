<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("Pages/Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 0.8s ease-out forwards;
        }
        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body class="bg-gray-100">
<%@ include file="navbar.jsp" %>

<div class="px-6 md:px-24 py-12 fade-in">
    <h2 class="text-3xl font-bold mb-6 flex items-center">
        <img src="<%= request.getContextPath() %>/Image/shopping-cart.png" width="30" class="me-2" />
        YOUR CART
    </h2>

    <%
        int userId = (Integer) session.getAttribute("user_id");
        double total = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

            String query = "SELECT c.id AS cart_id, p.name, p.image, p.price, c.quantity, p.id AS product_id FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            boolean hasItems = false;
    %>
    <div class="grid gap-6">
    <%
            while (rs.next()) {
                hasItems = true;
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                double itemTotal = price * quantity;
                total += itemTotal;
    %>
        <div class="bg-white p-4 rounded-lg shadow-md flex items-center justify-between">
            <div class="flex items-center gap-4">
                <img src="<%= request.getContextPath() %>/<%= rs.getString("image") %>" width="80" class="rounded-md border">
                <div>
                    <p class="font-bold text-lg"><%= rs.getString("name") %></p>
                    <p class="text-gray-600">₹<%= price %> x <%= quantity %> = ₹<%= itemTotal %></p>
                    <div class="flex mt-2 gap-2 items-center">
                        <!-- Decrement Button -->
                        <form action="<%= request.getContextPath() %>/UpdateCartServlet" method="POST">
                            <input type="hidden" name="productId" value="<%= rs.getInt("product_id") %>">
                            <input type="hidden" name="action" value="decrement">
                            <button class="px-2 bg-gray-300 text-black rounded hover:bg-gray-400">-</button>
                        </form>
                        <span class="px-2"><%= quantity %></span>
                        <!-- Increment Button -->
                        <form action="<%= request.getContextPath() %>/UpdateCartServlet" method="POST">
                            <input type="hidden" name="productId" value="<%= rs.getInt("product_id") %>">
                            <input type="hidden" name="action" value="increment">
                            <button class="px-2 bg-gray-300 text-black rounded hover:bg-gray-400">+</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Remove Button -->
            <form action="<%= request.getContextPath() %>/RemoveFromCartServlet" method="POST">
                <input type="hidden" name="productId" value="<%= rs.getInt("product_id") %>">
                <button class="text-red-500 hover:text-red-700">
                    <i class="bi bi-trash3-fill text-xl"></i>
                </button>
            </form>
        </div>
    <%
            }

            if (!hasItems) {
    %>
        <p class="text-lg text-gray-700">Your cart is empty.</p>
    <%
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </div>

    <%
        if (total > 0) {
    %>
        <div class="mt-8 flex justify-between items-center border-t pt-6">
            <!-- Continue Shopping -->
            <a href="Product.jsp" class="px-5 py-2 bg-gray-400 text-white rounded-lg hover:bg-gray-500">
                ← Continue Shopping
            </a>
            <h3 class="text-xl font-semibold">Total: ₹<%= total %></h3>
            <!-- Checkout Button -->
            <a href="Checkout.jsp" class="px-5 py-2 bg-white text-green-600 border border-green-600 rounded-lg hover:bg-green-100">
                Proceed to Checkout
            </a>
        </div>
    <%
        }
    %>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
