

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
import java.sql.ResultSet;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UserLoginServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
		 
	        PrintWriter out = response.getWriter();
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        Connection con = null;
	        PreparedStatement pst = null;
	        ResultSet rs = null;
	        try {
	            // Load MySQL JDBC Driver
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            
	            // Connect to the database
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");
	            
	            // Query to check user credentials
	            String query = "SELECT * FROM user WHERE email=? AND password=?";
	            pst = con.prepareStatement(query);
	            pst.setString(1, email);
	            pst.setString(2, password);
	            
	            rs = pst.executeQuery();
	            
	            if (rs.next()) {
	                HttpSession session = request.getSession();
	                session.setAttribute("user", email);
	                response.sendRedirect("Pages/Home.jsp"); // Redirect to dashboard
	            } else {
	                out.println("<script type='text/javascript'>");
	                out.println("alert('Invalid email or password');");
	                out.println("window.location='Pages/Login.jsp';");
	                out.println("</script>");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (pst != null) pst.close();
	                if (con != null) con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	                
	            }
	        }
	    }
}