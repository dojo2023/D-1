package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FoodDao;
import dao.UserDao;
import model.Food;
import model.Loggedin;
/**
 * Servlet implementation class Log_Servlet
 */
@WebServlet("/Log_Servlet")
public class Log_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//sessionを取得
		HttpSession session = request.getSession();
		Loggedin user_addr = (Loggedin)session.getAttribute("user_addr");

		//user_addrがあるのか判定
		if (user_addr == null) {

			//user_numを取得
			UserDao Udao = new UserDao();
			int id = Udao.getNum(user_addr);

			//カテゴリーを取得
			FoodDao Fdao = new FoodDao();
			List<Food> f_category = Fdao.cat_select();

			//情報をセットしておく
			request.setAttribute("f_category", f_category);


			//データベースから記録を取得
	        Calendar cl = Calendar.getInstance();

	        //日付をyyyyMMddの形で出力する
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	        //画面へフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/log.jsp");
			dispatcher.forward(request, response);


		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
			dispatcher.forward(request, response);
		}






	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
