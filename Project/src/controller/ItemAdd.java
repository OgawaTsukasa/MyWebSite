package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BuyItemBeans;
import dao.ItemDAO;

/**
 * 商品追加画面
 */
@WebServlet("/ItemAdd")
public class ItemAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*文字化け対策*/
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		try {
			//選択された商品の数量
			String num = request.getParameter("num");
			//選択された商品のID
			int Data = Integer.parseInt(request.getParameter("id"));

			//アイテム情報の取得
			BuyItemBeans cartItem = ItemDAO.getCartItemDetail(Data,Integer.parseInt(num));

			//アイテム情報をリクエストパラメータにセット
			request.setAttribute("item",cartItem );
			//カートを取得
			ArrayList<BuyItemBeans> cart = (ArrayList<BuyItemBeans>) session.getAttribute("cart");

			//セッションにカートが無い場合カートを作成
			if(cart == null) {
				cart = new ArrayList<BuyItemBeans>();
			}

			//カートにアイテムを追加
			cart.add(cartItem);

			//カート情報更新
			session.setAttribute("cart", cart);

			//更新メッセージ
			request.setAttribute("cartActionMessage", "商品を追加しました");
			//フォワード
			request.getRequestDispatcher(Forward.CART_PAGE).forward(request, response);

		}
		catch (Exception e){
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}

	}

}
