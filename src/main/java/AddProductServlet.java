import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import org.json.JSONObject;

@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Now we are saving image in "Image" folder (inside webapp)
    private static final String UPLOAD_DIR = "Image";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get form data
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");

        // Set path to save uploaded file in "Image" folder
        String uploadPath = getServletContext().getRealPath("/") + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Creates Image folder if not exists
        }

        // Handle file upload
        String fileName = "";
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            filePart.write(uploadPath + File.separator + fileName); // Save file
        }

        // Save product details into database
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pantripick", "root", "807280");

            String sql = "INSERT INTO products (name, quantity, price, description, image) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setInt(2, quantity);
            pstmt.setDouble(3, price);
            pstmt.setString(4, description);
            pstmt.setString(5, UPLOAD_DIR + "/" + fileName); // ✅ Save as "Image/filename.jpg"

            int row = pstmt.executeUpdate();
            if (row > 0) {
                // ✅ Send real-time WebSocket update
                JSONObject json = new JSONObject();
                json.put("name", name);
                json.put("quantity", quantity);
                json.put("price", price);
                json.put("description", description);
                json.put("image", request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName);

                ProductWebSocket.broadcast(json.toString());

                response.sendRedirect("AddProduct.jsp?success=true");
            } else {
                response.sendRedirect("AddProduct.jsp?error=Database Error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddProduct.jsp?error=Exception: " + e.getMessage());
        } finally {
            try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { ex.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception ex) { ex.printStackTrace(); }
        }
    }
}
