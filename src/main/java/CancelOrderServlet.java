

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

        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");
            
            // Step 1: Delete from order_items table
            PreparedStatement ps1 = conn.prepareStatement("DELETE FROM order_items WHERE order_id = ?");
            ps1.setInt(1, orderId);
            ps1.executeUpdate();

            // Step 2: Delete from orders table
            PreparedStatement ps2 = conn.prepareStatement("DELETE FROM orders WHERE id = ?");
            ps2.setInt(1, orderId);
            ps2.executeUpdate();

            conn.close();
        } catch (Exception e) {
            System.err.println("Error cancelling order: " + e.getMessage());
            e.printStackTrace();
        }

        // Redirect back to order list
        response.sendRedirect("Order.jsp");
	}
}
