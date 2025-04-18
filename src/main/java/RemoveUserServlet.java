import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/RemoveUserServlet")
public class RemoveUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        response.setContentType("text/plain");

        // Log the received email
        System.out.println("Received email to delete: " + email);

        try (PrintWriter out = response.getWriter()) {

            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pantripick", "root", "123456")) {

                // Prepare the SQL DELETE statement
                PreparedStatement ps = con.prepareStatement("DELETE FROM user WHERE email = ?");
                ps.setString(1, email);
                int rows = ps.executeUpdate();

                // Log the result of the query
                System.out.println("Rows affected: " + rows);

                if (rows > 0) {
                    out.print("success");
                } else {
                    out.print("User not found");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error occurred");
        }
    }
}