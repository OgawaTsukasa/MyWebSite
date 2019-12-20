package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.PersonalInfoBeans;
import beans.UserDataBeans;
import dao.UserDAO;
import dao.UserInfoDAO;


/**
 * 登録完了画面
 */
@WebServlet("/RegistResult")
public class RegistResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		try{
			PersonalInfoBeans personal = new PersonalInfoBeans();
			//PersonalInfoBeansに個人情報をセット
			personal.setName(request.getParameter("name"));
			personal.setKana(request.getParameter("kana"));
			personal.setZip(request.getParameter("zip"));
			personal.setAddress(request.getParameter("address"));
			personal.setTel(request.getParameter("tel"));
			personal.setGender(request.getParameter("gender"));
			//個人情報の登録
			int PersonalId = UserInfoDAO.insertuUserPersonal(personal);


			//ユーザーのサイズ情報をDBへ仮追加
			int sizeId = UserInfoDAO.insertTemporarilyUserSize();

			UserDataBeans userData = new UserDataBeans();
			//UserDataBeansにユーザー情報をセット
			userData.setLoginId(request.getParameter("login_id"));
			userData.setPassword(request.getParameter("password"));
			userData.setPersonalInfo(personal);

			//ユーザー情報をDBへ追加
			UserDAO.insertUser(userData,PersonalId,sizeId);
			request.setAttribute("udb",userData);

			request.getRequestDispatcher(Forward.REGIST_RESULT_PAGE).forward(request, response);

		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}
}