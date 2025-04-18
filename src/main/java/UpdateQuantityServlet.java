import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateQuantityServlet")
public class UpdateQuantityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pantripick", "root", "123456");

            // Fetch current quantity
            PreparedStatement selectStmt = con.prepareStatement("SELECT quantity FROM products WHERE id = ?");
            selectStmt.setInt(1, productId);
            ResultSet rs = selectStmt.executeQuery();

            if (rs.next()) {
                int quantity = Integer.parseInt(rs.getString("quantity"));

                if ("increment".equals(action)) {
                    quantity++;
                } else if ("decrement".equals(action) && quantity > 0) {
                    quantity--;
                }

                PreparedStatement updateStmt = con.prepareStatement("UPDATE products SET quantity = ? WHERE id = ?");
                updateStmt.setString(1, String.valueOf(quantity));
                updateStmt.setInt(2, productId);
                updateStmt.executeUpdate();
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ItemList.jsp");
    }
}
