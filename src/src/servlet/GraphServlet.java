package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RecordDao;
import dao.UserDao;
import model.Loggedin;
import model.Record;
import model.User;

/**
 * Servlet implementation class GraphServlet
 */
@WebServlet("/GraphServlet")
public class GraphServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("user_addr")==null) {
			response.sendRedirect("/mippy/TopServlet");
			return;
		}

		Loggedin user_addr = (Loggedin) session.getAttribute("user_addr");
		String id = user_addr.getId();

		UserDao uDao = new UserDao();
		RecordDao rDao = new RecordDao();

        // DAOのメソッドを呼び出してリストを取得
        List<User> userList = uDao.selectByUserAddress(id);
        request.setAttribute("userList",userList);

        List<Record> cardList = rDao.select(id);
        request.setAttribute("cardList",cardList);

        RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsp/graph.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");


	}
}