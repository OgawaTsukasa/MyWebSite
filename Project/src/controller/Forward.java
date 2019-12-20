package controller;

public class Forward {

	/**
	 * フォワード簡略化クラス
	 *
	 */
		// TOPページ
		static final String TOP_PAGE = "/WEB-INF/jsp/index.jsp";

		// 寸法方法ページ
		static final String SIZING_PAGE = "/WEB-INF/jsp/size.jsp";

		// 商品ページ
		static final String ITEM_PAGE = "/WEB-INF/jsp/itemList.jsp";

		// 商品詳細ページ
		static final String ITEM_DETAIL_PAGE = "/WEB-INF/jsp/itemDetail.jsp";

		// エラーページ
		static final String ERROR_PAGE = "/WEB-INF/jsp/error.jsp";

		// 買い物かごページ
		static final String CART_PAGE = "/WEB-INF/jsp/cart.jsp";

		// オーダー入力ページ
		static final String ORDER_PAGE = "/WEB-INF/jsp/order.jsp";

		// 購入
		static final String BUY_PAGE = "/WEB-INF/jsp/buy.jsp";

		// 購入内容確認
		static final String BUY_CONFIRM_PAGE = "/WEB-INF/jsp/buyConfirm.jsp";

		// 購入完了
		static final String BUY_RESULT_PAGE = "/WEB-INF/jsp/buyResult.jsp";

		// ユーザー情報
		static final String USER_DATA_PAGE = "/WEB-INF/jsp/userData.jsp";

		// ユーザー情報更新確認
		static final String USER_DATA_UPDATE_CONFIRM_PAGE = "/WEB-INF/jsp/userDataUpdateConfirm.jsp";

		// ユーザー情報更新完了
		static final String USER_DATA_UPDATA_RESULT_PAGE = "/WEB-INF/jsp/userDataUpdateResult.jsp";

		// ユーザー購入履歴
		static final String USER_BUY_HISTORY_DETAIL_PAGE = "/WEB-INF/jsp/userBuyHistoryDetail.jsp";

		// ログイン
		static final String LOGIN_PAGE = "/WEB-INF/jsp/login.jsp";

		// ログアウト
		static final String LOGOUT_PAGE = "/WEB-INF/jsp/logout.jsp";

		// 新規登録
		static final String REGIST_PAGE = "/WEB-INF/jsp/regist.jsp";

		// 新規登録入力内容確認
		static final String REGIST_CONFIRM_PAGE = "/WEB-INF/jsp/registConfirm.jsp";

		// 新規登録完了
		static final String REGIST_RESULT_PAGE = "/WEB-INF/jsp/registResult.jsp";



		public static Forward getInstance() {
			return new Forward();
		}

}
