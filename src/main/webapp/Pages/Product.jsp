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
    .scrollbar-hide::-webkit-scrollbar {
      display: none;
    }
    .scrollbar-hide {
      -ms-overflow-style: none;
      scrollbar-width: none;
    }
  </style>
  <script>
    function scrollCategory(catId, dir) {
      const container = document.getElementById('scroll-' + catId);
      container.scrollBy({ left: dir * 300, behavior: 'smooth' });
    }
  </script>
</head>
<body class="bg-gray-100">
<%@ include file="navbar.jsp" %>

<div class="px-6 sm:px-16 lg:px-24 py-12">
  <div class="relative inline-block mb-6">
    <h2 class="text-black text-2xl sm:text-3xl font-normal inline-block">
      PRODUCTS <span class="font-bold">AVAILABLE</span>
    </h2>
    <span class="absolute left-full top-1/2 -translate-y-1/2 ml-3 w-16 border-t-2 border-black"></span>
  </div>

  <%
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");
      String sql = "SELECT * FROM products ORDER BY category";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();

      java.util.Map<String, java.util.List<java.util.Map<String, Object>>> groupedProducts = new java.util.HashMap<>();

      while (rs.next()) {
        String category = rs.getString("category");
        if (!groupedProducts.containsKey(category)) {
          groupedProducts.put(category, new java.util.ArrayList<>());
        }

        java.util.Map<String, Object> product = new java.util.HashMap<>();
        product.put("id", rs.getInt("id"));
        product.put("name", rs.getString("name"));
        product.put("price", rs.getDouble("price"));
        product.put("image", rs.getString("image"));

        groupedProducts.get(category).add(product);
      }

      int catIndex = 0;
      for (String category : groupedProducts.keySet()) {
  %>
    <div class="mb-10">
      <h3 class="text-black text-base sm:text-lg font-medium mt-5 mb-4"><%= category %></h3>

      <div class="relative">
        <button onclick="scrollCategory('<%= catIndex %>', -1)" class="absolute left-0 top-1/2 -translate-y-1/2 p-2 z-10 bg-white shadow rounded-full">
          &#8592;
        </button>

        <div id="scroll-<%= catIndex %>" class="overflow-x-auto flex space-x-4 scrollbar-hide scroll-smooth px-8">
          <%
            for (java.util.Map<String, Object> p : groupedProducts.get(category)) {
          %>
          <div onclick="location.href='<%= (session.getAttribute("user") != null) ? "Details.jsp?id=" + p.get("id") : "Login.jsp" %>'"
               class="border-gray-300 border rounded-lg p-4 shadow-md w-40 sm:w-48 flex-shrink-0 cursor-pointer bg-white hover:shadow-lg transition duration-300">
            <div class="w-full h-36 sm:h-40 rounded-lg flex items-center justify-center bg-gray-100">
              <img class="max-h-32 sm:max-h-36 object-contain" src="<%= request.getContextPath() %>/<%= p.get("image") %>" alt="<%= p.get("name") %>">
            </div>
            <p class="text-black text-xs sm:text-sm font-medium mt-3 text-left"><%= p.get("name") %></p>
            <p class="text-gray-500 text-xs sm:text-sm text-left">₹<%= p.get("price") %></p>
          </div>
          <% } %>
        </div>

        <button onclick="scrollCategory('<%= catIndex %>', 1)" class="absolute right-0 top-1/2 -translate-y-1/2 p-2 z-10 bg-white shadow rounded-full">
          &#8594;
        </button>
      </div>
    </div>
  <%
        catIndex++;
      }

      rs.close();
      pstmt.close();
      conn.close();
    } catch (Exception e) {
      e.printStackTrace();
  %>
    <div class="text-red-500">Failed to load products: <%= e.getMessage() %></div>
  <%
    }
  %>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
