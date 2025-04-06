import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteProductServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        System.out.println("🔍 Deleting product with ID: " + productId); // Debug log

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pantripick", "root", "807280");

            String sql = "DELETE FROM products WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productId);

            int rows = ps.executeUpdate();
            System.out.println("✅ Rows affected: " + rows);

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ItemList.jsp");
    }
}
