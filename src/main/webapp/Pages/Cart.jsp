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
</head>
<body class="bg-gray-100">
<%@ include file="navbar.jsp" %>

<div class="px-6 sm:px-16 lg:px-24 py-10 flex justify-center">
    <div class="bg-white border border-gray-200 rounded-lg p-10 w-full max-w-4xl">
        <a href="Product.jsp" class="text-black flex items-center text-sm mb-6">
            ← Continue Shopping
        </a>

        <div class="relative inline-block mb-6">
            <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block">
                YOUR <span class="font-bold">CART</span>
            </h2>
            <span class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
        </div>

        <%
            int userId = (Integer) session.getAttribute("user_id");
            double total = 0;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");

                String query = "SELECT p.name, p.image, c.product_id, p.price, c.quantity FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();

                List<Map<String, Object>> cartItems = new ArrayList<>();
                while (rs.next()) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("product_id", rs.getInt("product_id"));
                    item.put("name", rs.getString("name"));
                    item.put("image", rs.getString("image"));
                    item.put("price", rs.getDouble("price"));
                    item.put("quantity", rs.getInt("quantity"));
                    cartItems.add(item);
                    total += rs.getDouble("price") * rs.getInt("quantity");
                }

                rs.close();
                stmt.close();
                conn.close();

                if (cartItems.isEmpty()) {
        %>
            <p class="text-gray-500 text-center">Your cart is empty.</p>
        <%
                } else {
        %>
            <div class="border border-gray-200 rounded-lg overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="border-b border-gray-200">
                            <th class="p-3">Product</th>
                            <th class="p-3">Price</th>
                            <th class="p-3">Quantity</th>
                            <th class="p-3">Cost</th>
                            <th class="p-3">Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% for (Map<String, Object> item : cartItems) {
                        int pid = (Integer) item.get("product_id");
                        double price = (Double) item.get("price");
                        int qty = (Integer) item.get("quantity");
                        String image = (String) item.get("image");
                        String name = (String) item.get("name");
                    %>
                        <tr class="border-b border-gray-200">
                            <td class="p-3 flex items-center">
                                <img src="<%= request.getContextPath() + "/" + image %>" alt="<%= name %>" class="w-12 h-12 mr-4 object-cover rounded" />
                                <%= name %>
                            </td>
                            <td class="p-3">₹<%= price %></td>
                            <td class="p-3">
                                <form action="<%= request.getContextPath() %>/UpdateCartServlet" method="POST" style="display:inline;">
                                    <input type="hidden" name="productId" value="<%= pid %>">
                                    <input type="hidden" name="action" value="decrement">
                                    <button class="px-2 border border-gray-300 rounded" type="submit">-</button>
                                </form>
                                <span class="mx-2"><%= qty %></span>
                                <form action="<%= request.getContextPath() %>/UpdateCartServlet" method="POST" style="display:inline;">
                                    <input type="hidden" name="productId" value="<%= pid %>">
                                    <input type="hidden" name="action" value="increment">
                                    <button class="px-2 border border-gray-300 rounded" type="submit">+</button>
                                </form>
                            </td>
                            <td class="p-3">₹<%= price * qty %></td>
                            <td class="p-3">
                                <form action="<%= request.getContextPath() %>/RemoveFromCartServlet" method="POST">
                                    <input type="hidden" name="productId" value="<%= pid %>">
                                    <button class="text-red-600 hover:underline">Remove</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            <div class="mt-4 text-right text-lg font-semibold">
                Total Amount: ₹<%= String.format("%.2f", total) %>
            </div>

            <div class="text-right mt-4">
                <a href="Checkout.jsp" class="mt-6 px-4 py-2 border border-green-600 text-green-600 hover:bg-green-600 hover:text-white rounded transition">
                    Proceed to Checkout
                </a>
            </div>
        <%
                }
            } catch (Exception e) {
                out.println("<p>Error loading cart</p>");
                e.printStackTrace();
            }
        %>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
