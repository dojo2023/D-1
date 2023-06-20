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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ログインにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//htmlから取得
		request.setCharacterEncoding("UTF-8");
		String user_pw = request.getParameter("user_pw");
		String user_addr = request.getParameter("user_addr");

		System.out.println(user_pw);
		System.out.println(user_addr);

		//ログインの処理
		UserDao uDao=new UserDao();
		if(uDao.isLoginOK(new User(user_addr, user_pw))) {
			HttpSession session=request.getSession();
			session.setAttribute("user_addr", new Loggedin(user_addr));
			response.sendRedirect("/mippy/GraphServlet");
		}else {
			//
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}
}