

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Dummy admin credentials (replace with database validation)
        String adminEmail = "admin@gmail.com";
        String adminPassword = "admin123";

        // Validate admin login
        if (email.equals(adminEmail) && password.equals(adminPassword)) {
            // Create session for the admin user
            HttpSession session = request.getSession();
            session.setAttribute("admin", email);

            // Redirect to ItemList.jsp
            response.sendRedirect("ItemList.jsp");
        } else {
            // Redirect back to login page with error message
            request.setAttribute("errorMessage", "Invalid Email or Password");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
	}
}
