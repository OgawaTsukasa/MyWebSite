package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import beans.BuyBeans;

/**
 *
 */
@WebServlet("/Regist")
public class Regist extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * 会員登録画面へ遷移
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		//前ページ情報の取得
		String returnUrl = request.getParameter("url");
		if(!StringUtils.isBlank(returnUrl)) {
			//Sessionにリターンページ情報を書き込む
			session.setAttribute("returnUrl", returnUrl);
		}

		//購入確認ページからのアクセスの場合はオーダー情報をセッションから取得
		BuyBeans orderData = (BuyBeans) session.getAttribute("orderData");
		if(orderData != null) {
			request.setAttribute("personal", orderData.getPersonalInfo());
		}

		request.getRequestDispatcher(Forward.REGIST_PAGE).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
