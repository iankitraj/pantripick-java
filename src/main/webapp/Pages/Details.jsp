<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background-color: #f8f9fa;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}
.product-container {
    max-width: 900px;
    background: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}
.product-title {
    display: flex;
    align-items: center;
    font-weight: bold;
    font-size: 24px;
}
.product-title::after {
    content: "";
    flex-grow: 1;
    height: 2px;
    background-color: black;
    margin-left: 10px;
}
.product-card {
    display: flex;
    align-items: center;
    gap: 20px;
    background: #fff;
    padding: 20px;
}
.product-image {
    width: 250px;
    border-radius: 8px;
}
.product-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
}
.add-cart-btn {
    border-radius: 7px;
    height: 35px;
    width: 120px;
}
</style>
</head>
<body>
    <div class="product-container">
        <div class="product-title">
            <span style="font-weight: 100;">PRODUCT&nbsp;</span><span style="font-weight: bold;">DETAILS</span>
        </div>
        <div class="product-card mt-3">
            <%
                int productId = Integer.parseInt(request.getParameter("id"));
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");
                    String sql = "SELECT * FROM products WHERE id = ?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, productId);
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
            %>
            <img src="<%= request.getContextPath() %>/<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>" class="product-image">
            <div class="w-100">
                <h4 class="fw-bold"><%= rs.getString("name") %></h4>
                <p><strong>Quantity:</strong> <%= rs.getString("quantity") %></p>
                <p><strong>Description:</strong><br><%= rs.getString("description") %></p>
                <div class="product-footer">
                    <p class="m-0"><strong>₹<%= rs.getDouble("price") %></strong> (Inclusive of all taxes)</p>
                    <form action="<%= request.getContextPath() %>/AddToCartServlet" method="POST">
                        <input type="hidden" name="productId" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="add-cart-btn btn btn-outline-primary">Add to Cart</button>
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
</body>
</html>
