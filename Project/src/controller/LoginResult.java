package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;

/**
 * ログイン結果
 */
@WebServlet("/LoginResult")
public class LoginResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		try{
			String loginId = request.getParameter("login_id");
			String password = request.getParameter("password");

			//ユーザーIDを取得
			int userId = UserDAO.getUserId(loginId, password);

			//ユーザーIDの取得有無
			if(userId != 0) {
				//成功した場合
				session.setAttribute("isLogin",true);
				session.setAttribute("userId", userId);
				//ログイン前のページを取得
				String returnURL = (String) Helper.cutSessionAttribute(session,"returnUrl");

				//ログイン前ページにリダイレクト。指定がない場合はIndex。
				request.getRequestDispatcher(returnURL!=null ? returnURL:Forward.TOP_PAGE).forward(request, response);
			}else {
				//失敗した場合
				request.setAttribute("inputLoginId", loginId);
				request.setAttribute("loginErrorMessage", "入力内容が正しくありません");

				request.getRequestDispatcher(Forward.LOGIN_PAGE).forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}

}
