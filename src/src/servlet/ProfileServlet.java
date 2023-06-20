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

		/* String sHeight = request.getParameter("USER_HEIGHT");
		 String sWeight = request.getParameter("USER_WEIGHT");
		 String sGender = request.getParameter("USER_GENDER");
		 String sGoalw = request.getParameter("USER_GOALW");
		*/

	    UserDao uDao = new UserDao();
	    if(request.getParameter("update").equals("更新")) {
			if(uDao.update(new User(addr, nickname, height, weight, gender, goalw, birth, limit, avatar, color))){
				System.out.println("更新");
			}
			}else {
				System.out.println("失敗");

			}
	    request.getRequestDispatcher("/WEB-INF/jsp/top.jsp").forward(request, response);

	    // フォームが空ならエラー
		/*if (nickname.isEmpty() || sHeight.isEmpty() || sWeight.isEmpty() || sGender.isEmpty()
		|| birth.isEmpty() || sGoalw.isEmpty() || limit.isEmpty()) {
		    response.getWriter().write("エラー：フォームが空です");
		    return;
		}*/


	    // データベースへの登録

	/*    user.setUser_nickname(nickname);
	    user.setUser_height(height);
	    user.setUser_weight(weight);
	    user.setUser_gender(gender);
	    user.setUser_birth(birth);
	    user.setUser_goalw(goalw);
	    user.setUser_limit(limit);

	    uDao.update(user);



	    //レスポンスを設定
	    request.setAttribute("message", "更新が完了しました");
		request.getRequestDispatcher("/WEB-INF/jsp/message.jsp").forward(request, response);

	}*/
	}

}
