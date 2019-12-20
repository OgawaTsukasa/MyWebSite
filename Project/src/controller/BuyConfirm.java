package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import beans.BuyBeans;
import beans.BuyItemBeans;
import beans.OrderButtonDesignBeans;
import beans.OrderNameColorBeans;
import beans.OrderNameDesignBeans;
import beans.OrderPocketBeans;
import beans.OrderRequestBeans;
import beans.PersonalInfoBeans;
import beans.SizeBeanse;
import dao.OrderDAO;


/**
 * Servlet implementation class OderServlet
 */
@WebServlet("/BuyConfirm")
public class BuyConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//文字化け対策
		request.setCharacterEncoding("UTF-8");
		//セッション
		HttpSession session = request.getSession();

		try {
			//カートアイテムの取得
			List<BuyItemBeans> cart = (ArrayList<BuyItemBeans>) session.getAttribute("cart");

			if(!CollectionUtils.isEmpty(cart)) {

				//各オーダー情報用beans
				BuyBeans orderData = new BuyBeans();
				//エラーメッセージ用Beans
				List<String> ActionMessage = new ArrayList<String>();
				//その他の要望用Beans
				OrderRequestBeans orderRequest = new OrderRequestBeans();

				List<Integer> price = new ArrayList<Integer>();
				//カート内商品の各値段をListにセット
				price = cart.stream().map(item -> item.getSubPrice()).collect(Collectors.toList());

				//カート内商品の総枚数を取得
				int totalNum = cart.stream().mapToInt(item -> item.getNum()).sum();
				orderData.setTotalNum(totalNum);

				/* ===== サイズ情報の処理  =====*/
				//各サイズ用beans
				SizeBeanse orderSize = new SizeBeanse();
				//サイズの値をまとめて取得
				String[] size = request.getParameterValues("size");
				for(int i = 0 ; i < size.length; i++) {
					//nullチェック
					if(!StringUtils.isBlank(size[i])) {
						//値チェック
						if (Helper.inputSizValidasion(size[i])) {
							//Beansに値をセット
							if(i == 0) {
								orderSize.setNeck(size[i]);
							}else if(i == 1) {
								orderSize.setShoulder(size[i]);
							}else if(i == 2) {
								orderSize.setArm(size[i]);
							}else if(i == 3) {
								orderSize.setSleeveRigt(size[i]);
							}else if(i == 4) {
								orderSize.setSleeveLeft(size[i]);
							}else if(i == 5) {
								orderSize.setBust(size[i]);
							}else if(i == 6) {
								orderSize.setWaist(size[i]);
							}else if(i == 7) {
								orderSize.setHips(size[i]);
							}else if(i == 8) {
								orderSize.setLength(size[i]);
							}else if(i == 9) {
								orderSize.setCuffsRigt(size[i]);
							}else if(i == 10) {
								orderSize.setCuffsLeft(size[i]);
							}else if(i == 11) {
								orderSize.setHeight(size[i]);
							}
						}else {
							//パラメータが数値以外の場合
							ActionMessage.add("サイズは数字で記入してください");
							break;
						}
						//サイズ情報をオーダーbeansにセット
						orderData.setSizeBeanse(orderSize);
					}else {
						//パラメータがnullもしくは空白の場合
						ActionMessage.add("サイズ記入欄を埋めてください");
						break;
					}
				}


				/* == シルエット情報の取得 == */
				int silhouetteId = Integer.parseInt(request.getParameter("style"));
				//シルエット情報をオーダーbeansにセット
				orderData.setSilhouetteType(OrderDAO.getOrderSilhouette(silhouetteId));


				/* == 襟情報の取得 == */
				CharSequence collarId = request.getParameter("collar");
				orderRequest.setCollarRequest(request.getParameter("collarRequest"));

				if(!StringUtils.isBlank(collarId)) {
					//シルエット情報をオーダーbeansにセット
					orderData.setCollarType(OrderDAO.getOrderColler(collarId));
				}else {
					ActionMessage.add("襟のデザインを選択してください");
				}


				/* == カフスデザイン情報の取得 == */
				CharSequence cuffsDesingId= request.getParameter("cuffsDesing");
				orderRequest.setCuffsRequest(request.getParameter("cuffsRequest"));

				if(!StringUtils.isBlank(cuffsDesingId)) {
					//カフスデザイン情報をオーダーbeansにセット
					orderData.setCuffsDesignType(OrderDAO.getOrderCuffsDesing(cuffsDesingId));
				}else {
					ActionMessage.add("カフスのデザインを選択してください");
				}


				/* == カフスボタン情報の取得 == */
				CharSequence cuffsButtonId= request.getParameter("cuffsButton");

				if(!StringUtils.isBlank(cuffsButtonId)) {
					//カフスボタン情報をオーダーbeansにセット
					orderData.setCuffsButtonType(OrderDAO.getOrderCuffsButton(cuffsButtonId));
				}else {
					ActionMessage.add("カフスのコンバーチブル仕様を選択してください");
				}


				/* == カフス時計情報の取得 == */
				CharSequence cuffWatchId= request.getParameter("cuffsWatch");

				if(!StringUtils.isBlank(cuffWatchId)) {
					//カフス時計情報をオーダーbeansにセット
					orderData.setCuffsWatchType(OrderDAO.getOrderCuffsWatch(cuffWatchId));
				}else {
					ActionMessage.add("カフスの時計仕様を選択してください");
				}


				/* == ポケットデザイン情報の取得 == */
				CharSequence pocketId = request.getParameter("pocket");
				orderRequest.setPocketRequest(request.getParameter("pocketRequest"));

				if(!StringUtils.isBlank(pocketId)) {
					OrderPocketBeans orderPocket = OrderDAO.getOrderPocket(pocketId);
					//ポケットのオプション料金をpriceListに追加
					price.add(orderPocket.getPoketPrice() * totalNum);
					//ポケットデザイン情報をオーダーbeansにセット
					orderData.setPocketBeans(orderPocket);
				}else {
					ActionMessage.add("ポケット情報を入力してください");
				}


				/* == ネーム情報の取得 == */
				int doName = Integer.parseInt(request.getParameter("nameDo_Not"));
				String nameDesignId = request.getParameter("nameDesing");
				String nameInitial = request.getParameter("nameInitial");
				String nameColorId1 = request.getParameter("nameColor1");
				String nameColorId2 = request.getParameter("nameColor2");
				String namePosition = request.getParameter("namePosition");



				//ネームを入れない場合
				if(doName == 1) {
					if(!nameDesignId.isEmpty() || !nameColorId1.isEmpty() || !nameColorId2.isEmpty() || !namePosition.isEmpty()) {
						ActionMessage.add("ネームを入れる場合は[ネームを入れる]を選択してください");
					}else {
						orderData.setNameMessage("ネームは入れない");
					}

				//ネームを入れる場合
				}else if(doName == 2) {
					orderData.setNameMessage("ネームを入いれる");
					//ネームデザイン情報の取得
					if(!nameDesignId.isEmpty()) {
						OrderNameDesignBeans nameDesign = OrderDAO.getOrderNameDesign(nameDesignId);
						//ネームデザインのオプション料金をpriceListに追加
						price.add(nameDesign.getDesignPrice() * totalNum);
						//ネームデザイン情報をオーダーbeansにセット
						orderData.setNameDesignBeans(nameDesign);
					}else {
						ActionMessage.add("ネームの種類を選択してください");
					}


					//--イニシャル情報処理--
					if(!StringUtils.isBlank(nameInitial)) {
						orderData.setNameSpelling(nameInitial);
					}else {
						ActionMessage.add("ネームのイニシャルを記入してください");
					}


					//--ネームカラー情報処理--
					if(nameDesignId.equals("1") || nameDesignId.equals("2") || nameDesignId.equals("3") || nameDesignId.equals("4") || nameDesignId.equals("5") || nameDesignId.equals("9") || nameDesignId.equals("10")) {
						//ネームカラーが１種類の場合
						if(!nameColorId1.isEmpty()) {
							OrderNameColorBeans nameColor1 = OrderDAO.getOrderNameColor(nameColorId1);
							//ネームカラーのオプション料金をpriceListに追加
							price.add(nameColor1.getColorPrice() * totalNum);
							orderData.setNameColorBeans1(nameColor1);
						}else {
							ActionMessage.add("ネームのカラーを選択してください");
						}


					}else if(nameDesignId.equals("6") || nameDesignId.equals("7") || nameDesignId.equals("8")) {
						//ネームカラーが２種類の場合
						if(!nameColorId1.isEmpty() && !nameColorId2.isEmpty()) {
							OrderNameColorBeans nameColor1 = OrderDAO.getOrderNameColor(nameColorId1);
							//ネームカラーのオプション料金をpriceListに追加
							price.add(nameColor1.getColorPrice() * totalNum);
							orderData.setNameColorBeans1(nameColor1);

							OrderNameColorBeans nameColor2 = OrderDAO.getOrderNameColor(nameColorId2);
							//ネームカラーのオプション料金をpriceListに追加
							price.add(nameColor2.getColorPrice() * totalNum);
							orderData.setNameColorBeans2(nameColor2);
						}else {
							ActionMessage.add("ネームの種類 6) 7) 8)を選択された方はカラーを2種類選択してください");
						}
					}

					//--ネーム場所情報処理--
					if(!StringUtils.isBlank(namePosition)) {
						//ネーム場所情報をオーダーbeansにセット
						orderData.setNamePosition(OrderDAO.getOrderNamePosition(namePosition));
					}else {
						ActionMessage.add("ネームの場所を選択してください");
					}
				}


				/* == ボタン情報の取得 == */
				//--ボタンデザイン情報処理--
				int buttonDesignId = Integer.parseInt(request.getParameter("button"));
				OrderButtonDesignBeans buttonDesing = OrderDAO.getOrderButtonDesign(buttonDesignId);
				//ボタンデザインのオプション料金をpriceListに追加
				price.add(buttonDesing.getButtonPrice() * totalNum);
				orderData.setButtonDesignBeans(buttonDesing);

				//--ボタン糸情報処理--
				int buttonThreadId1 = Integer.parseInt(request.getParameter("buttonThread"));
				int buttonThreadId2 = Integer.parseInt(request.getParameter("buttonHole"));

				orderData.setButtonThread1(OrderDAO.getOrderButtonThread(buttonThreadId1));
				orderData.setButtonThread2(OrderDAO.getOrderButtonThread(buttonThreadId2));

				/* == その他の要望 == */
				orderRequest.setOtherRequest(request.getParameter("otherRequest"));

				//各種の要望メッセージをOderBeansにセット
				orderData.setRequestBeans(orderRequest);

				//ログインチェック
				Boolean isLogin = session.getAttribute("isLogin") != null ? (Boolean) session.getAttribute("isLogin") : false;
				//非ログインの場合は個人情報処理
				if(!isLogin) {
					/* == 個人情報の取得 == */
					String zip = request.getParameter("zip");
					String address = request.getParameter("address");
					String name = request.getParameter("name");
					String kana = request.getParameter("kana");
					String tel = request.getParameter("tel");
					String gender = request.getParameter("gender");

					PersonalInfoBeans personal = new PersonalInfoBeans();

					//郵便番号処理
					if(!StringUtils.isBlank(zip)) {
						if(Helper.inputZipValidasion(zip)) {
							personal.setZip(zip);
						}else {
							ActionMessage.add("郵便番号を正しく入力してください");
						}
					}else {
						ActionMessage.add("郵便番号を記入してください");
					}

					//住所処理
					if(!StringUtils.isBlank(address)) {
						personal.setAddress(address);
					}else {
						ActionMessage.add("市町村を記入してください");
					}

					//名前処理
					if(!StringUtils.isBlank(name)) {
						personal.setName(name);
					}else {
						ActionMessage.add("名前を記入してください");
					}

					//ふりがな処理
					if(!StringUtils.isBlank(kana)) {
						if(Helper.inputKanaValidasion(kana)) {
							personal.setKana(kana);
						}else {
							ActionMessage.add("ふりがなを正しく記入してください");
						}

					}else {
						ActionMessage.add("ふりがなを記入してください");
					}

					//電話番号処理
					if(!StringUtils.isBlank(tel)) {
						if(Helper.inputTelValidasion(tel)) {
							personal.setTel(tel);
						}else {
							ActionMessage.add("電話番号を正しく記入してください");
						}
					}else {
						ActionMessage.add("電話番号を記入してください");
					}

					//男女の判断
					if(gender.equals("1")) {
						personal.setGender("男性");
					}else if(gender.equals("2")) {
						personal.setGender("女性");
					}

					//個人情報をOderBeansにセット
					orderData.setPersonalInfo(personal);
				}

				//合計金額の取得
				orderData.setPrice(Helper.getTotalPrice(price));




				//エラーメッセージの確認
				if(!CollectionUtils.isEmpty(ActionMessage)){
					//エラーメッセージを確認した場合はオーダーフォームへフォワード
					request.setAttribute("ActionMessage", ActionMessage);
					request.setAttribute("personal", orderData.getPersonalInfo());
					request.setAttribute("size", orderData.getSizeBeanse());
					request.setAttribute("order", orderData);
					request.getRequestDispatcher(Forward.ORDER_PAGE).forward(request, response);
				}else {
					session.setAttribute("orderData",orderData);
					request.getRequestDispatcher(Forward.BUY_CONFIRM_PAGE).forward(request, response);
				}
			}else {
				//カートのセッションが無かった場合
				String cartActionMessage = "カートに商品はありません";
				request.setAttribute("cartActionMessage", cartActionMessage);
				//セッションが存在しない場合はカートへフォワード
				request.getRequestDispatcher(Forward.CART_PAGE).forward(request, response);
			}

		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessarge", e.toString());
			request.getRequestDispatcher(Forward.ERROR_PAGE).forward(request, response);
		}

	}

}
