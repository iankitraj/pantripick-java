

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
@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("Pages/Login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456")) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String deleteQuery = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(deleteQuery)) {
                stmt.setInt(1, userId);
                stmt.setInt(2, productId);
                stmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("Pages/Cart.jsp");
    }
}
