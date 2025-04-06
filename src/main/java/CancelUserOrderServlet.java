// CancelUserOrderServlet.java
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet("/CancelUserOrderServlet")
public class CancelUserOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

            // Find order IDs of this user
            PreparedStatement ps1 = con.prepareStatement("SELECT id FROM orders WHERE user_id = (SELECT Id FROM user WHERE email = ?)");
            ps1.setString(1, userEmail);
            ResultSet rs = ps1.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("id");

                // Delete from order_items
                PreparedStatement deleteItems = con.prepareStatement("DELETE FROM order_items WHERE order_id = ?");
                deleteItems.setInt(1, orderId);
                deleteItems.executeUpdate();

                // Delete from orders
                PreparedStatement deleteOrder = con.prepareStatement("DELETE FROM orders WHERE id = ?");
                deleteOrder.setInt(1, orderId);
                deleteOrder.executeUpdate();
            }

            sendEmail(userEmail);
            con.close();

            request.getSession().setAttribute("successMessage", "Order cancelled and email sent successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Error occurred during cancellation.");
        }

        response.sendRedirect("UserList.jsp");
    }

    private void sendEmail(String recipient) throws MessagingException {
        String host = "smtp.gmail.com";
        final String senderEmail = "pantripickk@gmail.com";
        final String password = "kaaj xast igqp jiun";

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject("Order Cancelled");

        String content = "Hello,\n\nWe regret to inform you that your recent order has been cancelled by the admin.\n"
                + "If this cancellation was not expected, kindly reach out to us immediately.\n\n"
                + "For any queries, contact us at pantripickk@gmail.com\n\n"
                + "Regards,\nTeam PantriPick";

        message.setText(content);
        Transport.send(message);
    }
}
