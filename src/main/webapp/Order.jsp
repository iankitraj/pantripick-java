<%@ page import="java.util.*, java.sql.*, com.pantripick.Order, com.pantripick.OrderDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");

    OrderDAO orderDAO = new OrderDAO(conn);
    List<Order> orders = orderDAO.getAllOrders();
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100">

<!-- Admin Navbar -->
<div class="navbar">
    <%@ include file="AdminNavbar.jsp" %>
</div>

<div class="px-6 sm:px-16 lg:px-24 py-10 flex justify-center">
    <div class="bg-white border border-gray-200 rounded-lg p-10 w-full max-w-5xl">

        <div class="relative inline-block mb-6">
            <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block">
                ALL <span class="font-bold">ORDERS</span>
            </h2>
            <span class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
        </div>

        <%
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
        %>
        <div class="border border-gray-200 rounded-lg mb-6 overflow-x-auto">
            <div class="p-4 border-b border-gray-200 bg-gray-50">
                <p class="text-sm text-gray-700">
                    <span class="font-semibold">Recipient:</span> <%= order.getRecipient() %>
                </p>
                <p class="text-sm text-gray-700">
                    <span class="font-semibold">Order ID:</span> <%= order.getOrderId() %>
                </p>
                <p class="text-sm text-gray-700">
                    <span class="font-semibold">Phone:</span> <%= order.getPhone() %>
                </p>
                <p class="text-sm text-gray-700">
                    <span class="font-semibold">Email:</span> <%= order.getEmail() %>
                </p>
                <p class="text-sm text-gray-700">
                    <span class="font-semibold">Address:</span> <%= order.getAddress() %>
                </p>
                <p class="text-sm text-gray-700">
                    <span class="font-semibold">Date:</span> <%= order.getTimestamp() %>
                </p>
            </div>

            <table class="w-full text-left">
                <thead>
                    <tr class="border-b border-gray-200">
                        <th class="p-3">Total Items</th>
                        <th class="p-3">Total Cost</th>
                        <th class="p-3">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="border-b border-gray-100">
                        <td class="p-3"><%= order.getTotalItems() %></td>
                        <td class="p-3">₹<%= String.format("%.2f", order.getTotalCost()) %></td>
                        <td class="p-3">
                            <form action="<%= request.getContextPath() %>/CancelOrderServlet" method="POST">
                                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                                <button type="submit"
                                    class="text-red-600 hover:underline text-sm focus:outline-none">
                                    Remove Order
                                </button>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <% 
                }
            } else {
        %>
        <p class="text-gray-500 text-center">No past orders found.</p>
        <% } %>

    </div>
</div>

</body>
</html>
