<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>

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
    <title>Checkout</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<%@ include file="navbar.jsp" %>
<div class="max-w-3xl mx-auto p-6 bg-white mt-6 mb-10 rounded-2xl shadow-md">
    <a href="Cart.jsp" class="text-sm flex items-center mb-4 hover:underline">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
        </svg>
        Back to Cart
    </a>

    <h2 class="text-3xl font-light mb-4 tracking-tight relative inline-block">
        CHECK <span class="font-bold">OUT</span>
        <span class="absolute top-1/2 -right-20 w-16 h-0.5 bg-gray-900 transform -translate-y-1/2"></span>
    </h2>

    <p class="text-lg font-semibold mt-4 mb-6">Total Amount: <span class="text-green-600 font-bold">₹<%= total %></span></p>

    <form action="<%= request.getContextPath() %>/PlaceOrderServlet" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <input type="text" name="firstName" placeholder="First Name" required class="border rounded-xl p-3 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <input type="text" name="lastName" placeholder="Last Name" required class="border rounded-xl p-3 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <input type="text" name="phone" placeholder="Phone number" required class="border rounded-xl p-3 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <input type="email" name="email" placeholder="Email address" required class="border rounded-xl p-3 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <input type="text" name="address1" placeholder="Address Line 1" required class="border rounded-xl p-3 md:col-span-2 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <input type="text" name="address2" placeholder="Address Line 2 (Optional)" class="border rounded-xl p-3 md:col-span-2 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <input type="text" name="city" placeholder="City" required class="border rounded-xl p-3 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <input type="text" name="state" placeholder="State" required class="border rounded-xl p-3 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <input type="text" name="pincode" placeholder="PIN Code" required class="border rounded-xl p-3 md:col-span-2 focus:outline-none focus:ring-2 focus:ring-green-500" />
        <div class="md:col-span-2 text-right">
            <button type="submit" class="px-6 py-2 text-green-600 border-2 border-green-600 rounded-xl hover:bg-green-600 hover:text-white transition-all font-semibold">
                Place Order
            </button>
        </div>
    </form>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>
