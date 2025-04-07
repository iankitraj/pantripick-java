<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Search Results</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="px-6 sm:px-16 lg:px-24 py-12">
  <%
    String query = request.getParameter("q");
    if (query == null || query.trim().isEmpty()) {
  %>
    <h2 class="text-xl font-semibold">Please enter a search term.</h2>
  <%
    } else {
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");

        String sql = "SELECT * FROM products WHERE name LIKE ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + query + "%");
        ResultSet rs = pstmt.executeQuery();

        boolean hasResults = false;
  %>
        <h2 class="text-xl font-semibold mb-6">Search results for "<%= query %>"</h2>
        <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-6">
        <%
          while (rs.next()) {
            hasResults = true;
        %>
          <div onclick="location.href='<%= (session.getAttribute("user") != null) ? "Details.jsp?id=" + rs.getInt("id") : "Login.jsp" %>'"
               class="border-gray-300 border rounded-lg p-4 shadow-md bg-white hover:shadow-lg transition duration-300 cursor-pointer">
            <div class="w-full h-36 sm:h-40 rounded-lg flex items-center justify-center bg-gray-100">
              <img class="max-h-32 sm:max-h-36 object-contain" src="<%= request.getContextPath() %>/<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>">
            </div>
            <p class="text-black text-sm font-medium mt-3 text-left"><%= rs.getString("name") %></p>
            <p class="text-gray-500 text-sm text-left">₹<%= rs.getDouble("price") %></p>
          </div>
        <%
          }

          if (!hasResults) {
        %>
          </div>
          <p class="text-gray-500">No results found for "<%= query %>"</p>
        <%
          }

          rs.close();
          pstmt.close();
          conn.close();
        } catch (Exception e) {
          out.println("<p class='text-red-500'>Error: " + e.getMessage() + "</p>");
        }
      }
  %>
</div>
</body>
</html>
