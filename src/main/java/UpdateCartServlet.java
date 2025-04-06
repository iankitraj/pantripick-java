

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
	private static final long serialVersionUID = 1L;
   
    public UpdateCartServlet() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("Pages/Login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");
        System.out.println("Action received: " + action);


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

            if ("increment".equals(action)) {
                String query = "UPDATE cart SET quantity = quantity + 1 WHERE user_id = ? AND product_id = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, userId);
                stmt.setInt(2, productId);
                stmt.executeUpdate();
                stmt.close();
            } 
            else if ("decrement".equals(action)) {
                // Pehle quantity check karo
                String checkQuery = "SELECT quantity FROM cart WHERE user_id = ? AND product_id = ?";
                PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
                checkStmt.setInt(1, userId);
                checkStmt.setInt(2, productId);
                var rs = checkStmt.executeQuery();
                
                if (rs.next() && rs.getInt("quantity") > 1) {  
                    // Agar quantity > 1 hai toh decrement karo
                    String query = "UPDATE cart SET quantity = quantity - 1 WHERE user_id = ? AND product_id = ?";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    stmt.setInt(1, userId);
                    stmt.setInt(2, productId);
                    stmt.executeUpdate();
                    stmt.close();
                } else {
                    // Agar quantity 1 hai toh item ko cart se remove karo
                    String deleteQuery = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
                    PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery);
                    deleteStmt.setInt(1, userId);
                    deleteStmt.setInt(2, productId);
                    deleteStmt.executeUpdate();
                    deleteStmt.close();
                }
                
                rs.close();
                checkStmt.close();
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("Pages/Cart.jsp");
    }
}
