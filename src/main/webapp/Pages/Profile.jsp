<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
  <body class="bg-gray-100">
  <%@ include file="navbar.jsp" %>
    <div class="px-4 sm:px-[5vw] md:px-[7vw] lg:px-[9vw]">

<%
    Integer userId = (Integer) session.getAttribute("user_id");
    String userName = (String) session.getAttribute("user_name");
    String userEmaill = (String) session.getAttribute("user_email");

    if (userId == null) {
%>
    <div class="max-w-3xl mx-auto py-10 px-6">
        <p class="text-red-600 text-lg font-semibold">⚠️ Please log in to view your past orders.</p>
    </div>
<%
    } else {
        Connection conn = null;
        PreparedStatement psOrders = null;
        ResultSet rsOrders = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");

            String query = "SELECT os.order_id, os.recipient_name, os.address, os.phone, os.email, o.total_cost, o.timestamp " +
                           "FROM order_summary os JOIN orders o ON os.order_id = o.id " +
                           "WHERE os.user_id = ? ORDER BY o.timestamp DESC";

            psOrders = conn.prepareStatement(query);
            psOrders.setInt(1, userId);
            rsOrders = psOrders.executeQuery();

            boolean hasOrders = false;
%>

<div class="px-6 sm:px-16 lg:px-24 py-12">
    <a href="Home.jsp" class="text-black flex items-center text-sm mb-4 hover:underline">
        <span class="mr-2 text-xl">←</span> Back to Home
    </a>

    <div class="relative inline-block mb-5">
        <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block">
            USER <span class="font-bold">PROFILE</span>
        </h2>
        <span class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
    </div>

    <div class="mb-6 text-gray-700">
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between mb-2">
        <div>
            <p><strong>Name:</strong> <%= userName %></p>
            <p><strong>Email:</strong> <%= userEmail %></p>
        </div>
        <div class="mt-4 sm:mt-0 space-x-2">
            <a href="EditProfile.jsp" class="inline-block px-4 py-2 bg-yellow-500 text-white rounded-lg hover:bg-yellow-600 text-sm">Edit Profile</a>
            <form action="DeleteAccountServlet" method="post" style="display:inline;">
                <button type="submit" class="inline-block px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 text-sm">Delete Account</button>
            </form>
        </div>
    </div>
</div>


    <h3 class="text-black text-xl font-semibold mt-6">Past Orders</h3>

<%
            while (rsOrders.next()) {
                hasOrders = true;
                int orderId = rsOrders.getInt("order_id");
                String recipient = rsOrders.getString("recipient_name");
                String address = rsOrders.getString("address");
                String phone = rsOrders.getString("phone");
                String email = rsOrders.getString("email");
                double totalCost = rsOrders.getDouble("total_cost");
                Timestamp timestamp = rsOrders.getTimestamp("timestamp");
%>

    <div class="border border-gray-300 rounded-lg p-4 shadow-md mt-6">
        <p class="text-black font-semibold">Order ID: <%= orderId %></p>
        <p class="text-gray-600 text-sm mb-2">Date: <%= new java.text.SimpleDateFormat("dd MMM yyyy").format(timestamp) %></p>
        <p class="text-gray-700"><strong>Recipient:</strong> <%= recipient %></p>
        <p class="text-gray-700"><strong>Phone:</strong> <%= phone %></p>
        <p class="text-gray-700"><strong>Email:</strong> <%= email %></p>
        <p class="text-gray-700"><strong>Address:</strong> <%= address %></p>
        <p class="text-gray-700"><strong>Total Cost:</strong> ₹<%= totalCost %></p>

        <h4 class="mt-4 text-gray-800 font-semibold">Items:</h4>
        <ul class="list-disc list-inside text-gray-700 mt-2">
<%
                String itemQuery = "SELECT oi.product_id, p.name, oi.quantity, oi.price FROM order_items oi JOIN products p ON oi.product_id = p.id WHERE oi.order_id = ?";
                try (PreparedStatement psItems = conn.prepareStatement(itemQuery)) {
                    psItems.setInt(1, orderId);
                    try (ResultSet rsItems = psItems.executeQuery()) {
                        while (rsItems.next()) {
                            String productName = rsItems.getString("name");
                            int quantity = rsItems.getInt("quantity");
                            double price = rsItems.getDouble("price");
%>
            <li><%= productName %> (x<%= quantity %>) - ₹<%= price * quantity %></li>
<%
                        }
                    }
                }
%>
        </ul>
        <p class="text-blue-600 font-semibold text-sm mt-2">Status: Confirmed</p>
    </div>

<%
            }

            if (!hasOrders) {
%>
    <p class="text-gray-500 mt-6">📭 No past orders found.</p>
<%
            }

        } catch (Exception e) {
%>
    <p class="text-red-600 font-semibold mt-6">❌ Error: <%= e.getMessage() %></p>
<%
        } finally {
            try {
                if (rsOrders != null) rsOrders.close();
                if (psOrders != null) psOrders.close();
                if (conn != null) conn.close();
            } catch (Exception e) {}
        }
    }
%>
</div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>
