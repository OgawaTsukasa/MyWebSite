package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.PersonalInfoBeans;
import dao.UserInfoDAO;

/**
 * ユーザー情報更新入力内容確認画面
 */
@WebServlet("/UserDataUpdateResult")
public class UserDataUpdateResult extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*文字化け対策*/
		request.setCharacterEncoding("UTF-8");
		//セッション開始
		HttpSession session = request.getSession();

		try{
			PersonalInfoBeans personal = new PersonalInfoBeans();

			//確認フォームから受け取った値をBeansにセット
			personal.setName(request.getParameter("name"));
			personal.setKana(request.getParameter("kana"));
			personal.setGender(request.getParameter("gender"));
			personal.setZip(request.getParameter("zip"));
			personal.setAddress(request.getParameter("address"));
			personal.setTel(request.getParameter("tel"));

			//ユーザーIDをセッションから取得
			int userId =  (int) session.getAttribute("userId");

			UserInfoDAO.updateUser(userId, personal);

			request.setAttribute("personal", personal);
			request.getRequestDispatcher(Forward.USER_DATA_UPDATA_RESULT_PAGE).forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}
}
