

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ResetPasswordServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String newPassword = request.getParameter("newPassword");

        String url = "jdbc:mysql://localhost:3306/pantripick";
        String user = "root";
        String password = "123456";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            PreparedStatement ps = con.prepareStatement("UPDATE user SET password=? WHERE email=?");
            ps.setString(1, newPassword);
            ps.setString(2, email);

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("Pages/Login.jsp"); // Redirect user to login page
            } else {
                out.println("Error updating password!");
            }

            con.close();
        } catch (Exception e) {
            out.println("Database Error: " + e.getMessage());
        }
    }
}
