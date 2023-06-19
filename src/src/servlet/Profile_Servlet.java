package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

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



/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */

	/*データベースからデータを取得し、HTML内のテキストボックスに表示させる
	public class Profile_Serblet extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF^8");
			PrintWriter out = response.getWriter();


			 // データベースへの接続、データの取得
	        try {
	            Connection connection = DriverManager.getConnection("jdbc:h2:file:C:/pleiades/workspace/data/mippy", "sa", "");
	            Statement statement = connection.createStatement();
	            ResultSet resultSet = statement.executeQuery("SELECT * FROM M_USER WHERE condition = 'your_condition'");

	            // データの取得とテキストボックスへの表示
	            if (resultSet.next()) {
	                String data = resultSet.getString("");
	                out.println("<input type='text' name='textbox' value='" + data + "'>");
	            }
		}
	}
*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // リクエストパラメータからフォームデータを取得
    String nickname = request.getParameter("USER_NICKNAME");
    double height = Double.parseDouble(request.getParameter("USER_HEIGHT"));
    double weight = Double.parseDouble(request.getParameter("USER_WEIGHT"));
    int gender = Integer.parseInt(request.getParameter("USER_GENDER"));
    String birth = request.getParameter("USER_BIRTH");
    double goalw = Double.parseDouble(request.getParameter("USER_GOALW"));
    String limit = request.getParameter("USER_LIMIT");


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

    uDao.update(user);


    //レスポンスを設定
    request.setAttribute("message", "更新が完了しました");
    request.getRequestDispatcher("/WEB-INF/jsp/message.jsp").forward(request, response);

}

}
