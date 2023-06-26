package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FoodDao;
import dao.RecordDao;
import dao.RegisterDao;
import dao.UserDao;
import model.Food;
import model.Loggedin;
import model.Record;
import model.Register;

@WebServlet("/Log_Servlet")
public class Log_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//sessionを取得
		HttpSession session = request.getSession();
		Loggedin user_addr = (Loggedin)session.getAttribute("user_addr");

		if (user_addr != null) {

			//user_numを取得
			UserDao UDao = new UserDao();
			int id = UDao.getNum(user_addr);

			// レコードDao
			RecordDao Rdao = new RecordDao();

			//情報をセットしておく
			request.setAttribute("f_category", food_category_show());

			//カレンダーから押された時の処理
			request.setCharacterEncoding("UTF-8");
			if(request.getParameter("GETmonth") != null) {

				//カレンダーに押された日程を入れる処理
				String year = request.getParameter("GETyear");
				String month = String.format("%02d",Integer.parseInt(request.getParameter("GETmonth")));
				String date = String.format("%02d",Integer.parseInt(request.getParameter("GETdate")));
				String day = year + "-" + month + "-" + date;

				request.setAttribute("day", day);

				//日程から登録した品目を取得する処理
				List<Record> list = Rdao.select1(id);
				for (int i = 0 ; i < list.size() ; i++ ) {
					if(list.get(i).getRecord_date().equals(day)) {
						request.setAttribute("list", list.get(i));

						//朝
						List<Food> breakfast = Rdao.select2(day, id, 1);
						request.setAttribute("breakfast", breakfast);
						//昼
						List<Food> lunch = Rdao.select2(day, id, 2);
						request.setAttribute("lunch", lunch);
						//夜
						List<Food> dinner = Rdao.select2(day, id, 3);
						request.setAttribute("dinner", dinner);
						//その他
						List<Food> dessert = Rdao.select2(day, id, 4);
						request.setAttribute("dessert", dessert);
					}
				}


			}else {
				//日付をyyyyMMddの形で出力する
				SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd");
		        Calendar calendar = Calendar.getInstance();

		        Date dateObj = calendar.getTime();
		        String formattedDate = dtf.format(dateObj);
		        request.setAttribute("day", formattedDate);

		      //日程から登録した品目を取得する処理
				List<Record> list = Rdao.select1(id);
				for (int i = 0 ; i < list.size() ; i++ ) {
					if(list.get(i).getRecord_date().equals(formattedDate)) {
						request.setAttribute("list", list.get(i));

						//朝
						List<Food> breakfast = Rdao.select2(formattedDate, id, 1);
						request.setAttribute("breakfast", breakfast);
						//昼
						List<Food> lunch = Rdao.select2(formattedDate, id, 2);
						request.setAttribute("lunch", lunch);
						//夜
						List<Food> dinner = Rdao.select2(formattedDate, id, 3);
						request.setAttribute("dinner", dinner);
						//その他
						List<Food> dessert = Rdao.select2(formattedDate, id, 4);
						request.setAttribute("dessert", dessert);
					}
				}
			}
	        //画面へフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/log.jsp");
			dispatcher.forward(request, response);

		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//情報をセットしておく
		request.setAttribute("f_category", food_category_show());

		//sessionを取得
		HttpSession session = request.getSession();
		Loggedin user_addr = (Loggedin)session.getAttribute("user_addr");

		//user_numを取得
		UserDao UDao = new UserDao();
		int id = UDao.getNum(user_addr);

		//コンストラクト
		RegisterDao Rdao = new RegisterDao();
		Register register = new Register();
		FoodDao Fdao = new FoodDao();
		Food food = new Food();
		RecordDao Redao = new RecordDao();

		try {
			//HTMLから取得
			request.setCharacterEncoding("UTF-8");
			String date = request.getParameter("record_category_date");
			int type = Integer.parseInt(request.getParameter("record_category_time"));
			String category = request.getParameter("record_category");
			String food_name = request.getParameter("record_item");

			System.out.println(category);
			System.out.println(food_name);
			//Food_numを取得
			food.setFoods_category(category);
			food.setFoods_name(food_name);
			List<Food> get_foodnum = Fdao.search(food);

			//modelにセット
			register.setFoods_num(get_foodnum.get(0).getFoods_num());
			register.setRecord_date(date);
			register.setRecord_type(type);
			register.setUser_num(id);

			if(Rdao.insert(register)) {
				//カレンダーにセット
				request.setAttribute("day", date);

				//日程から登録した品目を取得する処理
				List<Record> list = Redao.select1(id);
				for (int i = 0 ; i < list.size() ; i++ ) {
					if(list.get(i).getRecord_date().equals(date)) {
						request.setAttribute("list", list.get(i));

						//朝
						List<Food> breakfast = Redao.select2(date, id, 1);
						request.setAttribute("breakfast", breakfast);
						//昼
						List<Food> lunch = Redao.select2(date, id, 2);
						request.setAttribute("lunch", lunch);
						//夜
						List<Food> dinner = Redao.select2(date, id, 3);
						request.setAttribute("dinner", dinner);
						//その他
						List<Food> dessert = Redao.select2(date, id, 4);
						request.setAttribute("dessert", dessert);
					}
				}
			}
		}catch(NumberFormatException e) {
			String date = request.getParameter("record_category_date");
			request.setAttribute("day", date);
			e.printStackTrace();
			//日程から登録した品目を取得する処理
			List<Record> list = Redao.select1(id);
			for (int i = 0 ; i < list.size() ; i++ ) {
				if(list.get(i).getRecord_date().equals(date)) {
					request.setAttribute("list", list.get(i));

					//朝
					List<Food> breakfast = Redao.select2(date, id, 1);
					request.setAttribute("breakfast", breakfast);
					//昼
					List<Food> lunch = Redao.select2(date, id, 2);
					request.setAttribute("lunch", lunch);
					//夜
					List<Food> dinner = Redao.select2(date, id, 3);
					request.setAttribute("dinner", dinner);
					//その他
					List<Food> dessert = Redao.select2(date, id, 4);
					request.setAttribute("dessert", dessert);
				}
			}

		}catch(IndexOutOfBoundsException e) {
			request.setAttribute("error", "一致する品目がありませんでした");
		}finally {
			//画面へフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/log.jsp");
			dispatcher.forward(request, response);
		}
	}

	public List<Food> food_category_show () {
		//カテゴリーを取得
		FoodDao Fdao = new FoodDao();
		List<Food> list = Fdao.cat_select();
		return list;
	}

}
