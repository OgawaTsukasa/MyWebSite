package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ItemDataBeans;

/**
 * カート画面
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		try {
			ArrayList<ItemDataBeans> cart = (ArrayList<ItemDataBeans>) session.getAttribute("cart");

			//セッションにカートがない場合カートを作成
			if(cart==null) {
				cart = new ArrayList<ItemDataBeans>();
				session.setAttribute("cart", cart);
			}

			String cartActionMessage = null;
			//カートに商品が入っていない場合のメッセージ
			if(cart.size() == 0) {
				cartActionMessage = "カートに商品はありません";
			}

			request.setAttribute("cartActionMessage", cartActionMessage);
			request.getRequestDispatcher(Forward.CART_PAGE).forward(request, response);

		}
		 catch (Exception e) {
			 e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}
}
