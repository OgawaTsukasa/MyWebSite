<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<meta name="format-detection" content="telephone=no">
		<meta name="viewport"
			content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0" />
		<link rel="stylesheet" href="./css/common.css" media="all">
		<link rel="stylesheet" href="./css/order.css" media="all">
		<link rel="stylesheet" href="./css/layout.css" media="all">
	</head>

	<body>
		<header>
			<figure>
				<img src="./img/PageTop/gr167_d01.jpg">
			</figure>
		</header>

		<jsp:include page="/baselayout/header.jsp"/>

		<div class="contents wrap">
			<article class="confirm">
				<h2>ご注文内容確認</h2>

				<p class="t_c">お客様が入力された内容は、以下の通りです。内容のご確認をお願いします。</p>

				<div>
					<h3>ご注文生地</h3>

					<dl class="kijilist clearfix">

						<c:forEach var="item" items="${cart}" varStatus="status">
							<dt>NO-${item.itemId}  ■${item.cloth}   ■${item.remark}   ■${item.brandDataBeans.bName}   ■${item.material}</dt>
							<dd>単価：${item.unitPrice}円&nbsp;&nbsp;&nbsp;${item.num}枚&nbsp;&nbsp;&nbsp;小計：${item.subPrice}円＋税</dd>
						</c:forEach>
					</dl>


					<h3>配送料</h3>
					<dl class="kijilist clearfix">
						<dd>500円＋税</dd>
					</dl>

					<h3>オプション料</h3>
					<dl class="kijilist clearfix">
						<c:if test = "${orderData.pocketBeans.poketPrice > 0}">
							<dt>ポケットの種類   : 【${orderData.pocketBeans.pocketType}】</dt>
							<dd>単価 : ${orderData.pocketBeans.poketPrice}円&nbsp;&nbsp;&nbsp;${orderData.totalNum}枚&nbsp;&nbsp;&nbsp;小計 : ${orderData.pocketBeans.poketPrice * orderData.totalNum}円＋税</dd>
						</c:if>

						<c:if test = "${orderData.nameDesignBeans.designType != null}">
							<dt>ネームの種類   : 【${orderData.nameDesignBeans.designType}】</dt>
							<dd>単価 : ${orderData.nameDesignBeans.designPrice}円&nbsp;&nbsp;&nbsp;${orderData.totalNum}枚&nbsp;&nbsp;&nbsp; 小計 : ${orderData.nameDesignBeans.designPrice * orderData.totalNum}円＋税</dd>
						</c:if>

						<c:if test = "${orderData.nameColorBeans1.colorType != null}">
							<c:if test = "${orderData.nameColorBeans1.colorPrice > 0}">
								<dt>ネームカラー   : 【${orderData.nameColorBeans1.colorType}】</dt>
								<dd>単価 : ${orderData.nameColorBeans1.colorPrice}円&nbsp;&nbsp;&nbsp;${orderData.totalNum}枚&nbsp;&nbsp;&nbsp; 小計 : ${orderData.nameColorBeans1.colorPrice * orderData.totalNum}円＋税</dd>
							</c:if>
						</c:if>

						<c:if test = "${orderData.nameColorBeans2.colorType != null}">
							<c:if test = "${orderData.nameColorBeans2.colorPrice > 0}">
								<dt>ネームカラー重ね字   : 【${orderData.nameColorBeans2.colorType}】</dt>
								<dd>単価 : ${orderData.nameColorBeans2.colorPrice}円&nbsp;&nbsp;&nbsp;${orderData.totalNum}枚&nbsp;&nbsp;&nbsp; 小計 : ${orderData.nameColorBeans2.colorPrice * orderData.totalNum}円＋税</dd>
							</c:if>
						</c:if>

						<c:if test = "${orderData. buttonDesignBeans.buttonPrice > 0}">
							<dt>ボタンの種類   : 【${orderData. buttonDesignBeans.buttonTyupe}】</dt>
							<dd>単価 : ${orderData. buttonDesignBeans.buttonPrice}円&nbsp;&nbsp;&nbsp;${orderData.totalNum}枚&nbsp;&nbsp;&nbsp; 小計 : ${orderData. buttonDesignBeans.buttonPrice * orderData.totalNum}円＋税</dd>
						</c:if>

					</dl>

					<h3>合計金額</h3>
					<dl class="kijilist clearfix">
						<dd>
							小計（税抜き）  :  ${orderData.price.subtotal}円<br>
							合計（税込み）  :  ${orderData.price.total}円
						</dd>
					</dl>
				</div>

				<div>
					<h3>ご注文内容</h3>
					<dl class="orderlist">

						<dt>項目名</dt>
						<dd>&nbsp;</dd>
						<dt>首周り</dt>
						<dd> ${orderData.sizeBeanse.neck} センチ</dd>

						<dt>肩幅</dt>
						<dd>${orderData.sizeBeanse.shoulder} センチ</dd>

						<dt>アームホール</dt>
						<dd>${orderData.sizeBeanse.arm} センチ</dd>

						<dt>裄丈右</dt>
						<dd>${orderData.sizeBeanse.sleeveRigt} センチ</dd>

						<dt>裄丈左</dt>
						<dd>${orderData.sizeBeanse.sleeveLeft} センチ</dd>

						<dt>上胴（バスト）</dt>
						<dd>${orderData.sizeBeanse.bust} センチ</dd>

						<dt>中胴（ウエスト）</dt>
						<dd>${orderData.sizeBeanse.waist}  センチ</dd>

						<dt>下胴（ヒップ）</dt>
						<dd>${orderData.sizeBeanse.hips} センチ</dd>

						<dt>着丈</dt>
						<dd>${orderData.sizeBeanse.length} センチ</dd>

						<dt>カフス周り右</dt>
						<dd>${orderData.sizeBeanse.cuffsRigt} センチ</dd>

						<dt>カフス周り左</dt>
						<dd>${orderData.sizeBeanse.cuffsLeft} センチ</dd>

						<dt>ご身長</dt>
						<dd>${orderData.sizeBeanse.height} センチ</dd>


						<dt>シャツのシルエット</dt>
						<dd>${orderData.silhouetteType}</dd>

						<dt>衿のデザイン</dt>
						<dd>${orderData.collarType}</dd>

						<dt>衿デザインのご要望</dt>
						<dd>${orderData.requestBeans.collarRequest}</dd>

						<dt>カフスのデザイン</dt>
						<dd>${orderData.cuffsDesignType}</dd>

						<dt>カフスのコンバーチブル仕様</dt>
						<dd>${orderData.cuffsButtonType}</dd>

						<dt>カフスの時計仕様</dt>
						<dd>${orderData.cuffsWatchType}</dd>

						<dt>カフスデザインのご要望</dt>
						<dd>${orderData.requestBeans.cuffsRequest}</dd>

						<dt>ポケットのデザイン</dt>
						<dd>${orderData.pocketBeans.pocketType}</dd>

						<dt>ポケットデザインのご要望</dt>
						<dd>${orderData.requestBeans.pocketRequest}</dd>

						<dt>ネームの有無</dt>
						<dd>${orderData.nameMessage}</dd>
						<c:if test = "${orderData.nameMessage == 'ネームを入いれる'}">

							<dt>ネームの種類</dt>
							<dd>${orderData.nameDesignBeans.designType}</dd>

							<dt>ネームのイニシャル</dt>
							<dd>${orderData.nameSpelling}</dd>

							<dt>ネームカラー</dt>
							<c:if test = "${oderData.nameColorBeans1.colorType != null}">
								<dd>${orderData.nameColorBeans1.colorType}</dd>
							</c:if>

							<c:if test = "${oderData.nameColorBeans2.colorType != null}">
								<dt>ネームカラー重ね時</dt>
								<dd>${orderData.nameColorBeans2.colorType}</dd>
							</c:if>

							<dt>ネームの場所</dt>
							<dd>${orderData.namePosition}</dd>
						</c:if>

						<dt>ボタンの選択</dt>
						<dd>${orderData. buttonDesignBeans.buttonTyupe}</dd>

						<dt>ボタン付け糸</dt>
						<dd>${orderData. buttonThread1}</dd>

						<dt>ボタンホール糸</dt>
						<dd>${orderData. buttonThread2}</dd>

						<dt>その他のご要望</dt>
						<dd>${orderData.requestBeans.otherRequest}</dd>
					</dl>
				</div>

				<c:if test = "${!isLogin}">
					<div>
						<h3>お客様情報</h3>
						<dl class="orderlist">
							<dt>郵便番号</dt>
							<dd>${orderData.personalInfo.zip}</dd>
							<dt>住所</dt>
							<dd>${orderData.personalInfo.address}</dd>
							<dt>お名前</dt>
							<dd>${orderData.personalInfo.name}</dd>
							<dt>ふりがな</dt>
							<dd>${orderData.personalInfo.kana}</dd>
							<dt>お電話番号</dt>
							<dd>${orderData.personalInfo.tel}</dd>
							<dt>性別</dt>
							<dd>${orderData.personalInfo.gender}</dd>
							<dt>配送金額</dt>
							<dd>全国一律\500+税とさせて頂きます。</dd>
						</dl>
					</div>

					<div >
						<ul class="conbtn">
							<p class="t_c">新規登録すると、次回以降のご注文がスムーズになります。</p>
							<li>
								<form method="GET" action="Regist">
									<input type="hidden"  name="url" value="/WEB-INF/jsp/buyConfirm.jsp">
									<input type="submit" value="新規登録">
								</form>
							</li>
							<li>
								<form method="GET" action="Login">
									<input type="hidden"  name="url" value="/WEB-INF/jsp/buyConfirm.jsp">
									<button type="submit">ログイン</button>
								</form>
							</li>
						</ul>
					</div>
				</c:if>

					<div class="note">
						<p>上記の内容に間違いがなければ「ご注文完了」ボタンをクリックして下さい。</p>
					</div>

					<div>
						<ul class="conbtn" >
							<li>
								<a href="Order">
									<button type="button">ご注文内容の修正</button>
								</a>
							</li>


							<li>
								<form action="BuyResult" method="POST">
									<button type="submit">ご注文完了</button>
								</form>
							</li>
						</ul>
					</div>

			</article>
		</div>
		<p class="gotop wrap">
			<a onclick="window.history.back()">戻る</a>
		</p>
	</body>
</html>