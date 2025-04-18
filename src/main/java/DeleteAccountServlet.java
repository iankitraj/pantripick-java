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

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("user_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pantripick", "root", "123456")) {

                PreparedStatement ps = con.prepareStatement("DELETE FROM user WHERE id = ?");
                ps.setInt(1, userId);

                int rows = ps.executeUpdate();

                if (rows > 0) {
                    // Clear the session after deletion
                    session.invalidate();
                    response.sendRedirect("Pages/Home.jsp");
                } else {
                    response.getWriter().print("User not found");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error occurred while deleting user.");
        }
    }
}
