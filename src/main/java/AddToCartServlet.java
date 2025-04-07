import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdStr = request.getParameter("productId");
        String quantityStr = request.getParameter("quantity");

        if (productIdStr == null || !productIdStr.matches("\\d+")) {
            response.sendRedirect("Pages/Cart.jsp");
            return;
        }

        int productId = Integer.parseInt(productIdStr);
        int quantity = 1;
        if (quantityStr != null && quantityStr.matches("\\d+")) {
            quantity = Integer.parseInt(quantityStr);
        }
        if (quantity <= 0) quantity = 1;

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("Pages/Login.jsp");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");

            String priceQuery = "SELECT price FROM products WHERE id = ?";
            stmt = conn.prepareStatement(priceQuery);
            stmt.setInt(1, productId);
            rs = stmt.executeQuery();

            if (!rs.next()) {
                response.sendRedirect("Pages/Cart.jsp");
                return;
            }

            double price = rs.getDouble("price");
            rs.close();
            stmt.close();

            String cartQuery = "INSERT INTO cart (user_id, product_id, quantity, price) VALUES (?, ?, ?, ?) " +
                    "ON DUPLICATE KEY UPDATE quantity = quantity + VALUES(quantity)";
            stmt = conn.prepareStatement(cartQuery);
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.setDouble(4, price);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }

        response.sendRedirect("Pages/Cart.jsp");
    }
}
