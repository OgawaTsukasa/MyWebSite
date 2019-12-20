<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<meta name="format-detection" content="telephone=no">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0" />

		<link rel="stylesheet" href="css/common.css" media="all">
		<link rel="stylesheet" href="css/layout.css" media="all">
		<link rel="stylesheet" href="css/materialize.css" media="all">
		<link rel="stylesheet" href="css/order.css" media="all">
	</head>

	<body>
		<!--head-->
		<div class="container">
			<div class="gmenu">
				<h2>
					<a href="Index">Made-To-Order</a>
				</h2>
			</div>
		 </div>
		 <div class="contents wrap">
			 <div class="container">
				<div class="row center">
					<article class="confirm">
						<h2>ご購入詳細</h2>
					</article>
				</div>


				<div>
					<dl class="kijilist clearfix">
						<h4>ご購入生地</h4>
						<c:forEach var="buyItem" items="${buyItem}" varStatus="status"><br>
							<div class="row center">
								<img src="./img/cloth/${buyItem.itemFile}" width="250px" height="150px">
							</div>
							<dt> NO-${buyItem.itemId}  ■${buyItem.cloth}   ■${buyItem.remark}   ■${buyItem.brandDataBeans.bName}   ■${buyItem.material}</dt>
							<dd>単価：${buyItem.unitPrice}円&nbsp;&nbsp;&nbsp;${buyItem.num}枚&nbsp;&nbsp;&nbsp;小計：${buyItem.unitPrice * buyItem.num}円＋税</dd>
						</c:forEach>
					</dl>

					<dl class="kijilist clearfix">
						<h5>配送料</h5>
						<dd>500円＋税</dd>
					</dl>

					<dl class="kijilist clearfix">
						<h5>オプション料</h5>
						<c:if test = "${buyOrder.pocketBeans.poketPrice > 0}">
							<dt>ポケットの種類   : 【${buyOrder.pocketBeans.pocketType}】</dt>
							<dd>単価 : ${buyOrder.pocketBeans.poketPrice}円&nbsp;&nbsp;&nbsp;${buyOrder.totalNum}枚&nbsp;&nbsp;&nbsp;小計 : ${buyOrder.pocketBeans.poketPrice * buyOrder.totalNum}円＋税</dd>
						</c:if>

						<c:if test = "${buyOrder.nameDesignBeans.designType != null}">
							<dt>ネームの種類   : 【${buyOrder.nameDesignBeans.designType}】</dt>
							<dd>単価 : ${buyOrder.nameDesignBeans.designPrice}円&nbsp;&nbsp;&nbsp;${buyOrder.totalNum}枚&nbsp;&nbsp;&nbsp; 小計 : ${buyOrder.nameDesignBeans.designPrice * buyOrder.totalNum}円＋税</dd>
						</c:if>

						<c:if test = "${buyOrder.nameColorBeans1.colorType != null}">
							<c:if test = "${buyOrder.nameColorBeans1.colorPrice > 0}">
								<dt>ネームカラー   : 【${buyOrder.nameColorBeans1.colorType}】</dt>
								<dd>単価 : ${buyOrder.nameColorBeans1.colorPrice}円&nbsp;&nbsp;&nbsp;${buyOrder.totalNum}枚&nbsp;&nbsp;&nbsp; 小計 : ${buyOrder.nameColorBeans1.colorPrice * buyOrder.totalNum}円＋税</dd>
							</c:if>
						</c:if>

						<c:if test = "${buyOrder.nameColorBeans2.colorType != null}">
							<c:if test = "${buyOrder.nameColorBeans2.colorPrice > 0}">
								<dt>ネームカラー重ね字   : 【${buyOrder.nameColorBeans2.colorType}】</dt>
								<dd>単価 : ${buyOrder.nameColorBeans2.colorPrice}円&nbsp;&nbsp;&nbsp;${buyOrder.totalNum}枚&nbsp;&nbsp;&nbsp; 小計 : ${buyOrder.nameColorBeans2.colorPrice * buyOrder.totalNum}円＋税</dd>
							</c:if>
						</c:if>

						<c:if test = "${buyOrder.buttonDesignBeans.buttonPrice > 0}">
							<dt>ボタンの種類   : 【${buyOrder. buttonDesignBeans.buttonTyupe}】</dt>
							<dd>単価 : ${buyOrder. buttonDesignBeans.buttonPrice}円&nbsp;&nbsp;&nbsp;${buyOrder.totalNum}枚&nbsp;&nbsp;&nbsp; 小計 : ${buyOrder.buttonDesignBeans.buttonPrice * buyOrder.totalNum}円＋税</dd>
						</c:if>
					</dl>

					<dl class="kijilist clearfix">
						<h5>合計金額</h5>
						<dd>
							合計（税込み）  :  ${buyOrder.price.total}円
						</dd>
					</dl>
				</div>

				<div>
					<div class="row center">
						<h4>オーダー内容</h4>
					</div>
					<dl class="orderlist">

						<dt>サイズ</dt>
						<dd>&nbsp;</dd>
						<dt>首周り</dt>
						<dd> ${sizeData.neck} センチ</dd>

						<dt>肩幅</dt>
						<dd>${sizeData.shoulder} センチ</dd>

						<dt>アームホール</dt>
						<dd>${sizeData.arm} センチ</dd>

						<dt>裄丈右</dt>
						<dd>${sizeData.sleeveRigt} センチ</dd>

						<dt>裄丈左</dt>
						<dd>${sizeData.sleeveLeft} センチ</dd>

						<dt>上胴（バスト）</dt>
						<dd>${sizeData.bust} センチ</dd>

						<dt>中胴（ウエスト）</dt>
						<dd>${sizeData.waist}  センチ</dd>

						<dt>下胴（ヒップ）</dt>
						<dd>${sizeData.hips} センチ</dd>

						<dt>着丈</dt>
						<dd>${sizeData.length} センチ</dd>

						<dt>カフス周り右</dt>
						<dd>${sizeData.cuffsRigt} センチ</dd>

						<dt>カフス周り左</dt>
						<dd>${sizeData.cuffsLeft} センチ</dd>

						<dt>ご身長</dt>
						<dd>${sizeData.height} センチ</dd>
					</dl>
					<br>
					<dl class="orderlist">
						<dt>注文詳細</dt>
						<dd>&nbsp;</dd>
						<dt>シャツのシルエット</dt>
						<dd>${buyOrder.silhouetteType}</dd>

						<dt>衿のデザイン</dt>
						<dd>${buyOrder.collarType}</dd>

						<dt>衿デザインのご要望</dt>
						<dd>${buyOrder.requestBeans.collarRequest}</dd>

						<dt>カフスのデザイン</dt>
						<dd>${buyOrder.cuffsDesignType}</dd>

						<dt>カフスのコンバーチブル仕様</dt>
						<dd>${buyOrder.cuffsButtonType}</dd>

						<dt>カフスの時計仕様</dt>
						<dd>${buyOrder.cuffsWatchType}</dd>

						<dt>カフスデザインのご要望</dt>
						<dd>${buyOrder.requestBeans.cuffsRequest}</dd>

						<dt>ポケットのデザイン</dt>
						<dd>${buyOrder.pocketBeans.pocketType}</dd>

						<dt>ポケットデザインのご要望</dt>
						<dd>${buyOrder.requestBeans.pocketRequest}</dd>

						<dt>ネームの有無</dt>
						<dd>${buyOrder.nameMessage}</dd>
						<c:if test = "${buyOrder.nameMessage == 'ネームを入いれる'}">

							<dt>ネームの種類</dt>
							<dd>${buyOrder.nameDesignBeans.designType}</dd>

							<dt>ネームのイニシャル</dt>
							<dd>${buyOrder.nameSpelling}</dd>

							<dt>ネームカラー</dt>
							<c:if test = "${buyOrder.nameColorBeans1.colorType != null}">
								<dd>${buyOrder.nameColorBeans1.colorType}</dd>
							</c:if>

							<c:if test = "${buyOrder.nameColorBeans2.colorType != null}">
								<dt>ネームカラー重ね時</dt>
								<dd>${buyOrder.nameColorBeans2.colorType}</dd>
							</c:if>

							<dt>ネームの場所</dt>
							<dd>${buyOrder.namePosition}</dd>
						</c:if>

						<dt>ボタンの選択</dt>
						<dd>${buyOrder.buttonDesignBeans.buttonTyupe}</dd>

						<dt>ボタン付け糸</dt>
						<dd>${buyOrder.buttonThread1}</dd>

						<dt>ボタンホール糸</dt>
						<dd>${buyOrder.buttonThread2}</dd>

						<dt>その他のご要望</dt>
						<dd>${buyOrder.requestBeans.otherRequest}</dd>
					</dl>
				</div>
			</div>
		</div>
		<p class="gotop wrap">
			<a onclick="window.history.back()">戻る</a>
		</p>
	</body>
</html>