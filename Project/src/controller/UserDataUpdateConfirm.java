package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.PersonalInfoBeans;

/**
 *  ユーザー情報更新入力内容確認画面
 */
@WebServlet("/UserDataUpdateConfirm")
public class UserDataUpdateConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * 更新内容確認画面遷移
	 *
	 * param : name (ユーザー名前)
	 * param : kana (ふりがな)
	 * param : gender (性別)
	 * param : zip (郵便番号)
	 * param : address (住所)
	 * param : tel (電話番号)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//文字化け対策
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		try{
			PersonalInfoBeans personal = new PersonalInfoBeans();

			//入力フォームから受け取った値をBeansにセット
			personal.setName(request.getParameter("name"));
			personal.setKana(request.getParameter("kana"));
			personal.setGender(request.getParameter("gender"));
			personal.setZip(request.getParameter("zip"));
			personal.setAddress(request.getParameter("address"));
			personal.setTel(request.getParameter("tel"));

			request.setAttribute("personal", personal);
			request.getRequestDispatcher(Forward.USER_DATA_UPDATE_CONFIRM_PAGE).forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}
}
