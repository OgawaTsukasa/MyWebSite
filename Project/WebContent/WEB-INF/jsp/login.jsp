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
            <h2>
                <a href="Index">
                Made-To-Order
                </a>
            </h2>
        </div>

        <div class="container">
			<div class="row center">
				<article>
					<h2>ログイン</h2>
				</article>
			</div>
			<div class="row">
				<div class="section">
					<div class="col s6 offset-s3">
						<form action="LoginResult" method="POST">
							<div class="card grey lighten-5">
								<div class="card-content">
									<div class="row">
										<c:if test="${loginErrorMessage != null}">
											<p class="red-text center-align">${loginErrorMessage}</p>
											<br>
										</c:if>
										<div class="input-field col s10 offset-s1">
											<span class="red-text" id="loginID_error"></span>
											<input name="login_id" type="text" maxlength="8" id="t03">
											<label class="active">ログインID</label>
										</div>
									</div>

									<div class="row">
										<div class="input-field col s10 offset-s1">
											<span class="red-text" id="password1_error"></span>
											<input type="password" name="password" maxlength="8"  id="pw01">
											<label class="active">パスワード  <input type="checkbox" id="passcheck1"></label>
										</div>
									</div>
								</div>
							</div>

							<ul class="submitbtn">
								<li>
									<input type="submit" value="ログイン">
								</li>
								<li>
									<p class="right-align">
										<a class="s" href="Regist">新規登録</a>
									</p>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			<p class="gotop wrap">
				<a onclick="window.history.back()">戻る</a>
			</p>
		</div>
	</body>
</html>