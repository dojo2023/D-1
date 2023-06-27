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
		//sessionを取得
		HttpSession session = request.getSession();
		Loggedin user_addr = (Loggedin)session.getAttribute("user_addr");
		
		//user_addrがあるのか判定
		 if (user_addr != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/information.jsp");
				dispatcher.forward(request, response);
		 }
		 else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
				dispatcher.forward(request, response);
		 }

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
			//HTMLから取得
			String u_addr = request.getParameter("u_addr");
			String new_pw = request.getParameter("new_pw");
			String old_addr = user_addr.getId();
			String session_now = old_addr;
			UserDao uDao = new UserDao();

			if (request.getParameter("addr_update") != null) {


				uDao.updateAddrPw1(u_addr, new_pw, session_now);
		        session.setAttribute("user_addr", new Loggedin(u_addr));

				//画面に戻る
		        request.setAttribute("message", "update complete");
		        request.getRequestDispatcher("/WEB-INF/jsp/message.jsp").forward(request, response);


			//追加ボタンを押された
			}else if (request.getParameter("pw_update") != null) {


					uDao.updateAddrPw2(u_addr, new_pw, session_now);
			        session.setAttribute("user_addr", new Loggedin(u_addr));

					//画面に戻る
			        request.setAttribute("message", "update complete");
			        request.getRequestDispatcher("/WEB-INF/jsp/message.jsp").forward(request, response);
			}


}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
			dispatcher.forward(request, response);

	}


	}

}