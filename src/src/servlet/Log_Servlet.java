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
import dao.UserDao;
import model.Food;
import model.Loggedin;
import model.Record;

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

			//カテゴリーを取得
			FoodDao Fdao = new FoodDao();
			List<Food> f_category = Fdao.cat_select();

			//情報をセットしておく
			request.setAttribute("f_category", f_category);

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
				System.out.println(day);
				for (int i = 0 ; i < list.size() ; i++ ) {
					System.out.println(list.get(i).getRecord_date());
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
