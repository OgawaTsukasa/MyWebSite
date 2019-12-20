package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import base.DBManager;
import beans.BrandDataBeans;
import beans.BuyItemBeans;
import beans.ItemDataBeans;

public class ItemDAO {



	/**
	 * 商品IDによる商品詳細情報の取得
	 * @param itemId
	 * @return ItemDataBeans 商品の詳細情報を格納したBeans
	 * @throws SQLException
	 */
	public static ItemDataBeans  getItemDetail(int itemId) throws SQLException{
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM item"
									+ " JOIN brand"
									+ " ON item.brand_id = brand.id"
									+ " WHERE item.id = ?");
			st.setInt(1, itemId);

			ResultSet rs = st.executeQuery();
			ItemDataBeans item = new ItemDataBeans();

			if (rs.next()) {
				item.setId(rs.getInt("id"));
				item.setBrandId(rs.getInt("brand_id"));
				item.setMaterial(rs.getString("material"));
				item.setPrice(rs.getInt("price"));
				item.setColor(rs.getString("color"));
				item.setRemark(rs.getString("remark"));
				item.setDepth(rs.getInt("depth"));
				item.setCloth(rs.getString("cloth"));
				item.setDetail(rs.getString("detail"));
				item.setFileName1(rs.getString("file_name1"));
				item.setFileName2(rs.getString("file_name2"));

				BrandDataBeans brandDataBeans = new BrandDataBeans();
				brandDataBeans.setcName(rs.getString("c_name"));
				brandDataBeans.setbName(rs.getString("b_name"));
				item.setBrandDataBeans(brandDataBeans);



			}
			System.out.println("商品IDによる商品詳細検索を完了しました。");
			return item;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}


	/**
	 * 商品IDによる商品詳細情報の取得
	 * @param itemId
	 * @return ItemDataBeans 商品の詳細情報を格納したBeans
	 * @throws SQLException
	 */
	public static BuyItemBeans getCartItemDetail(int id, int num) throws SQLException{
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM item"
									+ " JOIN brand"
									+ " ON item.brand_id = brand.id"
									+ " WHERE item.id = ?");
			st.setInt(1, id);

			ResultSet rs = st.executeQuery();
			BuyItemBeans cartItem = new BuyItemBeans();

			if (rs.next()) {
				cartItem.setItemId(rs.getInt("id"));
				cartItem.setBrandId(rs.getInt("brand_id"));
				cartItem.setMaterial(rs.getString("material"));
				cartItem.setRemark(rs.getString("remark"));
				cartItem.setCloth(rs.getString("cloth"));
				cartItem.setNum(num);
				cartItem.setUnitPrice(rs.getInt("price"));
				cartItem.setSubPrice(cartItem.getUnitPrice() * num);

				BrandDataBeans brandDataBeans = new BrandDataBeans();
				brandDataBeans.setbName(rs.getString("b_name"));
				cartItem.setBrandDataBeans(brandDataBeans);



			}
			System.out.println("商品IDによる商品詳細情報の取得は完了しました。");
			return cartItem;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}


	/**
	 * 商品情報の取得（全商品）
	 * @param searchWord
	 * @param pageNum
	 * @param pageMaxItemCount
	 *
	 * @return ArrayList<ItemDataBeans> 表示分のアイテム情報がセットされたBeans
	 * @throws SQLException
	 */

	public static ArrayList<ItemDataBeans> getItemData(int pageNum, int pageMaxItemCount) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			int startiItemNum = (pageNum - 1) * pageMaxItemCount;
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM item"
									+ " JOIN brand"
									+ " ON item.brand_id = brand.id"
									+ " ORDER BY item.id ASC LIMIT ?,?");
			st.setInt(1, startiItemNum);
			st.setInt(2, pageMaxItemCount);

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans item = new ItemDataBeans();
				item.setId(rs.getInt("id"));
				item.setBrandId(rs.getInt("brand_id"));
				item.setMaterial(rs.getString("material"));
				item.setPrice(rs.getInt("price"));
				item.setCloth(rs.getString("cloth"));
				item.setFileName1(rs.getString("file_name1"));

				BrandDataBeans brandDataBeans = new BrandDataBeans();
				brandDataBeans.setcName(rs.getString("c_name"));
				brandDataBeans.setbName(rs.getString("b_name"));
				item.setBrandDataBeans(brandDataBeans);

				itemList.add(item);


			}
			System.out.println("全アイテム情報の取得は完了しました。");
			return itemList;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}
	/**
	 * 商品の総数を取得
	 *
	 * @return coung[double] 商品総数
	 * @throws SQLException
	 */

	public static double getItemListCount() throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT  count(*) AS cnt FROM item"
											+ " JOIN brand"
											+ " ON item.brand_id = brand.id");
			ResultSet rs = st.executeQuery();
			double coung = 0.0;
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品情報の取得（ブランド検索）
	 * @param brandId
	 * @param pageNum
	 * @param pageMaxItemCount
	 *
	 * @return ArrayList<ItemDataBeans> 表示分のアイテム情報がセットされたBeans
	 * @throws SQLException
	 */
	public static ArrayList<ItemDataBeans> getItemBrandData(String brandId, int pageNum, int pageMaxItemCount) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			int startiItemNum = (pageNum - 1) * pageMaxItemCount;
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM item"
									+ " JOIN brand"
									+ " ON item.brand_id = brand.id"
									+ " WHERE brand.id = ? ORDER BY item.id ASC LIMIT ?,?");
			st.setString(1,brandId);
			st.setInt(2, startiItemNum);
			st.setInt(3, pageMaxItemCount);

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans item = new ItemDataBeans();
				item.setId(rs.getInt("id"));
				item.setBrandId(rs.getInt("brand_id"));
				item.setMaterial(rs.getString("material"));
				item.setPrice(rs.getInt("price"));
				item.setCloth(rs.getString("cloth"));
				item.setFileName1(rs.getString("file_name1"));

				BrandDataBeans brandDataBeans = new BrandDataBeans();
				brandDataBeans.setcName(rs.getString("c_name"));
				brandDataBeans.setbName(rs.getString("b_name"));
				item.setBrandDataBeans(brandDataBeans);

				itemList.add(item);


			}
			System.out.println("ブランド検索によるアイテム情報の取得は完了しました。");
			return itemList;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * ブランド検索の総数を取得
	 *
	 * @param brandId
	 * @return coung[double] 検索総数
	 * @throws SQLException
	 */

	public static double getSearchBrandCount(String brandId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT  count(*) AS cnt FROM item"
											+ " JOIN brand"
											+ " ON item.brand_id = brand.id"
											+ " WHERE brand.id = ?");
			st.setString(1, brandId );
			ResultSet rs = st.executeQuery();
			double coung = 0.0;
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品情報の取得（カラー検索）
	 * @param color
	 * @param pageNum
	 * @param pageMaxItemCount
	 *
	 * @return ArrayList<ItemDataBeans> 表示分のアイテム情報がセットされたBeans
	 * @throws SQLException
	 */
	public static ArrayList<ItemDataBeans> getItemColorData(String color, int pageNum, int pageMaxItemCount) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			int startiItemNum = (pageNum -1) * pageMaxItemCount;
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM item"
									+ " JOIN brand"
									+ " ON item.brand_id = brand.id"
									+ " WHERE color = ? ORDER BY item.id ASC LIMIT ?,?");

			st.setString(1, color);
			st.setInt(2, startiItemNum);
			st.setInt(3, pageMaxItemCount);

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while(rs.next()) {
				ItemDataBeans item = new ItemDataBeans();
				item.setId(rs.getInt("id"));
				item.setBrandId(rs.getInt("brand_id"));
				item.setMaterial(rs.getString("material"));
				item.setPrice(rs.getInt("price"));
				item.setCloth(rs.getString("cloth"));
				item.setFileName1(rs.getString("file_name1"));

				BrandDataBeans brandDataBeans = new BrandDataBeans();
				brandDataBeans.setcName(rs.getString("c_name"));
				brandDataBeans.setbName(rs.getString("b_name"));
				item.setBrandDataBeans(brandDataBeans);

				itemList.add(item);
			}

			System.out.println("カラー検索によるアイテム情報の取得は完了しました。");
			return itemList;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * カラー検索の総数を取得
	 *
	 * @param color
	 * @return coung[double] 検索総数
	 * @throws SQLException
	 */
	public static double getItemColorCount(String color) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT  count(*) AS cnt FROM item"
											+ " JOIN brand"
											+ " ON item.brand_id = brand.id"
											+ " WHERE color = ?");
			st.setString(1, color );
			ResultSet rs = st.executeQuery();
			double coung = 0.0;
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品情報の取得（金額検索）
	 * @param pagemaxitemcount
	 * @param pageNum
	 * @param searchWord
	 * @param pageNum
	 * @param pageMaxItemCount
	 *
	 * @return ArrayList<ItemDataBeans> 表示分のアイテム情報がセットされたBeans
	 * @throws SQLException
	 */
	public static ArrayList<ItemDataBeans> getItemPriceData(String Data, int pageNum, int pageMaxItemCount) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;

		try {
			int startiItemNum = (pageNum -1) * pageMaxItemCount;
			con = DBManager.getConnection();
			if(Data.equals("1")) {
				st = con.prepareStatement("SELECT * FROM item"
										+ " JOIN brand"
										+ " ON item.brand_id = brand.id"
										+ " WHERE price <= 18000"
										+ " ORDER BY item.id ASC LIMIT ?,?");

			}else if(Data.equals("2")) {
				st = con.prepareStatement("SELECT * FROM item"
										+ " JOIN brand"
										+ " ON item.brand_id = brand.id"
										+ " WHERE price > 18000 and price <= 20000"
										+ " ORDER BY item.id ASC LIMIT ?,?");

			}else if(Data.equals("3")) {
				st = con.prepareStatement("SELECT * FROM item"
										+ " JOIN brand"
										+ " ON item.brand_id = brand.id"
										+ " WHERE price > 20000 and price <= 25000"
										+ " ORDER BY item.id ASC LIMIT ?,?");
			}else if(Data.equals("4")) {
				st = con.prepareStatement("SELECT * FROM item"
										+ " JOIN brand"
										+ " ON item.brand_id = brand.id"
										+ " WHERE price > 25000"
										+ " ORDER BY item.id ASC LIMIT ?,?");
			}
			st.setInt(1, startiItemNum);
			st.setInt(2, pageMaxItemCount);

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while(rs.next()) {
				ItemDataBeans item = new ItemDataBeans();
				item.setId(rs.getInt("id"));
				item.setBrandId(rs.getInt("brand_id"));
				item.setMaterial(rs.getString("material"));
				item.setPrice(rs.getInt("price"));
				item.setCloth(rs.getString("cloth"));
				item.setFileName1(rs.getString("file_name1"));

				BrandDataBeans brandDataBeans = new BrandDataBeans();
				brandDataBeans.setcName(rs.getString("c_name"));
				brandDataBeans.setbName(rs.getString("b_name"));
				item.setBrandDataBeans(brandDataBeans);

				itemList.add(item);
			}

			System.out.println("金額検索によるアイテム情報の取得は完了しました。");
			return itemList;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 金額検索の総数を取得
	 *
	 * @param priceId
	 * @return coung[double] 検索総数
	 * @throws SQLException
	 */
	public static double getItemPriceCount(String priceId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			if(priceId.equals("1")) {
				st = con.prepareStatement("SELECT count(*) AS cnt FROM item"
										+ " JOIN brand"
										+ " ON item.brand_id = brand.id"
										+ " WHERE price <= 18000"
										+ " ORDER BY item.id");

			}else if(priceId.equals("2")) {
				st = con.prepareStatement("SELECT count(*) AS cnt FROM item"
										+ " JOIN brand"
										+ " ON item.brand_id = brand.id"
										+ " WHERE price > 18000 and price <= 20000"
										+ " ORDER BY item.id");

			}else if(priceId.equals("3")) {
				st = con.prepareStatement("SELECT count(*) AS cnt FROM item"
										+ " JOIN brand"
										+ " ON item.brand_id = brand.id"
										+ " WHERE price > 20000 and price <= 25000"
										+ " ORDER BY item.id");
			}else if(priceId.equals("4")) {
				st = con.prepareStatement("SELECT count(*) AS cnt FROM item"
										+ " JOIN brand"
										+ " ON item.brand_id = brand.id"
										+ " WHERE price > 25000"
										+ " ORDER BY item.id");
			}

			ResultSet rs = st.executeQuery();
			double coung = 0.0;
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品情報の取得（キーワード検索）
	 * @param searchWord
	 * @param pageNum
	 * @param pageMaxItemCount
	 *
	 * @return ArrayList<ItemDataBeans> 表示分のアイテム情報がセットされたBeans
	 * @throws SQLException
	 */
	public static ArrayList<ItemDataBeans> getItemsByItemName(String searchWord, int pageNum, int pageMaxItemCount) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try{
			int startiItemNum = (pageNum - 1) * pageMaxItemCount;
			con = DBManager.getConnection();

			if (searchWord.length() == 0) {
				// 全検索
				st = con.prepareStatement("SELECT * FROM item ORDER BY id ASC LIMIT ?,? ");
				st.setInt(1, startiItemNum);
				st.setInt(2, pageMaxItemCount);
			} else {
				// 商品名検索
				st = con.prepareStatement ("SELECT * FROM item" +
												"	JOIN brand ON brand_id = brand.id" +
												"	WHERE CONCAT(cloth,material,remark,detail,brand.c_name)" +
												"	LIKE ? ORDER BY item.id ASC LIMIT ?,?");
				st.setString(1,'%' + searchWord + '%');
				st.setInt(2, startiItemNum);
				st.setInt(3, pageMaxItemCount);
			}


			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans item = new ItemDataBeans();
				item.setId(rs.getInt("id"));
				item.setBrandId(rs.getInt("brand_id"));
				item.setMaterial(rs.getString("material"));
				item.setPrice(rs.getInt("price"));
				item.setCloth(rs.getString("cloth"));
				item.setFileName1(rs.getString("file_name1"));

				BrandDataBeans brandDataBeans = new BrandDataBeans();
				brandDataBeans.setcName(rs.getString("c_name"));
				brandDataBeans.setbName(rs.getString("b_name"));
				item.setBrandDataBeans(brandDataBeans);

				itemList.add(item);
			}
			System.out.println("キーワード検索によるアイテム情報の取得は完了しました。");
			return itemList;

		}catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * キーワード検索の総数を取得
	 *
	 * @param searchWord
	 * @return coung[double] 検索総数
	 * @throws SQLException
	 */
	public static double getItemCount(String searchWord) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT count(*) AS cnt FROM item" +
										"	JOIN brand ON brand_id = brand.id" +
										"	WHERE CONCAT(cloth,material,remark,detail,brand.c_name)" +
										"	LIKE ?");
			st.setString(1, "%" + searchWord + "%");
			ResultSet rs = st.executeQuery();
			double coung = 0.0;
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}
}
