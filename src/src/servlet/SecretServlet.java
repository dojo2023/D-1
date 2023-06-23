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

		String user_addr = request.getParameter("user_addr");
		String new_pw = request.getParameter("new_pw");
		String co_pw = request.getParameter("co_pw");
		int q = Integer.parseInt(request.getParameter("USER_SECRET"));
		String a = request.getParameter("answer");
		UserDao uDao = new UserDao();
	    int userSecret = 0;
	    String userAnswer = null;
	    int ex = 0;

	   if(request.getParameter("secretsubmit") != null) {

		   List<User> userList = uDao.checkEmailExistence(user_addr);

		   User user = userList.get(0);
		   ex = user.getEx();
			userSecret = user.getUser_secret();
			userAnswer = user.getUser_answer();
			if (ex != 0 && q == userSecret && a.equals(String.valueOf(userAnswer))) {
				request.setAttribute("useraddr", user_addr);
				request.setAttribute("userSecret", userSecret);
				request.setAttribute("userAnswer", userAnswer);
		        request.getRequestDispatcher("/WEB-INF/jsp/secret.jsp").forward(request, response);
			}
		    else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
				dispatcher.forward(request, response);
					}

	    }


	    else if(request.getParameter("PwButton") != null) {
	    	if(new_pw == co_pw) {
	        String useraddr = request.getParameter("user1addr");
				uDao.seekPw(useraddr, new_pw);
		        request.setAttribute("message", "update complete");
		        request.getRequestDispatcher("/WEB-INF/jsp/top.jsp").forward(request, response);
	    	     }
	    	else {
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
				dispatcher.forward(request, response);
	    	}
			}

	}
}




