package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ItemDataBeans;
import dao.ItemDAO;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/DetailServlet")
public class ItemDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//選択された商品をint型に変換し利用
		int Data = Integer.parseInt(request.getParameter("id"));
		try {
			//選択されたアイテムの情報を取得
			ItemDataBeans item = ItemDAO.getItemDetail(Data);

			//商品をリクエストパラメータにセット
			request.setAttribute("item",item );

				//取得したアイテム情報をjspにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher(Forward.ITEM_DETAIL_PAGE);
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
