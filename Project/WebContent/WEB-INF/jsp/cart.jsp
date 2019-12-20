<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<meta name="format-detection" content="telephone=no">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0" />

		<link rel="stylesheet" href="css/common.css" media="all">
		<link rel="stylesheet" href="css/sub.css" media="all">
		<link rel="stylesheet" href="css/layout.css" media="all">
		<script src="js/jquery-3.4.1.min.js"></script>

	</head>

	<body>
		<header>
			<figure>
				<img src="img/PageTop/img1_03_s-607.jpg">
			</figure>
		</header>

		<jsp:include page="/baselayout/header.jsp"/>

		<div class="contents wrap">
			<div class="confirm">
				<article class="cart">
					<h2>ショッピングカート</h2>
					<h1>${cartActionMessage}</h2>


					<dl class="kijilist clearfix">
						<c:forEach var="item" items="${cart}" varStatus="status">
							<form action="ItemDelete" method="POST">
								<dt>
									No.${item.itemId}   ■${item.cloth}   ■${item.remark}   ■${item.brandDataBeans.bName}   ■${item.material}<br>
									<input type="hidden" name="delete_id" value="${item.itemId}">
									<button  name="id" value="1" >削除</button>
								</dt>

								<dd>
									<input type="hidden" name="Change_id" value="${item.itemId}">
									<select  name="num" size="1">
										<option value="1" ${item.num == 1?"selected":""}>１</option>
										<option value="2" ${item.num == 2?"selected":""}>２</option>
										<option value="3" ${item.num == 3?"selected":""}>３</option>
										<option value="4" ${item.num == 4?"selected":""}>４</option>
										<option value="5" ${item.num == 5?"selected":""}>５</option>
									</select>枚
									<button type="submit" name="id" value="2">枚数変更</button>
								</dd>
							</form>
						</c:forEach>
					</dl>

					<p class="contbtn">
						<button type="button" onclick="location.href='Index'">買い物を続ける</button>
					</p>

					<h2>注文ページへ</h2>
					<div align="center">
						<a href="Order">
							<img src="./img/saisun_1.jpg" alt="オーダー(1)お身体を採寸してのご注文">
						</a>
					</div>
				</article>
			</div>
		</div>
		<p class="gotop wrap">
			<a onclick="window.history.back()">戻る</a>
		</p>
	</body>
</html>