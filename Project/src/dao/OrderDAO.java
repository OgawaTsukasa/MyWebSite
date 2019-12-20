package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import base.DBManager;
import beans.OrderButtonDesignBeans;
import beans.OrderNameColorBeans;
import beans.OrderNameDesignBeans;
import beans.OrderPocketBeans;

/**
 * DBに登録されている各種オーダーに関する情報の取得
 * @author let-i
 *
 */

public class OrderDAO {


	/**
	 *
	 * シルエット情報をIDをもとに取得
	 * @param silhouetteId
	 * @return silhouetteType [String] : シルエットのタイプ
	 * @throws SQLException
	 */
	public static String getOrderSilhouette(int silhouetteId)  throws SQLException {
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM silhouette_design WHERE id = ?");
			st.setInt(1,silhouetteId );

			ResultSet rs = st.executeQuery();

			String silhouette = "";
			if(rs.next()) {
				silhouette = rs.getString("type");
			}

			System.out.println("OrderSilhouette()によるsilhouetteId検索は完了しました");
			return silhouette;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}

	/**
	 *
	 * 襟情報をIDをもとに取得
	 * @param silhouetteId
	 * @return collarType [Strig] : 襟のタイプ
	 * @throws SQLException
	 */
	public static String getOrderColler(CharSequence collerId) throws SQLException {

		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT type FROM collar_design WHERE id = ?");
			st.setObject(1,collerId);

			ResultSet rs = st.executeQuery();

			String  collarType = "";
			if(rs.next()) {
				 collarType = rs.getString("type");
			}

			System.out.println("OrderColler()によるcollerId検索は完了しました");
			return  collarType;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}

	/**
	 *
	 * カフスのデザイン情報をcuffsDesingIdをもとに取得
	 * @param cuffsDesignId
	 * @return cuffsDesingType [String] : カフスのデザインタイプ
	 * @throws SQLException
	 */
	public static String getOrderCuffsDesing(CharSequence cuffsDesignId) throws SQLException {

		Connection con =null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT type FROM cuffs_design WHERE id = ?");
			st.setObject(1,cuffsDesignId);

			ResultSet rs = st.executeQuery();
			String cuffsDesignType = "";

			if(rs.next()) {
				cuffsDesignType = rs.getString("type");
			}
			System.out.println("OrderCuffsDesign()によるcuffsDesignId検索は完了しました");
			return cuffsDesignType;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}


	/**
	 *
	 * カフスのボタン情報をcuffsButtonIdをもとに取得
	 * @param cuffsButtonId
	 * @return cuffsButtonType [String] : カフスのボタンタイプ
	 * @throws SQLException
	 */
	public static String getOrderCuffsButton(CharSequence cuffsButtonId) throws SQLException{

		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT type FROM cuffs_button WHERE id = ?");
			st.setObject(1,cuffsButtonId);

			ResultSet rs = st.executeQuery();
			String cuffsButtonType = "";

			if(rs.next()) {
				cuffsButtonType = rs.getString("type");
			}
			System.out.println("OrderCuffsButton()によるcuffsButtonId検索は完了しました");
			return cuffsButtonType;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}


	/**
	 *
	 * カフスの時計仕様情報をcuffsButtonIdをもとに取得
	 * @param cuffsButtonId
	 * @return cuffsWatchType [String] : カフスの時計仕様
	 * @throws SQLException
	 */
	public static String getOrderCuffsWatch(CharSequence cuffsWatchId) throws SQLException{

		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT type FROM cuffs_watch WHERE id = ?");
			st.setObject(1,cuffsWatchId);

			ResultSet rs = st.executeQuery();
			String OderCuffsWatch = "";

			if(rs.next()) {
				OderCuffsWatch = rs.getString("type");
			}
			System.out.println("OrderCuffsWatch()によるcuffsButtonId検索は完了しました");
			return OderCuffsWatch;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}

	/**
	 *
	 * ポケット情報をpocketIdをもとに取得
	 * @param  pocketId
	 * @return poketData [OrderPocketBeans] : カフスの情報を持つBeans
	 * @throws SQLException
	 */
	public static OrderPocketBeans getOrderPocket(CharSequence pocketId) throws SQLException{
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM pocket_design WHERE id = ?");
			st.setObject(1,pocketId);

			ResultSet rs = st.executeQuery();
			OrderPocketBeans poketData = new OrderPocketBeans();

			if(rs.next()) {
				poketData.setPoketId(rs.getInt("id"));
				poketData.setPocketType(rs.getString("type"));
				poketData.setPoketPrice(rs.getInt("price"));
			}
			System.out.println("pocketIdによるポケット情報検索は完了しました");
			return poketData;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally{
			if(con != null) {
				con.close();
			}
		}
	}

