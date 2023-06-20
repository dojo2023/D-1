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

/**
 * Servlet implementation class InformationServlet
 */
@WebServlet("/InformationServlet")
public class InformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//login forward
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/information.jsp");
		dispatcher.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    request.setCharacterEncoding("UTF-8");

		//sessionを取得
		HttpSession session = request.getSession();
		Loggedin user_addr = (Loggedin)session.getAttribute("user_addr");

		//user_addrがあるのか判定
		if (user_addr != null) {

	        // データベースへの登録
	        String u_addr = request.getParameter("u_addr");
	        String new_pw = request.getParameter("new_pw");
	        String old_addr = (String) session.getAttribute("user_addr");
	        String session_now = old_addr;
			System.out.println(new_pw);
			System.out.println(user_addr);

	        UserDao uDao = new UserDao();
	        uDao.updateAddrPw(u_addr, new_pw, session_now);
	        session.setAttribute("user_addr", new Loggedin(u_addr));

	        request.setAttribute("message", "update complete");
	        request.getRequestDispatcher("/WEB-INF/jsp/message.jsp").forward(request, response);


		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
			dispatcher.forward(request, response);

	}
	}
	}