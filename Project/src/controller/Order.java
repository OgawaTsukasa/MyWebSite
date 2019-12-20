package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyBeans;
import beans.ItemDataBeans;
import beans.SizeBeanse;
import dao.UserInfoDAO;
/**
 * オーダー画面
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//セッション
		HttpSession session = request.getSession();

		try {

			//カートアイテム取得
			ArrayList<ItemDataBeans> cart = (ArrayList<ItemDataBeans>) session.getAttribute("cart");

			//カートが無かった場合
			if (cart == null) {
				cart = new ArrayList<ItemDataBeans>();
				session.setAttribute("cart", cart);
			}


			//カートの中身を確認
			if(cart.size() != 0) {
				BuyBeans orderData = (BuyBeans) Helper.cutSessionAttribute(session, "orderData");
				//オーダー内容修正ボタンからのアクセス
				if(orderData != null) {
					request.setAttribute("personal", orderData.getPersonalInfo());
					request.setAttribute("size", orderData.getSizeBeanse());
					request.setAttribute("order", orderData);
					request.getRequestDispatcher(Forward.ORDER_PAGE).forward(request, response);
				}else {
					//ログイン状態の場合
					Boolean isLogin = session.getAttribute("isLogin") != null ? (Boolean) session.getAttribute("isLogin") : false;
					if(isLogin) {
						//サイズ情報の取得
						SizeBeanse size = UserInfoDAO.getSizeData((int)session.getAttribute("userId"));

						request.setAttribute("size", size);
						request.getRequestDispatcher(Forward.ORDER_PAGE).forward(request, response);
					}else {
						request.getRequestDispatcher(Forward.ORDER_PAGE).forward(request, response);
					}
				}
			}else {
				request.setAttribute("cartActionMessage", "購入する商品がありません");
				request.getRequestDispatcher(Forward.CART_PAGE).forward(request, response);
			}

		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}

}
