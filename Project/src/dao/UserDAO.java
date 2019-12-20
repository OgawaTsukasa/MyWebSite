package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import base.DBManager;
import beans.UserDataBeans;
import controller.Helper;

public class UserDAO {

	/**
	 * データの挿入処理を行う。現在時刻は挿入直前に生成
	 * @param sizeId
	 * @param personalId
	 *
	 * @param user
	 *            対応したデータを保持しているJavaBeans
	 * @throws SQLException
	 *             呼び出し元にcatchさせるためにスロー
	 */
	public static void insertUser(UserDataBeans userData, int personalId, int sizeId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try{
			con = DBManager.getConnection();
			st = con.prepareStatement("INSERT INTO user (personal_id, size_id, login_id, password, create_date) VALUES(?,?,?,?,?)",
										Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, personalId);
			st.setInt(2, sizeId);
			st.setString(3,userData.getLoginId());
			st.setString(4,Helper.getSha256(userData.getPassword()));
			st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			st.executeUpdate();
			System.out.println("ユーザー情報の登録は完了しました。");

			ResultSet rs = st.getGeneratedKeys();

			int userId = 0;
			if (rs != null && rs.next()) {
				userId = rs.getInt(1);
			}

			//登録したユーザーIDを個人情報テーブルのuser_idカラムに登録
			st = con.prepareStatement("UPDATE personal_info SET user_id= ? WHERE id = ?");
			st.setInt(1, userId);
			st.setInt(2,personalId);
			st.executeUpdate();
			System.out.println("個人情報テーブルのuser_id登録は完了しました。");

		}catch(SQLException e){
			System.out.println(e.getMessage());
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}



	/**
	 * loginIdの重複チェック
	 *
	 * @param loginId
	 *            check対象のログインID
	 * @param userId
	 *            check対象から除外するuserID
	 * @return bool 重複している
	 * @throws SQLException
	 */
	public static boolean isOverlapLoginId(String loginId, int userId) throws SQLException {
		// 重複しているかどうか表す変数
		boolean isOverlap = false;
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			// 入力されたlogin_idが存在するか調べる
			st = con.prepareStatement("SELECT login_id FROM user WHERE login_id = ? AND id != ?");
			st.setString(1, loginId);
			st.setInt(2, userId);
			ResultSet rs = st.executeQuery();

			System.out.println("loginIdの検索は終了しました。");

			if (rs.next()) {
				isOverlap = true;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}

		System.out.println("loginIdの重複チェックは完了しました。");
		return isOverlap;
	}

	/**
	 * ユーザーIDを取得
	 *
	 * @param loginId
	 *            ログインID
	 * @param password
	 *            パスワード
	 * @return int ログインIDとパスワードが正しい場合対象のユーザーID，正しくない||登録されていない場合0
	 * @throws SQLException
	 *             呼び出し元にスロー
	 */
	public static int getUserId(String loginId, String password) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try{
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT * FROM user WHERE login_id = ?");
			st.setString(1,loginId);

			ResultSet rs = st.executeQuery();

			int userId = 0;
			while(rs.next()) {
				if(Helper.getSha256(password).equals(rs.getString("password"))) {
					userId = rs.getInt("id");
					System.out.println("ユーザーデータIDを取得しました。");
					break;
				}
			}
			System.out.println("login_idによるuserIdの検索は終了しました。");
			return userId;

		}catch(SQLException e) {
			System.out.println();
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}

	/**
	 * サイズ情報IDと個人情報IDを取得
	 *
	 * @param userId ユーザーID
	 *
	 * @return UserData [UserDataBeans] : 各情報のID
	 *
	 * @throws SQLException
	 *             呼び出し元にスロー
	 */

	public static UserDataBeans getUserDataId(int userId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try{
			con = DBManager.getConnection();
			st = con.prepareStatement("SELECT id, personal_id, size_id FROM user WHERE id = ?");
			st.setInt(1, userId);

			ResultSet rs = st.executeQuery();

			UserDataBeans UserData = new UserDataBeans();
			if (rs.next()) {
				UserData.setUserId(userId);
				UserData.setPersonalId(rs.getInt("personal_id"));
				UserData.setSizeId(rs.getInt("size_id"));
			}
			System.out.println("ユーザーIDによる個人情報IDの検査は終了しました。");

			return UserData;

		}catch(SQLException e) {
			System.out.println();
			throw new SQLException(e);
		}finally {
			if(con != null) {
				con.close();
			}
		}
	}
}
