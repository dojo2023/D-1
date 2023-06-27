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

import dao.FoodDao;
import model.Food;
import model.Loggedin;

/**
 * Servlet implementation class Food_registerServlet
 */
@WebServlet("/Food_registerServlet")
public class Food_registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		//sessionを取得
		HttpSession session = request.getSession();
		Loggedin user_addr = (Loggedin)session.getAttribute("user_addr");

		//user_addrがあるのか判定
		 if (user_addr != null) {
		System.out.println("ああ");
		//
		FoodDao Fdao = new FoodDao();
		List<Food> f_category = Fdao.cat_select();

		//情報をセットしておく
		request.setAttribute("f_category", f_category);
		System.out.println("いい");

		//画面にフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/food_register.jsp");
		dispatcher.forward(request, response);
		 }

		 else{
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
				dispatcher.forward(request, response);
		 }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String category;
		String name;
		double cal;
		Food food = new Food();
		FoodDao Fdao = new FoodDao();
		List<Food> f_category = Fdao.cat_select();

		//情報をセットしておく
		request.setAttribute("f_category", f_category);

		//検索ボタンを押された
		if (request.getParameter("s_submit") != null) {
			System.out.println("やっぱ成功");

			//HTMLから取得
			category = request.getParameter("s_category");
			name = request.getParameter("s_name");

			//modelにセット
			food.setFoods_category(category);
			food.setFoods_name(name);

			//検索をかける
			List<Food> search_list = Fdao.search(food);
			request.setAttribute("search_list", search_list);

			//画面に戻る
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/food_register.jsp");
			dispatcher.forward(request, response);

			System.out.println("成功");

		//追加ボタンを押された
		}else if (request.getParameter("a_submit") != null) {
			System.out.println("失敗");

			try {
				//HTMLから取得
				category = request.getParameter("a_category");
				name = request.getParameter("a_name");
				cal =  Double.parseDouble(request.getParameter("a_cal"));

				//modelにセット
				food.setFoods_category(category);
				food.setFoods_name(name);
				food.setFoods_cal(cal);

				//追加する
				Fdao.insert(food);
			}catch(Exception e) {

			}finally {
				//画面にフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/food_register.jsp");
				dispatcher.forward(request, response);
			}

		}
	}

}
