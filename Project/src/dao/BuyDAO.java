package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import base.DBManager;
import beans.BrandDataBeans;
import beans.BuyBeans;
import beans.BuyDetailBeans;
import beans.BuyItemBeans;
import beans.OrderButtonDesignBeans;
import beans.OrderNameColorBeans;
import beans.OrderNameDesignBeans;
import beans.OrderPocketBeans;
import beans.OrderPriceBeans;
import beans.OrderRequestBeans;

public class BuyDAO {


	/**
	 * 購入情報登録処理
	 * @param userId
	 * @param ordereDate 購入情報
	 * @return  buyId 登録した購入情報のID
	 *
	 * @throws SQLException 呼び出し元にスローさせるため
	 */
	public static int insertBuy(BuyBeans buyDate, int userId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		int buyId = -1;
		try{
			con = DBManager.getConnection();
			st = con.prepareStatement("INSERT INTO buy(user_id, total_price, total_num, silhouetteType, collarType, collarRequest, cuffsDesign, cuffsButtonType, cuffsWatchType, cuffsRequest, pocketDesign_id, pocketRequest, nameMessage, nameDesign_id, nameSpelling, nameColor1_id, nameColor2_id, namePosition, buttonDesign_id, buttonThread1, buttonThread2, otherRequest, create_date)"
													+" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
													Statement.RETURN_GENERATED_KEYS);
			st.setInt(1,userId);
			st.setInt(2, buyDate.getPrice().getTotal());
			st.setInt(3, buyDate.getTotalNum());
			st.setString(4, buyDate.getSilhouetteType());
			st.setString(5, buyDate.getCollarType());
			st.setString(6, buyDate.getRequestBeans().getCollarRequest());
			st.setString(7, buyDate.getCuffsDesignType());
			st.setString(8, buyDate.getCuffsButtonType());
			st.setString(9, buyDate.getCuffsWatchType());
			st.setString(10, buyDate.getRequestBeans().getCuffsRequest());
			st.setInt(11, buyDate.getPocketBeans().getPoketId());
			st.setString(12, buyDate.getRequestBeans().getPocketRequest());
			st.setString(13, buyDate.getNameMessage());
			if(buyDate.getNameMessage().equals("ネームを入いれる")) {
				st.setInt(14, buyDate.getNameDesignBeans().getDesignId());
				st.setString(15, buyDate.getNameSpelling());
				if(buyDate.getNameColorBeans1() != null){
					st.setInt(16, buyDate.getNameColorBeans1().getColorId());
				}else {
					st.setInt(16, 0);
				}

				if(buyDate.getNameColorBeans2() != null) {
					st.setInt(17, buyDate.getNameColorBeans2().getColorId());
				}else {
					st.setInt(17, 0);
				}
				st.setString(18, buyDate.getNamePosition());
			}else {
				st.setInt(14, 0);
				st.setNull(15, java.sql.Types.NULL);
				st.setInt(16, 0);
				st.setInt(17, 0);
				st.setNull(18, java.sql.Types.NULL);
			}
			st.setInt(19, buyDate.getButtonDesignBeans().getButtonId());
			st.setString(20, buyDate.getButtonThread1());
			st.setString(21, buyDate.getButtonThread2());
			st.setString(22, buyDate.getRequestBeans().getOtherRequest());
			st.setTimestamp(23, new Timestamp(System.currentTimeMillis()));
			st.executeUpdate();

			ResultSet rs = st.getGeneratedKeys();

			if (rs != null && rs.next()) {
			    buyId = rs.getInt(1);
			}
			System.out.println("購入情報の登録は完了しました。");

			return buyId;

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
	 * 購入詳細登録処理
	 * @param buyDetail BuyDetailBeans
	 * @throws SQLException
	 * 			呼び出し元にスローさせるため
	 */
	public static void insertBuyDetail(BuyDetailBeans buyDetail) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("INSERT INTO buy_detail(buy_id, item_id, item_num, personal_id, size_id) VALUES(?,?,?,?,?)");
			st.setInt(1, buyDetail.getBuyId());
			st.setInt(2, buyDetail.getItemId());
			st.setInt(3, buyDetail.getItemNum());
			st.setInt(4, buyDetail.getPersonalId());
			st.setInt(5, buyDetail.getSizeId());
			st.executeUpdate();
			System.out.println("inserting BuyDetail has been completed");

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
	 * 購入IDによる購入情報検索
	 * @param buyId
	 * @return BuyBeans
	 * 				購入情報のデータを持つJavaBeans
	 * @throws SQLException
	 * 				呼び出し元にスローさせるため
	 */

	public static BuyBeans getBuyBeansByBuyId(int buyId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM buy "+
										" JOIN pocket_design ON buy.pocketDesign_id = pocket_design.id"+
										" LEFT JOIN name_design ON buy.nameDesign_id = name_design.id"+
										" LEFT JOIN name_color `color1` ON buy.nameColor1_id = color1.id "+
										" LEFT JOIN name_color `color2` ON buy.nameColor2_id = color2.id"+
										" JOIN button_design ON buy.buttonDesign_id = button_design.id"+
										" WHERE buy.id = ?");

			st.setInt(1, buyId);

			ResultSet rs = st.executeQuery();

			BuyBeans buyData = new BuyBeans();
			if (rs.next()) {
				OrderPriceBeans Price = new OrderPriceBeans();
				Price.setTotal(rs.getInt("total_price"));

				int optionPrice = 0;
				optionPrice += (rs.getInt("pocket_design.price"));
				if(rs.getInt("nameDesign_id") != 0) {
					optionPrice += (rs.getInt("name_design.price"));
				}
				if(rs.getInt("nameColor1_id") != 0) {
					optionPrice += (rs.getInt("color1.price"));
				}
				if(rs.getInt("nameColor2_id") != 0) {
					optionPrice += (rs.getInt("color2.price"));
				}
				optionPrice += (rs.getInt("button_design.price"));
				Price.setOptionPrice(optionPrice);

				buyData.setPrice( Price);
				buyData.setTotalNum(rs.getInt("total_num"));
				buyData.setBuyDate(rs.getTimestamp("create_date"));
			}

			System.out.println("購入IDによる購入情報検索は完了しました。");

			return buyData;
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
	 * 購入IDによる商品情報検索
	 * @param buyId
	 * @return ArrayList<CartBeans>
	 * 				購入商品のデータを持つJavaBeansのリスト
	 * @throws SQLException
	 * 				呼び出し元にスローさせるため
	 */

	public static ArrayList<BuyItemBeans> getItemDataBeansListByBuyId(int buyId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try{
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT buy_detail.id, item_num, price, cloth FROM buy_detail"
										+ " JOIN buy ON buy_detail.buy_id = buy.id"
										+ " JOIN item ON buy_detail.item_id = item.id"
										+ " WHERE buy.id = ?");
			st.setInt(1, buyId);

			ResultSet rs = st.executeQuery();
			ArrayList<BuyItemBeans> buyItemList = new ArrayList<BuyItemBeans>();

			while(rs.next()) {
				BuyItemBeans buyItem = new BuyItemBeans();
				buyItem.setNum(rs.getInt("item_num"));
				buyItem.setSubPrice(rs.getInt("price"));
				buyItem.setCloth(rs.getString("cloth"));

				buyItemList.add(buyItem);
			}
			System.out.println("購入IDによる商品情報検索は完了しました。");

			return buyItemList;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if (con != null) {
				con.close();
			}
		}
	}


	/**
	 * ユーザーIDによる購入情報検索
	 * @param userId
	 * @return List<BuyBeans>
	 * 				ユーザーの購入情報リスト
	 * @throws SQLException
	 * 				呼び出し元にスローさせるため
	 */
	public static List<BuyBeans> getBuyData(int userId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try{
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT id, total_price, create_date FROM buy WHERE user_id = ? ORDER BY create_date DESC");

			st.setInt(1, userId);
			ResultSet rs = st.executeQuery();

			List<BuyBeans> BuyList = new ArrayList<BuyBeans>();

			while(rs.next()) {
				OrderPriceBeans totalPrice = new OrderPriceBeans();
				totalPrice.setTotal(rs.getInt("total_price"));

				BuyBeans buyData = new BuyBeans();
				buyData.setBuyId(rs.getInt("id"));
				buyData.setBuyDate(rs.getTimestamp("create_date"));
				buyData.setPrice(totalPrice);

				BuyList.add(buyData);
			}
			System.out.println("ユーザーIDによる購入情報検索は完了しました。");

			return BuyList;
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
	 * 購入IDによる購入履歴検索（商品詳細）
	 * @param buyId
	 * @return ArrayList<CartBeans>
	 * 				購入商品のデータを持つJavaBeansのリスト
	 * @throws SQLException
	 * 				呼び出し元にスローさせるため
	 */
	public static List<BuyItemBeans> BuyItemHistory(int buyId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try{
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT buy_detail.id, item.id, item_num, price, cloth, b_name, remark, material, file_name1" +
										"	FROM buy_detail" +
										"	JOIN buy ON buy_detail.buy_id = buy.id" +
										"	JOIN item ON buy_detail.item_id = item.id" +
										"	JOIN brand ON item.brand_id = brand.id" +
										"	WHERE buy.id = ?");
			st.setInt(1, buyId);

			ResultSet rs = st.executeQuery();
			ArrayList<BuyItemBeans> buyItemList = new ArrayList<BuyItemBeans>();

			while(rs.next()) {
				BuyItemBeans buyItem = new BuyItemBeans();
				buyItem.setItemId(rs.getInt("item.id"));
				buyItem.setNum(rs.getInt("item_num"));
				buyItem.setCloth(rs.getString("cloth"));
				buyItem.setUnitPrice(rs.getInt("price"));
				buyItem.setCloth(rs.getString("cloth"));
				buyItem.setRemark(rs.getString("remark"));
				buyItem.setMaterial(rs.getString("material"));
				buyItem.setItemFile(rs.getString("file_name1"));

				BrandDataBeans brandData = new BrandDataBeans();
				brandData.setbName(rs.getString("b_name"));
				buyItem.setBrandDataBeans(brandData);

				buyItemList.add(buyItem);
			}
			System.out.println("購入IDによる商品情報検索は完了しました。");

			return buyItemList;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if (con != null) {
				con.close();
			}
		}
	}
	/**
	 * 購入IDによる購入履歴検索（オーダー詳細）
	 * @param buyId
	 * @return BuyBeans
	 * 				購入商品情報を持つBeans
	 * @throws SQLException
	 * 				呼び出し元にスローさせるため
	 */

	public static BuyBeans getBuyHistoryDetail(int buyId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try{
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM buy "+
											" JOIN pocket_design ON buy.pocketDesign_id = pocket_design.id"+
											" LEFT JOIN name_design ON buy.nameDesign_id = name_design.id"+
											" LEFT JOIN name_color `color1` ON buy.nameColor1_id = color1.id "+
											" LEFT JOIN name_color `color2` ON buy.nameColor2_id = color2.id"+
											" JOIN button_design ON buy.buttonDesign_id = button_design.id"+
											" WHERE buy.id = ?");
			st.setInt(1, buyId);

			ResultSet rs = st.executeQuery();

			BuyBeans buyHistory = new BuyBeans();

			if(rs.next()) {
				OrderPriceBeans price = new OrderPriceBeans();
				price.setTotal(rs.getInt("total_price"));
				buyHistory.setPrice(price);

				OrderRequestBeans orderRequest = new OrderRequestBeans();
				orderRequest.setCollarRequest(rs.getString("collarRequest"));
				orderRequest.setCuffsRequest(rs.getString("cuffsRequest"));
				orderRequest.setPocketRequest(rs.getString("pocketRequest"));
				orderRequest.setOtherRequest(rs.getString("otherRequest"));
				buyHistory.setRequestBeans(orderRequest);

				buyHistory.setTotalNum(rs.getInt("total_num"));
				buyHistory.setSilhouetteType(rs.getString("silhouetteType"));
				buyHistory.setCollarType(rs.getString("collarType"));
				buyHistory.setCuffsDesignType(rs.getString("cuffsDesign"));
				buyHistory.setCuffsButtonType(rs.getString("cuffsButtonType"));
				buyHistory.setCuffsWatchType(rs.getString("cuffsWatchType"));


				OrderPocketBeans pocket = new OrderPocketBeans();
				pocket.setPocketType(rs.getString("pocket_design.type"));
				pocket.setPoketPrice(rs.getInt("pocket_design.price"));
				buyHistory.setPocketBeans(pocket);


				buyHistory.setNameMessage(rs.getString("nameMessage"));
				if(rs.getString("nameMessage").equals("ネームを入いれる")) {
					OrderNameDesignBeans nameDesign = new OrderNameDesignBeans();
					nameDesign.setDesignType(rs.getString("name_design.type"));
					nameDesign.setDesignPrice(rs.getInt("name_design.price"));
					buyHistory.setNameDesignBeans(nameDesign);
					buyHistory.setNameSpelling(rs.getString("nameSpelling"));

					if(rs.getInt("nameColor1_id") != 0) {
						OrderNameColorBeans nameColor = new OrderNameColorBeans();
						nameColor.setColorType(rs.getString("color1.type"));
						nameColor.setColorPrice(rs.getInt("color1.price"));
						buyHistory.setNameColorBeans1(nameColor);
					}if(rs.getInt("nameColor2_id") != 0) {
						OrderNameColorBeans nameColor = new OrderNameColorBeans();
						nameColor.setColorType(rs.getString("color2.type"));
						nameColor.setColorPrice(rs.getInt("color2.price"));
						buyHistory.setNameColorBeans2(nameColor);
					}
					buyHistory.setNamePosition(rs.getString("namePosition"));
				}

				if(rs.getInt("buttonDesign_id") != 0) {
					OrderButtonDesignBeans buttonDesign = new OrderButtonDesignBeans();
					buttonDesign.setButtonTyupe(rs.getString("button_design.type"));
					buttonDesign.setButtonPrice(rs.getInt("button_design.price"));
					buyHistory.setButtonDesignBeans(buttonDesign);
				}
				buyHistory.setButtonThread1(rs.getString("buttonThread1"));
				buyHistory.setButtonThread2(rs.getString("buttonThread2"));



			}
			System.out.println("購入IDによるオーダー情報検索は完了しました。");

			return buyHistory;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if (con != null) {
				con.close();
			}
		}
	}
}
