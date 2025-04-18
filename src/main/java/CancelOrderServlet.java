import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CancelOrderServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");

            conn.setAutoCommit(false); // Start transaction

            // Step 1: Delete from order_items
            ps1 = conn.prepareStatement("DELETE FROM order_summary WHERE order_id = ?");
            ps1.setInt(1, orderId);
            ps1.executeUpdate();

            // Step 2: Delete from orders
            ps2 = conn.prepareStatement("DELETE FROM orders WHERE id = ?");
            ps2.setInt(1, orderId);
            ps2.executeUpdate();

            conn.commit(); // Commit transaction
        } catch (Exception e) {
            System.err.println("Error cancelling order: " + e.getMessage());
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback(); // Roll back in case of error
            } catch (Exception rollbackEx) {
                System.err.println("Rollback failed: " + rollbackEx.getMessage());
            }
        } finally {
            try {
                if (ps1 != null) ps1.close();
                if (ps2 != null) ps2.close();
                if (conn != null) conn.close();
            } catch (Exception closeEx) {
                System.err.println("Resource closing failed: " + closeEx.getMessage());
            }
        }

        // Redirect back to orders page
        response.sendRedirect("Order.jsp");
    }
}
