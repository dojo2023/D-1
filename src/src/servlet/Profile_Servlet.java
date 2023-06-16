package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalendarServlet
 */
@WebServlet("/Profile_Servlet")
public class Profile_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
		dispatcher.forward(request, response);
	}
}


/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */

	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // リクエストパラメータからフォームデータを取得
    String nickname = request.getParameter("USER_NICKNAME");
    double height = request.getParameter("USER_HEIGHT");
    double weight = request.getParameter("USER_WEIGHT");
    int gender = Integer.parseInt(request.getParameter("USER_GENDER"));
    int birth = request.getParameter("USER_BIRTH");
    double goalw = request.getParameter("USER_GOALW");
    int limit = request.getParameter("USER_LIMIT");

    // データベースへの登録 email
    UserDao uDao = new UserDao();
    User user = new User();
    user.setUser_nickname(nickname);
    user.setUser_height(height);
    user.setUser_weight(weight);
    user.setUser_gender(gender);
    user.setUser_birth(birth);
    user.setUser_goalw(goalw);
    user.setUser_limit(limit);

    uDao.insert(user);


    //レスポンスを設定
    request.setAttribute("message", "更新が完了しました");
    request.getRequestDispatcher("/WEB-INF/jsp/message.jsp").forward(request, response);

}

}

*/