package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.Loggedin;
import model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String user_secret = request.getParameter("USER_SECRET");
		String user_nickname = request.getParameter("USER_NICKNAME");
		String user_height = request.getParameter("USER_HEIGHT");
		String user_pw = request.getParameter("USER_PW");
		String user_gender = request.getParameter("USER_GENDER");
		String user_limit = request.getParameter("USER_LIMIT");
		String user_birth = request.getParameter("USER_BIRTH");
		String user_weight = request.getParameter("USER_WEIGHT");
		String user_answer = request.getParameter("USER_ANSWER");
		String user_goalw = request.getParameter("USER_GOALW");
		String user_color = request.getParameter("USER_COLOR");
		String user_addr = request.getParameter("USER_ADDR");
		String user_avatar = request.getParameter("USER_AVATAR");
		String user_num = request.getParameter("USER_NUM");

		UserDao uDao=new UserDao();

		if(uDao.isLoginOK(new User(user_secret, user_nickname, user_height, user_pw, user_gender, user_limit, user_birth, user_weight, user_answer, user_goalw, user_color, user_addr, user_avatar, user_num))) {
			HttpSession session=request.getSession();
			session.setAttribute("user_addr", new Loggedin(user_addr));
			response.sendRedirect("/mippy/CalendarServlet");
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}
}