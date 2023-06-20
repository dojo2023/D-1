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
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
		dispatcher.forward(request, response);


		/*		HttpSession session = request.getSession();
				Loggedin user = (Loggedin) session.getAttribute("user_addr");
				String addr = user.getId();

				// データベースから値を取得する処理
				UserDao uDao = new UserDao();
				User userProfile = uDao.getUserProfile(addr);

				// 取得した値をリクエスト属性に設定
				request.setAttribute("nickname", userProfile.getNickname());
				request.setAttribute("height", userProfile.getHeight());
				request.setAttribute("weight", userProfile.getWeight());
				request.setAttribute("avatar", userProfile.getAvatar());
				request.setAttribute("color", userProfile.getColor());
				request.setAttribute("gender", userProfile.getGender());
				request.setAttribute("gender", userProfile.getGender());
		*/


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();

		request.setCharacterEncoding("UTF-8");
		Loggedin user_addr = (Loggedin) session.getAttribute("user_addr");
		String addr = user_addr.getId();


		// リクエストパラメータからフォームデータを取得
	    String nickname = request.getParameter("USER_NICKNAME");
	    double height = Double.parseDouble(request.getParameter("USER_HEIGHT"));
	    double weight = Double.parseDouble(request.getParameter("USER_WEIGHT"));
	    int avatar = Integer.parseInt(request.getParameter("USER_AVATAR"));
	    int color = Integer.parseInt(request.getParameter("USER_COLOR"));
	    int gender = Integer.parseInt(request.getParameter("USER_GENDER"));
	    String birth = request.getParameter("USER_BIRTH");
	    double goalw = Double.parseDouble(request.getParameter("USER_GOALW"));
	    String limit = request.getParameter("USER_LIMIT");

	    request.setAttribute("nickname", nickname);


	    UserDao uDao = new UserDao();
	    if(request.getParameter("update").equals("更新")) {
			if(uDao.update(new User(addr, nickname, height, weight, gender, goalw, birth, limit, avatar, color))){
				System.out.println("更新");
			    request.getRequestDispatcher("/WEB-INF/jsp/top.jsp").forward(request, response);

			}else {
				System.out.println("失敗");
			    request.getRequestDispatcher("/WEB-INF/jsp/calendar.jsp").forward(request, response);

			}}
	}

}
