<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	</head>

	<body>
		<!--head-->
		<div class="row center">
			<h2>
				<a href="Index">Made-To-Order</a>
			</h2>
		 </div>

		 <div class="container">
			<div class="row center">
				<article class="confirm">
					<h2>ご注文完了</h2>
					<br>
					<p class="t_c">
						この度はオーダーシャツをご購入いただき、まことにありがとうございます。お客様のご注文は完了いたしました。<br>
						到着まで今しばらくお待ちください。
					</p>
				</article>
			</div>
			<div class="row center">
				<div class="row">
					<c:if test = "${isLogin}">
						<a href="UserData">
							<div class="conbtn">
								<button class="btn" type="submit">ユーザー情報へ</button>
							</div>
						</a>
					</c:if>
				</div>
				<a href="Index">
					<input type="submit" value="引き続き買い物をする">
				</a>
			</div>
			<div class="row center">
				<h4 class=" col s12 light">購入詳細</h4>
			</div>

			<!--  購入 -->
			<div class="row">
				<div class="section">
					<div class="col s12">
						<div class="card grey lighten-5">
							<div class="card-content">
								<table>
									<thead>
										<tr>
											<th class="center">購入日時</th>
											<th class="center">合計金額</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="center">${resultBuy.formatDate}</td>
											<td class="center">${resultBuy.price.total}（税込み）</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row center">
				<h5 class=" col s12 light">商品詳細</h5>
			</div>

			<!-- 詳細 -->
			<div class="row">
				<div class="col s12">
					<div class="card grey lighten-5">
						<div class="card-content">
							<table class="bordered">
								<thead>
									<tr>
										<th class="center">商品名</th>
										<th class="center">単価</th>
										<th class="center">小計</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="buyItem" items="${buyItem}" varStatus="status">
										<tr>
											<td class="center">■${buyItem.cloth}   ■${buyItem.num}枚   </td>
											<td class="center">${buyItem.subPrice}円</td>
											<td class="center">${buyItem.subPrice * buyItem.num}円＋税</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="row center">
						<h5 class=" col s12 light">オプション詳細</h5>
					</div>

					<div class="card grey lighten-5">
						<div class="card-content">
							<table class="bordered">
								<thead>
									<tr>
										<th class="center"></th>
										<th class="center">単価</th>
										<th class="center">小計</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="center">オプション料金</td>
										<td class="center"> ${resultBuy.price.optionPrice}円 ${resultBuy.totalNum}枚</td>
										<td class="center"> ${resultBuy.price.optionPrice * resultBuy.totalNum}円＋税</td>
									</tr>
									<tr>
										<td class="center">送料</td>
										<th class="center"></th>
										<td class="center">500円＋税</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>