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
import java.sql.SQLException;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("user");
        String newName = request.getParameter("name");
        String newPassword = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "123456");

            String query = "UPDATE user SET name = ?, password = ? WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, newName);
            ps.setString(2, newPassword);
            ps.setString(3, userEmail);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                request.setAttribute("msg", "Profile Updated Successfully");
            } else {
                request.setAttribute("msg", "Update Failed");
            }
            request.getRequestDispatcher("Pages/Profile.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
