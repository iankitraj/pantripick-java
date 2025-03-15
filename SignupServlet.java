import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SignupServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String myname = request.getParameter("name");
        String myemail = request.getParameter("email");
        String mypassword = request.getParameter("password");

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

            // Prepare SQL query
            PreparedStatement ps = con.prepareStatement("INSERT INTO `user` (name, email, password) VALUES (?, ?, ?)");
            ps.setString(1, myname);
            ps.setString(2, myemail);
            ps.setString(3, mypassword);

            int count = ps.executeUpdate();

            if (count > 0) {
                // Successful registration message
                out.println("<html><head>");
                out.println("<style>");
                out.println("body { display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f0f8ff; font-family: Arial, sans-serif; }");
                out.println(".container { text-align: center; }");
                out.println(".container h1 { color: green; }");
                out.println(".button { text-decoration: none; color: white; background-color: #6a11cb; padding: 10px 20px; border-radius: 5px; font-size: 16px; transition: all 0.3s ease; }");
                out.println(".button:hover { background-color: #9400d3; transform: scale(1.1); }");
                out.println("</style>");
                out.println("</head><body>");
                out.println("<div class='container'>");
                out.println("<h1>User Registered Successfully!</h1>");
                out.println("<a href='Pages/Login.jsp' class='button'>Go Back</a>");
                out.println("</div>");
                out.println("</body></html>");
            } else {
                // Registration failed
                out.println("<html><head>");
                out.println("<style>");
                out.println("body { display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f8d7da; font-family: Arial, sans-serif; }");
                out.println(".container { text-align: center; }");
                out.println(".container h1 { color: red; }");
                out.println(".button { text-decoration: none; color: white; background-color: #dc3545; padding: 10px 20px; border-radius: 5px; font-size: 16px; transition: all 0.3s ease; }");
                out.println(".button:hover { background-color: #c82333; transform: scale(1.1); }");
                out.println("</style>");
                out.println("</head><body>");
                out.println("<div class='container'>");
                out.println("<h1>Registration Failed. Please Try Again.</h1>");
                out.println("<a href='Pages/Signup.jsp' class='button'>Go Back</a>");
                out.println("</div>");
                out.println("</body></html>");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><head>");
            out.println("<style>");
            out.println("body { display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f8d7da; font-family: Arial, sans-serif; }");
            out.println(".container { text-align: center; }");
            out.println(".container h1 { color: red; }");
            out.println(".button { text-decoration: none; color: white; background-color: #dc3545; padding: 10px 20px; border-radius: 5px; font-size: 16px; transition: all 0.3s ease; }");
            out.println(".button:hover { background-color: #c82333; transform: scale(1.1); }");
            out.println("</style>");
            out.println("</head><body>");
            out.println("<div class='container'>");
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
            out.println("<a href='Pages/Signup.jsp' class='button'>Go Back</a>");
            out.println("</div>");
            out.println("</body></html>");
        }
    }
}
