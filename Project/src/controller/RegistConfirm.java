package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import beans.PersonalInfoBeans;
import beans.UserDataBeans;
import dao.UserDAO;

/**
 * ユーザー登録入力内容確認画面
 */
@WebServlet("/RegistConfirm")
public class RegistConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * 入力内容を確認 バリデーションエラーがある場合新規登録画面に遷移
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//文字化け対策
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		try {
			String userName = request.getParameter("name");
			String userKana = request.getParameter("kana");
			String loginId = request.getParameter("login_id");
			String password = request.getParameter("password");
			String userZip = request.getParameter("zip");
			String userAddress = request.getParameter("address");
			String userTel = request.getParameter("tel");
			String userGender = request.getParameter("gender");

			UserDataBeans udb = new UserDataBeans();
			udb.setLoginId(loginId);
			udb.setPassword(password);

			String registMessage = "";

			// loginIdの重複をチェック
			if(UserDAO.isOverlapLoginId(loginId, 0)) {
				registMessage = "ほかのユーザーが使用中のログインIDです";
			}

			PersonalInfoBeans personal = new PersonalInfoBeans();
			personal.setName(userName);
			personal.setKana(userKana);
			personal.setZip(userZip);
			personal.setAddress(userAddress);
			personal.setTel(userTel);

			//男女の判断
			if(userGender.equals("1")) {
				personal.setGender("男性");
			}else if(userGender.equals("2")) {
				personal.setGender("女性");
			}


			//エラーメッセージがないなら確認画面へ
			if(StringUtils.isBlank(registMessage)) {
				request.setAttribute("udb", udb);
				request.setAttribute("personal", personal);
				request.getRequestDispatcher(Forward.REGIST_CONFIRM_PAGE).forward(request, response);
			}else {
				request.setAttribute("udb", udb);
				request.setAttribute("personal", personal);
				request.setAttribute("registMessage", registMessage);
				request.getRequestDispatcher(Forward.REGIST_PAGE).forward(request, response);
			}


		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}
}
