package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class secretServlet
 */
@WebServlet("/SecretServlet")
public class SecretServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//login forward
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/secret.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String session_now = request.getParameter("session_now");
		String new_pw = request.getParameter("new_pw");
		String u_addr = request.getParameter("");
		UserDao uDao = new UserDao();
	    int counttrue = 0;
	    int userSecret = 0;
	    String userAnswer = null;
	    List<User> userList = uDao.checkEmailExistence(session_now);

	   if(request.getParameter("secretsubmit") != null) {

			if (!userList.isEmpty()) {
				User user = userList.get(0);
				counttrue = 1;
				userSecret = user.getUser_secret();
				userAnswer = user.getUser_answer();
				request.setAttribute("session_now", session_now);
				request.setAttribute("counttrue", counttrue);
				request.setAttribute("userSecret", userSecret);
				request.setAttribute("userAnswer", userAnswer);
		        request.setAttribute("message", "seeking");
		        request.getRequestDispatcher("/WEB-INF/jsp/secret.jsp").forward(request, response);

					if(request.getParameter("pwsubmit") != null) {
						uDao.updateAddrPw2(u_addr, new_pw, session_now);
				        request.setAttribute("message", "update complete");
				        request.getRequestDispatcher("/WEB-INF/jsp/top.jsp").forward(request, response);

					}

			} else {
				counttrue = 0;
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
				dispatcher.forward(request, response);
					}

	    }


}

}