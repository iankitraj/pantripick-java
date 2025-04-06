import java.io.IOException;
import java.sql.*;
import java.util.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Cart item class
    static class CartItem {
        int productId;
        int quantity;
        double price;

        CartItem(int productId, int quantity, double price) {
            this.productId = productId;
            this.quantity = quantity;
            this.price = price;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("user_id") : null;

        if (userId == null) {
            response.getWriter().println("<h3 style='color:red;'>⚠️ User session expired. Please login again.</h3>");
            return;
        }

        // Get checkout details
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");

        String fullAddress = address1 + ", " + 
                            (address2 != null && !address2.isEmpty() ? address2 + ", " : "") + 
                            city + ", " + state + " - " + pincode;

        String recipient = firstName + " " + lastName;

        Connection conn = null;
        PreparedStatement psCart = null, psOrder = null, psOrderItems = null, psClearCart = null;
        ResultSet rsCart = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

            // Fetch cart items
            String cartQuery = "SELECT c.product_id, c.quantity, p.price FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            psCart = conn.prepareStatement(cartQuery);
            psCart.setInt(1, userId);
            rsCart = psCart.executeQuery();

            List<CartItem> cartItems = new ArrayList<>();
            double totalCost = 0;

            while (rsCart.next()) {
                int productId = rsCart.getInt("product_id");
                int quantity = rsCart.getInt("quantity");
                double price = rsCart.getDouble("price");
                totalCost += price * quantity;
                cartItems.add(new CartItem(productId, quantity, price));
            }

            if (cartItems.isEmpty()) {
                response.getWriter().println("<h3 style='color:red;'>⚠️ Cart is empty. Please add products before placing an order.</h3>");
                return;
            }

            // Insert into orders table
            String insertOrder = "INSERT INTO orders (user_id, total_cost, recipient_name, address) VALUES (?, ?, ?, ?)";
            psOrder = conn.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, userId);
            psOrder.setDouble(2, totalCost);
            psOrder.setString(3, recipient);
            psOrder.setString(4, fullAddress);
            psOrder.executeUpdate();

            // Get order ID
            ResultSet generatedKeys = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            }

            // Insert order items
            String insertItemQuery = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            psOrderItems = conn.prepareStatement(insertItemQuery);

            for (CartItem item : cartItems) {
                psOrderItems.setInt(1, orderId);
                psOrderItems.setInt(2, item.productId);
                psOrderItems.setInt(3, item.quantity);
                psOrderItems.setDouble(4, item.price);
                psOrderItems.addBatch();
            }

            psOrderItems.executeBatch();

            // Clear user's cart
            String clearCart = "DELETE FROM cart WHERE user_id = ?";
            psClearCart = conn.prepareStatement(clearCart);
            psClearCart.setInt(1, userId);
            psClearCart.executeUpdate();

            // Send confirmation email
            try {
                sendConfirmationEmail(email, recipient, orderId);
            } catch (Exception e) {
                System.out.println("Email failed: " + e.getMessage());
            }

            // ✅ Redirect to confirmation page
            response.sendRedirect("Pages/Confirm.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3 style='color:red;'>❌ Error while placing the order: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (rsCart != null) rsCart.close();
                if (psCart != null) psCart.close();
                if (psOrder != null) psOrder.close();
                if (psOrderItems != null) psOrderItems.close();
                if (psClearCart != null) psClearCart.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void sendConfirmationEmail(String recipientEmail, String recipientName, int orderId) {
        final String senderEmail = "pantripickk@gmail.com";    // SMTP email
        final String senderPassword = "kaaj xast igqp jiun";   // SMTP app password

        // SMTP Server Properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // Create Session
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // Create Message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("🛒 Order Confirmation - PantriPick");

            String emailContent = "Hello " + recipientName + ",\n\n" +
                                   "Thank you for your order! 🙏\n" +
                                   "Your Order ID is: " + orderId + "\n" +
                                   "We will process your order shortly.\n\n" +
                                   "For any queries, contact us at pantripickk@gmail.com\n\n" +
                                   "Regards,\n" +
                                   "Team PantriPick";

            message.setText(emailContent);

            // Send Email
            Transport.send(message);
            System.out.println("✅ Order confirmation email sent successfully to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("❌ Failed to send email: " + e.getMessage());
        }
    }
}