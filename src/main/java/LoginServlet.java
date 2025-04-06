import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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

        // Dummy admin credentials 
        String adminEmail = "admin@gmail.com";
        String adminPassword = "admin123";

        if (email.equals(adminEmail) && password.equals(adminPassword)) {
            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("admin", email);

            // Set session timeout to 30 minutes (in seconds)
            session.setMaxInactiveInterval(30 * 60);

            // Optional: Set a cookie
            Cookie adminCookie = new Cookie("adminEmail", email);
            adminCookie.setMaxAge(30 * 60); // 30 minutes
            response.addCookie(adminCookie);

            response.sendRedirect("ItemList.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid Email or Password");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
    }
}
