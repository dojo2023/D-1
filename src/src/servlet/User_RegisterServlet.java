package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//login forward
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user_register.jsp");
		dispatcher.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */


	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // リクエストパラメータからフォームデータを取得
        String email = request.getParameter("USER_ADDR");
        String password = request.getParameter("USER_PW");
        //String confirmPassword = request.getParameter("confirmPassword");
        String secretQuestion = request.getParameter("secret");
        String secretAnswer = request.getParameter("USER_ANSWER");

        // フォームデータの処理
        // データベースへの登録

        // レスポンスを設定
        /*response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("登録が完了しました。");
        */
        request.setAttribute("message", "登録が完了しました。");

        //response.sendRedirect("/miffy/TopServlet");
        request.getRequestDispatcher("/WEB-INF/jsp/message.jsp").forward(request, response);
    }

}
