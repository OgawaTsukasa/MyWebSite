package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ItemDataBeans;
import dao.ItemDAO;

/**
 * 商品一覧画面
 */
@WebServlet("/ItemList")
public class ItemList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//1ページに表示する商品数
	final static int pageMaxItemCount = 6;

	/**
	 * 商品一覧画面
	 * param : page_num (現在の表示ページ)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
			//表示ページ番号の取得  未指定の場合 1ページ目を表示
			int pageNum = Integer.parseInt(request.getParameter("page_num") == null ? "1" : request.getParameter("page_num"));
			//表示分の商品リストを取得
			ArrayList<ItemDataBeans>itemList = ItemDAO.getItemData(pageNum, pageMaxItemCount);

			//商品の総ページ数を取得
			double itemCount = ItemDAO.getItemListCount();
			int pageMax = (int) Math.ceil(itemCount / pageMaxItemCount);

			//検索ページurl
			request.setAttribute("url", "ItemList");
			//検索ワード
			request.setAttribute("name", "生地");
			//総アイテム数
			request.setAttribute("itemCount", (int) itemCount);
			// 総ページ数
			request.setAttribute("pageMax", pageMax);
			// 表示ページ
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("itemList", itemList);

			RequestDispatcher dispatcher = request.getRequestDispatcher(Forward.ITEM_PAGE);
			dispatcher.forward(request, response);

		} catch (Exception e) {
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
