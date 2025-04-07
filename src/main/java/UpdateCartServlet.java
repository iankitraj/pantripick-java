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

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("Pages/Login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456")) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String updateQuery = switch (action) {
                case "increment" -> "UPDATE cart SET quantity = quantity + 1 WHERE user_id = ? AND product_id = ?";
                case "decrement" -> "UPDATE cart SET quantity = quantity - 1 WHERE user_id = ? AND product_id = ? AND quantity > 1";
                default -> null;
            };

            if (updateQuery != null) {
                try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
                    stmt.setInt(1, userId);
                    stmt.setInt(2, productId);
                    stmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("Pages/Cart.jsp");
    }
}

