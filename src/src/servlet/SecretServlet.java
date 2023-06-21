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

		String MAIL = request.getParameter("MAIL");
		UserDao uDao = new UserDao();
	    int counttrue = 0;
	    int userSecret = 0;
	    String userAnswer = null;

	   if(request.getParameter("secretsubmit") != null) {

			List<User> userList = uDao.checkEmailExistence(MAIL);

			if (!userList.isEmpty()) {
				User user = userList.get(0);
				counttrue = 1;
				userSecret = user.getUser_secret();
				userAnswer = user.getUser_answer();
				request.setAttribute("counttrue", counttrue);
				request.setAttribute("userSecret", userSecret);
				request.setAttribute("userAnswer", userAnswer);


			} else {
				counttrue = 0;
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
				dispatcher.forward(request, response);
					}

	    }

}

}