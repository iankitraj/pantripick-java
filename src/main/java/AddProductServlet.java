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

@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads"; // Defined missing constant

    public AddProductServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // Fetch form fields
            String name = request.getParameter("name");
            int quantity = 0;
            double price = 0.0;
            String description = request.getParameter("description");

            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                price = Double.parseDouble(request.getParameter("price"));
            } catch (NumberFormatException e) {
                out.println("<h2>Error: Invalid number format for Quantity or Price.</h2>");
                return;
            }

            // Handle file upload
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String fileName = "";
            Part filePart = request.getPart("file");
            if (filePart != null && filePart.getSize() > 0) {
                fileName = filePart.getSubmittedFileName();
                filePart.write(uploadPath + File.separator + fileName);
            }

            // Redirect to confirmation or show message
            out.println("<html>");
            out.println("<head><link rel='stylesheet' href='Admin.css'></head>");
            out.println("<body>");
            out.println("<header>");
            out.println("<div class='logo'>PantriPick - Admin</div>");
            out.println("</header>");
            out.println("<main>");
            out.println("<h1>Product Added Successfully!</h1>");
            out.println("<p><strong>Name:</strong> " + name + "</p>");
            out.println("<p><strong>Quantity:</strong> " + quantity + "</p>");
            out.println("<p><strong>Price:</strong> " + price + "</p>");
            out.println("<p><strong>Description:</strong> " + description + "</p>");
            out.println("<p><strong>Uploaded File:</strong> " + (fileName.isEmpty() ? "No file uploaded" : fileName) + "</p>");
            out.println("<a href='AddProduct.jsp'>Add Another Product</a>");
            out.println("</main>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
