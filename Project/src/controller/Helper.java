package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;

import beans.OrderPriceBeans;

public class Helper {

	public static Helper getInstance() {
		return new Helper();
	}

	public static String getSha256(String target) {
		MessageDigest md = null;
		StringBuffer buffer = new StringBuffer();
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(target.getBytes());
			byte[] digest = md.digest();
			for (int i = 0; i < digest.length; i++) {
				buffer.append(String.format("%02x", digest[i]));
			}
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return buffer.toString();

	}


	/**
	 * 測定値のバリデーション
	 *
	 * @param inputSize サイズ
	 * @return 引数が数字の場合 ; true
	 *
	 */
	public static boolean inputSizValidasion(String inputSize) {
		if(inputSize.matches("[0-9０-９.．]+")) {
			return true;
		}
		return false;
	}

	/**
	 * 郵便番号のバリデーション
	 *
	 * @param inputZip
	 * @return 引数が半角数字7桁の場合 ; true
	 *
	 */
	public static boolean inputZipValidasion(String inputZip) {
		if(inputZip.matches("^[0-9]{3}-?[0-9]{4}$")) {
			return true;
		}
		return false;
	}

	/**
	 * ひらがなのバリデーション
	 *
	 * @param inputKana
	 * @return 引数がひらがなの場合 ; true
	 *
	 */
	public static boolean inputKanaValidasion(String inputKana) {
		if(inputKana.matches("^[ぁ-んー 　]*$")) {
			return true;
		}
		return false;
	}

	/**
	 * 電話番号のバリデーション
	 *
	 * @param inputKana
	 * @return 引数が半角数字で10桁以上の場合 ; true
	 *
	 */
	public static boolean inputTelValidasion(String inputTel) {
		if(inputTel.matches("^[0-9]+$") && inputTel.length() > 10){
			return true;
		}
		return false;
	}

	/**
	 * 合計金額の算出
	 *
	 * @param priceList [List<Integer>]
	 * @return oderPrice [OderPriceBeans] : 料金情報を持つBeans
	 */
	public static OrderPriceBeans getTotalPrice(List<Integer> priceList) {
		OrderPriceBeans oderPrice = new OrderPriceBeans();
		//配送料
		int delivary = 500;
		//消費税
		double tax = 0.10;

		//小計
		int subtotal = priceList.stream().mapToInt(price -> price).sum();
		oderPrice.setSubtotal(subtotal + delivary);;

		//税込み価格
		oderPrice.setTotal((int) (oderPrice.getSubtotal() * (1 + tax)));
		return oderPrice;
	}

	/**
	 * セッションから指定データを取得（削除も一緒に行う）
	 *
	 * @param session
	 * @param str
	 * @return
	 */
	public static Object cutSessionAttribute(HttpSession session, String str) {
		Object test = session.getAttribute(str);
		session.removeAttribute(str);
		return test;
	}
}
