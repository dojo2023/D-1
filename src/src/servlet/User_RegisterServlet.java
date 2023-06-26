package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class User_RegisterServlet
 */
@WebServlet("/User_RegisterServlet")
public class User_RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user_register.jsp");
		dispatcher.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        // リクエストパラメータからフォームデータを取得
        String email = request.getParameter("USER_ADDR");
        String password = request.getParameter("USER_PW");
        int secretQuestion = Integer.parseInt(request.getParameter("USER_SECRET"));
        String secretAnswer = request.getParameter("USER_ANSWER");

        // データベースへの登録前にメールアドレスの重複を確認
        UserDao uDao = new UserDao();

        // メールアドレスが既に存在するかを検索
        User existingUser = uDao.findByEmail(email);

        if (existingUser != null) {
        	response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('このメールアドレスは既に登録済みです。');");
            out.println("window.location.href = '/mippy/User_RegisterServlet';");  // リダイレクト先のURLを指定
            out.println("</script>");
        } else {

        // データベースへの登録 email
        User user = new User();
        user.setUser_addr(email);
        user.setUser_pw(password);
        user.setUser_secret(secretQuestion);
        user.setUser_answer(secretAnswer);

        uDao.insert(user);


		 //レスポンスを設定
		request.setAttribute("message", "登録が完了しました");
		request.getRequestDispatcher("/WEB-INF/jsp/message.jsp").forward(request, response);

    }

}
}
