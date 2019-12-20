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
import dao.ItemDAO;

/**
 * キーワード別検索
 */
@WebServlet("/ItemWordSearch")
public class ItemWordSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//1ページに表示する商品数
		final static int pageMaxItemCount = 6;

		/**
		 * 検索結果画面
		 *
		 * param : id (検索ワード)
		 * param : page_num (現在の表示ページ)
		 *
		 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*文字化け対策*/
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		try{
			//検索ワードの取得
			String searchWord = request.getParameter("id");
			//表示ページ番号 未指定の場合 1ページ目を表示
			int pageNum = Integer.parseInt(request.getParameter("page_num") == null ? "1" : request.getParameter("page_num"));
			// 商品リストを取得（ページ表示分のみ）
			ArrayList<ItemDataBeans> searchItemList = ItemDAO.getItemsByItemName(searchWord, pageNum, pageMaxItemCount);

			// 検索ワードに対しての総ページ数を取得
			double itemCount = ItemDAO.getItemCount(searchWord);
			int pageMax = (int) Math.ceil(itemCount / pageMaxItemCount);

			//検索ページurl
			request.setAttribute("url", "ItemWordSearch");
			//表示ワード
			request.setAttribute("name", searchWord);
			//検索ワード
			request.setAttribute("word", searchWord);
			//総アイテム数
			request.setAttribute("itemCount", (int) itemCount);
			// 総ページ数
			request.setAttribute("pageMax", pageMax);
			// 表示ページ
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("itemList", searchItemList);


			request.getRequestDispatcher(Forward.ITEM_PAGE).forward(request, response);
		}catch (Exception e) {
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
