import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdStr = request.getParameter("id");
        if (productIdStr == null || productIdStr.isEmpty()) {
            response.sendRedirect("Pages/Cart.jsp"); // Redirect to cart if product ID is missing
            return;
        }

        int productId = Integer.parseInt(productIdStr);
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("Pages/Login.jsp"); // Redirect to login if user is not logged in
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

            // Check if the product already exists in the user's cart
            String checkSql = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, productId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // If the product exists, update the quantity
                int currentQuantity = rs.getInt("quantity");
                String updateSql = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setInt(1, currentQuantity + 1);
                updateStmt.setInt(2, userId);
                updateStmt.setInt(3, productId);
                updateStmt.executeUpdate();
                updateStmt.close();
            } else {
                // If the product does not exist, insert a new record
                String insertSql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, 1)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                insertStmt.setInt(1, userId);
                insertStmt.setInt(2, productId);
                insertStmt.executeUpdate();
                insertStmt.close();
            }

            rs.close();
            checkStmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page in case of exception
            return;
        }

        response.sendRedirect("Pages/Cart.jsp"); // Redirect to cart page after adding the product
    }
}
