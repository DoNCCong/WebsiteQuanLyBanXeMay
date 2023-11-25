package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

import entity.Account;
import entity.Email;
import entity.EmailUtils;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet(name = "ForgotPasswordControl", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordControl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
   	 	response.setContentType("text/html;charset=UTF-8");

		try {
			String emailAddress = request.getParameter("email");
			String username = request.getParameter("username");
			
			DAO dao = new DAO();
			Account account = dao.checkAccountExistByusernameAndemail(username, emailAddress);
			if(account == null) {
				request.setAttribute("error", "Email hoặc Tên Đăng Nhập Bị Sai!");
			}
			if(account != null) {
				Email email =new Email();
				email.setFrom("21133021@student.hcmute.edu.vn");
				email.setFromPassword("K_Haruto1103");
				email.setTo(emailAddress);
				email.setSubject("Forgot Password Function");
				StringBuilder sb = new StringBuilder();
				sb.append("Gửi đến ").append(username).append(",<br>");
				sb.append("Bạn vừa sử dụng chức năng Quên Mật Khẩu. <br> ");
				sb.append("Mật Khẩu của bạn là: <b>").append(account.getPassword()).append(" </b> <br>");
				sb.append("Trân trọng,<br>");
				sb.append("Chủ Cửa Hàng");
				
				email.setContent(sb.toString());
				EmailUtils.send(email);
				
				request.setAttribute("mess", "Mật Khẩu Đã Được Gửi Đến Email Của Bạn!");
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
	}

}
