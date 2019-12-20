package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ItemDataBeans;
import dao.ItemDAO;

/**
 * 金額別検索
 */
@WebServlet("/ItemPriceSearch")
public class ItemPriceSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//1ページに表示する商品数
	final static int pageMaxItemCount = 6;

	/**
	 * 検索結果画面
	 *
	 * param : id (選択No)
	 * param : name (検索金額)
	 * param : page_num (現在の表示ページ)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String priceId = request.getParameter("id");
			String price = request.getParameter("name");
			//表示ページ番号 未指定の場合 1ページ目を表示
			int pageNum = Integer.parseInt(request.getParameter("page_num") == null ? "1" : request.getParameter("page_num"));

			// 商品リストを取得 ページ表示分のみ
			ArrayList<ItemDataBeans> itemPriceList = ItemDAO.getItemPriceData(priceId, pageNum, pageMaxItemCount);

			// 検索ワードに対しての総ページ数を取得
			double itemCount = ItemDAO.getItemPriceCount(priceId);
			int pageMax = (int) Math.ceil(itemCount / pageMaxItemCount);

			//検索ページurl
			request.setAttribute("url", "ItemPriceSearch");
			//表示ワード
			request.setAttribute("name", price);
			//検索ワード
			request.setAttribute("word", priceId);
			//総アイテム数
			request.setAttribute("itemCount", (int) itemCount);
			// 総ページ数
			request.setAttribute("pageMax", pageMax);
			// 表示ページ
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("itemList", itemPriceList);

			RequestDispatcher dispatcher = request.getRequestDispatcher(Forward.ITEM_PAGE);
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
