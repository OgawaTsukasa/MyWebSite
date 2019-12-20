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
import beans.BuyDetailBeans;
import beans.BuyItemBeans;
import beans.UserDataBeans;
import dao.BuyDAO;
import dao.UserDAO;
import dao.UserInfoDAO;

/**
 * Servlet implementation class BuyResult
 */
@WebServlet("/BuyResult")
public class BuyResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		try{
			//カート情報の取得
			ArrayList<BuyItemBeans> cart = (ArrayList<BuyItemBeans>) Helper.cutSessionAttribute(session,"cart");
			//オーダー情報の取得
			BuyBeans buyDate = (BuyBeans) Helper.cutSessionAttribute(session,"orderData");

			//ログイン確認
			boolean isLogin = session.getAttribute("isLogin") != null ? (boolean) session.getAttribute("isLogin") : false;

			UserDataBeans UserData = new UserDataBeans();
			if(isLogin) {
				//ユーザーIDをセッションから取得
				UserData.setUserId((int) session.getAttribute("userId"));
				//サイズIDと個人情報IDを取得
				UserData = UserDAO.getUserDataId(UserData.getUserId());
			}else {
				//非会員の個人情報を登録
				UserData.setPersonalId(UserInfoDAO.insertPersonal(buyDate.getPersonalInfo(),UserData.getUserId()));
			}

			//購入データを登録
			int buyId = BuyDAO.insertBuy(buyDate,UserData.getUserId());

			//サイズ情報を、非会員は登録：会員は更新
			UserData.setSizeId(UserInfoDAO.BuySize(buyDate,UserData));

			// 購入詳細情報を購入情報IDに紐づけして登録
			for (BuyItemBeans cartInItem : cart) {
				BuyDetailBeans buyDetail = new BuyDetailBeans();
				buyDetail.setBuyId(buyId);
				buyDetail.setSizeId(UserData.getSizeId());
				buyDetail.setPersonalId(UserData.getPersonalId());
				buyDetail.setItemId(cartInItem.getItemId());
				buyDetail.setItemNum(cartInItem.getNum());
				BuyDAO.insertBuyDetail(buyDetail);
			}

			/* ====購入完了ページ表示用==== */
			BuyBeans resultBuy = BuyDAO.getBuyBeansByBuyId(buyId);
			request.setAttribute("resultBuy", resultBuy);

			// 購入アイテム情報
			ArrayList<BuyItemBeans> buyItem = BuyDAO.getItemDataBeansListByBuyId(buyId);
			request.setAttribute("buyItem", buyItem);

			request.getRequestDispatcher(Forward.BUY_RESULT_PAGE).forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}

}
