<%@ page import="java.sql.*, java.util.*" %>
<%
    Integer userId = (Integer) session.getAttribute("user_id");

    if (userId == null) {
%>
    <p style="color: red;">⚠️ Please log in to view your past orders.</p>
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

<div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; border-radius: 10px;">
    <h3>🧾 Order ID: <%= orderId %></h3>
    <p><strong>Date:</strong> <%= timestamp %></p>
    <p><strong>Recipient:</strong> <%= recipient %></p>
    <p><strong>Phone:</strong> <%= phone %> | <strong>Email:</strong> <%= email %></p>
    <p><strong>Address:</strong> <%= address %></p>
    <p><strong>Total Cost:</strong> ₹<%= totalCost %></p>

    <h4>🛍️ Items:</h4>
    <ul>
<%
                // Fetch items for this order
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
</div>

<%
            } // end while

            if (!hasOrders) {
%>
    <p style="color: gray;">📭 No orders found.</p>
<%
            }

        } catch (Exception e) {
            out.println("<p style='color:red;'>❌ Error: " + e.getMessage() + "</p>");
        } finally {
            try { if (rsOrders != null) rsOrders.close(); if (psOrders != null) psOrders.close(); if (conn != null) conn.close(); } catch (Exception e) { }
        }
    }
%>
