
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/VerifyOTPServlet")
public class VerifyOTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VerifyOTPServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String enteredOTP = request.getParameter("otp");
		int generatedOTP = (int) session.getAttribute("otp");

		if (Integer.parseInt(enteredOTP) == generatedOTP) {
			response.sendRedirect("ResetPassword.jsp");
		} else {
			response.getWriter().println("Invalid OTP! Try again.");
		}
	}
}
