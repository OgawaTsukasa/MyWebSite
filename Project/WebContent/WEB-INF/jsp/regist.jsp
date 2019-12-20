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

		<link rel="stylesheet" href="css/common.css" media="all">
		<link rel="stylesheet" href="css/layout.css" media="all">
		<link rel="stylesheet" href="css/materialize.css" media="all">

		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<script src="js/jquery-3.4.1.min.js"></script>
		<script src="js/ajaxzip3-source.js"></script>
		<script src="js/regist.js"></script>

	</head>

	<body>
		<div class="container">
			<div class="gmenu">
				<h2>
					<a href="Index">Made-To-Order</a>
				</h2>
			</div>
		</div>

		<div class="contents wrap">
			<div class="row center">
				<article>
					<h2>新規会員登録</h2>
				</article>

				<c:if test="${registMessage != null}">
					<P class="red-text">${registMessage}</P>
				</c:if>
			</div>
			<div class="container">
				<div class="row">
					<div class="section">
						<div class="col s6 offset-s3">
							<form action="RegistConfirm" method="POST">
								<div class="card grey lighten-5">
									<div class="card-content">
										<div class="row">
											<div class="input-field col s10 offset-s1">
												<span class="red-text" id="name_error"></span>
												<input  name="name" type="text" size="45" id="t01"  value=${personal.name}>
												<label class="active">名前 </label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<span class="red-text" id="kana_error"></span>
												<input  name="kana" type="text" size="45" id="t02" value=${personal.kana}>
												<label class="active">ふりがな</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<span class="red-text" id="loginID_error"></span>
												<input name="login_id" type="text" maxlength="8" id="t03" value=${udb.loginId}>
												<label class="active">ログインID</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<span class="red-text" id="password1_error"></span>
												<input type="password" name="password" maxlength="8"  id="pw01" value=${udb.password}>
												<label class="active">パスワード  <input type="checkbox" id="passcheck1"></label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<span class="red-text" id="password2_error"></span>
												<input type="password" name="confirm_password" maxlength="8"  id="pw02" value=${udb.password}>
												<label class="active">パスワード確認 <input type="checkbox" id="passcheck2"></label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<span class="red-text" id="zip_error"></span>
												<input name="zip" type="text" maxlength="8" id="t04" onKeyUp="AjaxZip3.zip2addr(this,'','address','address');"
												value=${personal.zip}>
												<label class="active">郵便番号</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<span class="red-text" id="address_error"></span>
												<input name="address" type="text" size="83"id="t05" value=${personal.address}>
												<label class="active">住所</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<span class="red-text" id="tel_error"></span>
												<input name="tel" type="text" size="45" id="t06" value=${personal.tel}>
												<label class="active">電話番号</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<input type="radio" name="gender" value="1"  checked="" id="t07"
												${personal.gender == "男性"?"checked":""}>
												<label for="t07">男性</label>&nbsp;
												<input type="radio" name="gender" value="2" id="t07"
												${personal.gender == "女性"?"checked":""}>
												<label for="t07">女性</label>&nbsp;
												<label class="active">性別</label>
											</div>
										</div>
									</div>
								</div>
								<article>
									<ul class="submitbtn">
										<li>
											<input type="submit" value="登録内容の確認">
											<p>登録内容の確認の確認です。クリックをお願いします。</p>
										</li>
									</ul>
								</article>
							</form>
						</div>
					</div>
				</div>
			</div>
			<p class="gotop wrap">
				<a onclick="window.history.back()">戻る</a>
			</p>
		</div>
	</body>
</html>
