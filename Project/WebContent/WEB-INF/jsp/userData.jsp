<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<meta name="format-detection" content="telephone=no">
		<meta name="viewport"
			content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0" />


		<link rel="stylesheet" href="css/common.css" media="all">
		<link rel="stylesheet" href="css/layout.css" media="all">
		<link rel="stylesheet" href="css/materialize.css" media="all">

		<script src="js/jquery-3.4.1.min.js"></script>
		<script src="js/regist.js"></script>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>


	<body>
		<div class="row center">
			<div class="gmenu">
				<h2><a href="Index">Made-To-Order</a></h2>
			</div>
		</div>
		<div class="contents wrap">
			<div class="row center">
				<article>
					<h2 >ユーザー情報</h2>
				</article>
			</div>
			<div class="container">
				<div class="row">
					<div class="col s12">
						<div class="card grey lighten-5">
							<div class="card-content">
								<form action="UserDataUpdateConfirm" method="POST">
									<c:if test="${validationMessage != null}">
										<p class="red-text center-align">${validationMessage}</p>
									</c:if>
									<br> <br>
									<div class="row">
										<div class="input-field col s4">
											<span class="red-text" id="name_error"></span>
											<input type="text" name="name" value="${UserPersonal.name}"> <label class="active">名前</label>
										</div>
										<div class="input-field col s5">
											<span class="red-text" id="kana_error"></span>
											<input type="text" name="kana" value="${UserPersonal.kana}"> <label class="active">ふりがな</label>
										</div>
										<div class="input-field col s3">
												<input type="radio" name="gender" value="男性"  ${UserPersonal.gender == "男性"?"checked":""} id="t07">
												<label for="t07">男性</label>&nbsp;
												<input type="radio" name="gender" value="女性" ${UserPersonal.gender == "女性"?"checked":""} id="t07">
												<label for="t07">女性</label>&nbsp;
												<label class="active">性別</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s4">
											<span class="red-text" id="zip_error"></span>
											<input type="text" name="zip" value="${UserPersonal.zip}"> <label class="active">郵便番号</label>
										</div>
										<div class="input-field col s8">
											<span class="red-text" id="address_error"></span>
											<input type="text" name="address" value="${UserPersonal.address}"> <label class="active">住所</label>
										</div>
									</div>
									<div class="row">
										<div class="input-field col s5">
											<span class="red-text" id="tel_error"></span>
											<input type="text" name="tel" value="${UserPersonal.tel}"> <label class="active">電話番号</label>
										</div>
									</div>
									<div class="row">
										<div class="conbtn">
											<button class="btn" type="submit">更新</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--  購入履歴 -->
				<div class="row center">
					<h5 class=" col s12 light">購入履歴</h5>
				</div>
				<div class="row">
					<div class="col s12">
						<div class="card grey lighten-5">
							<div class="card-content">
								<table class="bordered">
									<thead>
										<tr>
											<th style="width: 20%"></th>
											<th class="center">購入日時</th>
											<th class="center">購入金額</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="BuyData" items="${BuyDataList}" >
											<tr>
												<td class="center">
													<div class="conbtn">
														<a href="UserBuyHistoryDetail?buyId=${BuyData.buyId}" >
															<button class="btn" type="submit" >詳細</button>
														</a>
													</div>
												</td>
												<td class="center">${BuyData.formatDate}</td>
												<td class="center">${BuyData.price.total}円</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<p class="gotop wrap">
			<a onclick="window.history.back()">戻る</a>
		</p>
	</body>
</html>