package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyBeans;
import beans.PersonalInfoBeans;
import dao.BuyDAO;
import dao.UserInfoDAO;

/**
 * ユーザー情報画面
 */
@WebServlet("/UserData")
public class UserData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// セッション開始
		HttpSession session = request.getSession();
		try{
			// ログイン時に取得したユーザーIDをセッションから取得
			int userId = (int) session.getAttribute("userId");

			List<BuyBeans> buyDataList = BuyDAO.getBuyData(userId);
			request.setAttribute("BuyDataList",buyDataList);

			PersonalInfoBeans userPersonal = UserInfoDAO.getUserData(userId);
			request.setAttribute("UserPersonal",userPersonal);

			request.getRequestDispatcher(Forward.USER_DATA_PAGE).forward(request, response);

		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
