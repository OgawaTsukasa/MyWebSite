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
import beans.BuyItemBeans;
import beans.SizeBeanse;
import dao.BuyDAO;
import dao.UserInfoDAO;

/**
 * 購入履歴画面
 */
@WebServlet("/UserBuyHistoryDetail")
public class UserBuyHistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();;
		try{
			int userId = (int) session.getAttribute("userId");
			//サイズ情報の取得
			SizeBeanse sizeData = UserInfoDAO.getSizeData(userId);
			request.setAttribute("sizeData", sizeData);

			int buyId = Integer.parseInt(request.getParameter("buyId"));
			//購入アイテム情報の取得
			List<BuyItemBeans> buyItem = BuyDAO.BuyItemHistory(buyId);
			request.setAttribute("buyItem", buyItem);


			BuyBeans buyOrder = BuyDAO.getBuyHistoryDetail(buyId);
			request.setAttribute("buyOrder", buyOrder);

			request.getRequestDispatcher(Forward.USER_BUY_HISTORY_DETAIL_PAGE).forward(request, response);


		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