	/**
	 *
	 * ネームデザイン情報をpocketIdをもとに取得
	 * @param  nameDesignId
	 * @return nDsingData [OrderNameDesignBeans] : ネームデザインの情報を持つBeans
	 * @throws SQLException
	 */
	public static OrderNameDesignBeans getOrderNameDesign(String nameDesignId) throws SQLException{
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM name_design WHERE id = ?");
			st.setString(1, nameDesignId);

			ResultSet rs = st.executeQuery();
			OrderNameDesignBeans nDesignData = new OrderNameDesignBeans();

			if(rs.next()) {
				nDesignData.setDesignId(rs.getInt("id"));
				nDesignData.setDesignType(rs.getString("type"));
				nDesignData.setDesignPrice(rs.getInt("price"));
			}
			System.out.println("OrderNameDesign()によるnameDesignId検索は完了しました");
			return nDesignData;

			}catch(SQLException e) {
				System.out.println(e);
				throw new SQLException(e);
			}finally {
				if(con != null) {
					con.close();
				}
			}
		}

	/**
	 *
	 * ネームカラー情報をnameColorIdをもとに取得
	 * @param  nameColorId
	 * @return nColorData [OrderNameColorBeans] : ネームカラーの情報を持つBeans
	 * @throws SQLException
	 */
	 public static OrderNameColorBeans getOrderNameColor(String nameColorId) throws SQLException{
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM name_color WHERE id = ?");
			st.setString(1, nameColorId);

			ResultSet rs = st.executeQuery();
			OrderNameColorBeans nColorData = new OrderNameColorBeans();

			if(rs.next()) {
				nColorData.setColorId(rs.getInt("id"));
				nColorData.setColorType(rs.getString("type"));
				nColorData.setColorPrice(rs.getInt("price"));
			}
			System.out.println("OrderNameColor()によるnameColorId検索は完了しました");
			return nColorData;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}

	 /**
	 *
	 * ネームポジション情報をnamePositionIdをもとに取得
	 * @param  namePositionId
	 * @return namePositionType [String]
	 * @throws SQLException
	 */
	public static String getOrderNamePosition(String namePositionId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT type FROM name_position WHERE id = ?");
			st.setString(1,namePositionId);

			ResultSet rs = st.executeQuery();
			String namePositionType = "";

			if(rs.next()) {
				namePositionType = rs.getString("type");
			}
			System.out.println("OrderNameColor()によるnameColorId検索は完了しました");
			return namePositionType;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}

	 /**
	 *
	 * ボタンデザイン情報をbuttonDesignIdをもとに取得
	 * @param  buttonDesignId
	 * @return namePositionType [OrderButtonDesignBeans] : ネームポジションの情報を持つBeans
	 * @throws SQLException
	 */
	public static OrderButtonDesignBeans getOrderButtonDesign(int buttonDesignId) throws SQLException{
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM button_design WHERE id = ?");
			st.setInt(1,buttonDesignId);

			ResultSet rs = st.executeQuery();
			OrderButtonDesignBeans bDesignData = new OrderButtonDesignBeans();

			if(rs.next()) {
				bDesignData.setButtonId(rs.getInt("id"));
				bDesignData.setButtonTyupe(rs.getString("type"));
				bDesignData.setButtonPrice(rs.getInt("price"));
			}
			System.out.println("OrderButtonDesign()によるbuttonDesignId検索は完了しました");
			return bDesignData;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}

	 /**
	 *
	 * ボタン糸情報をbuttonThreadIdをもとに取得
	 * @param  buttonThreadId
	 * @return bThreadData [String]
	 * @throws SQLException
	 */
	public static String getOrderButtonThread(int buttonThreadId) throws SQLException {

		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT type FROM button_thread WHERE id = ?");
			st.setInt(1,buttonThreadId);

			ResultSet rs = st.executeQuery();
			String bThreadData = "";

			if(rs.next()) {
				bThreadData = rs.getString("type");
			}
			System.out.println("OrderButtonThread()によるbuttonThreadId検索は完了しました");
			return bThreadData;

		}catch(SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}
}