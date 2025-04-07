<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %> <!-- Include header if applicable -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

    <div class="flex-grow flex justify-center px-6 sm:px-16 lg:px-24 py-16">
        <div class="bg-white border border-gray-200 rounded-lg p-10 w-full max-w-5xl min-h-[550px] flex flex-col">
            <a href="Product.jsp" class="text-black flex items-center text-sm mb-6">
                &#8592; Continue Shopping
            </a>

            <%
                int productId = Integer.parseInt(request.getParameter("id"));
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");
                    String sql = "SELECT * FROM products WHERE id = ?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, productId);
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
            %>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-10 items-center flex-grow">
                <div class="flex justify-center">
                    <img src="<%= request.getContextPath() %>/<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>" class="w-60 sm:w-80 rounded-md" />
                </div>

                <div>
                    <h2 class="text-black text-2xl sm:text-3xl font-semibold"><%= rs.getString("name") %></h2>
                    <p class="text-gray-600 text-sm mt-2">Quantity: <%= rs.getString("quantity") %></p>
                    <p class="text-gray-700 mt-4"><%= rs.getString("description") %></p>

                    <div class="flex items-center justify-between mt-4">
                        <p class="text-black font-bold text-lg">₹<%= rs.getDouble("price") %></p>
                        <p class="text-black font-bold text-lg">Select Quantity</p>
                    </div>

                    <div class="flex items-center justify-between">
                        <p class="text-gray-500 text-sm">(Inclusive of all taxes)</p>
                        <p class="text-gray-500 text-sm">6 Packets</p>
                    </div>

                    <form action="<%= request.getContextPath() %>/AddToCartServlet" method="POST" class="flex items-center mt-6 justify-between">
                        <input type="hidden" name="productId" value="<%= rs.getInt("id") %>">

                        <div class="flex items-center border border-gray-300 rounded">
                            <button type="button" onclick="decreaseQuantity()" class="px-3 py-2">-</button>
                            <input type="text" id="quantityInput" name="quantity" value="1" class="w-12 text-center border-x border-gray-300" readonly>
                            <button type="button" onclick="increaseQuantity()" class="px-3 py-2">+</button>
                        </div>

                        <button type="submit" class="px-5 py-2 border border-green-600 text-green-600 hover:bg-green-600 hover:text-white rounded transition">
                            Add to Cart
                        </button>
                    </form>
                </div>
            </div>

            <%
                    }
                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>

<%@ include file="footer.jsp" %> <!-- Include footer if applicable -->

<script>
function increaseQuantity() {
    const input = document.getElementById("quantityInput");
    input.value = parseInt(input.value) + 1;
}

function decreaseQuantity() {
    const input = document.getElementById("quantityInput");
    let value = parseInt(input.value);
    if (value > 1) input.value = value - 1;
}
</script>

</body>
</html>
