<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Products</title>
    <script src="https://cdn.tailwindcss.com"></script>
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

    <script>
    // WebSocket Connection to get real-time product updates
    const socket = new WebSocket("ws://localhost:8080/PantriPick/ProductWebSocket");

    // When a new product is added via WebSocket, update the UI
    socket.onmessage = function(event) {
        const product = JSON.parse(event.data);
        const productContainer = document.createElement("div");
        productContainer.classList.add("bg-white", "p-4", "rounded-lg", "shadow-md", "text-center", "transform", "transition", "hover:scale-105");

        productContainer.innerHTML = `
            <img src="${product.image}" alt="${product.name}" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg">
            <p class="mt-2">${product.name}</p>
            <p class="font-semibold">₹${product.price}</p>
            <a href="${(sessionStorage.getItem('user')) ? 'Details.jsp?id=' + product.id : 'Login.jsp'}" 
               class="mt-2 inline-block px-4 py-2 bg-blue-500 text-white rounded-lg">
               View Details
            </a>
        `;

        document.querySelector(".product-grid").appendChild(productContainer);
    };
    </script>

</head>

<body class="bg-gray-100">
    <%@ include file="navbar.jsp" %>
    <div class="px-4 sm:px-[5vw] md:px-[7vw] lg:px-[9vw]">
        <div class="px-6 sm:px-16 lg:px-24 py-16 fade-in">
            <div class="relative inline-block py-3">
                <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block fade-in">
                    PRODUCTS <span class="font-bold">AVAILABLE</span>
                </h2>
                <span class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
            </div>
            
            <h5 class="text-xl font-bold mt-8 fade-in">Dairy, Bread & Eggs</h5>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6 mt-4 fade-in product-grid">
                <%
                    try {
                        // Step 1: Database Connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

                        // Step 2: Fetch Products from Database
                        String sql = "SELECT * FROM products";
                        PreparedStatement pstmt = conn.prepareStatement(sql);
                        ResultSet rs = pstmt.executeQuery();

                        // Step 3: Loop through database results and display products
                        while (rs.next()) {
                %>
                            <div class="bg-white p-4 rounded-lg shadow-md text-center transform transition hover:scale-105">
                                <img src="<%= request.getContextPath() %>/<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>" class="w-36 h-36 object-contain mx-auto bg-gray-200 rounded-lg">
                                <p class="mt-2"><%= rs.getString("name") %></p>
                                <p class="font-semibold">₹<%= rs.getDouble("price") %></p>
                                <a href="<%= (session.getAttribute("user") != null) ? "Details.jsp?id=" + rs.getInt("id") : "Login.jsp" %>" 
                                   class="mt-2 inline-block px-4 py-2 bg-blue-500 text-white rounded-lg">
                                   View Details
                                </a>
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
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>