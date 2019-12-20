<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
			<div class="container">
				<div class="row center">
					<article>
						<h2>更新内容確認</h2>
					</article>
				</div>
				<div class="row">
					<form action="UserDataUpdateResult" method="POST">
						<div class="section">
							<div class="col s6 offset-s3">
								<div class="card grey lighten-5">
									<div class="card-content">
										<div class="row">
											<div class="input-field col s10 offset-s1">
												<input type="text" name="name" value="${personal.name}" readonly=""> <label class="active">名前</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<input type="text" name="kana" value="${personal.kana}" readonly=""> <label class="active">ふりがな</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<input type="text" name="gender" value="${personal.gender}" readonly=""> <label class="active">性別</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<input type="text" name="zip" value="${personal.zip}" readonly=""> <label class="active">郵便番号</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<input type="text" name="address" value="${personal.address}" readonly=""> <label class="active">住所</label>
											</div>
										</div>

										<div class="row">
											<div class="input-field col s10 offset-s1">
												<input type="text" name="tel" value="${personal.tel}" readonly=""> <label class="active">電話番号</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<article>
							<div class="row">
								<div class="section">
									<div class="col s6 offset-s3">
									<p class="center-align">上記内容で登録してよろしいでしょうか?</p>
										<ul class="submitbtn">
											<li>
												<input  type="button" onclick="window.history.back()" value="修正">
											</li>
												<li>
													<input  type="submit" value="登録">
											</li>
										</ul>
									</div>
								</div>
							</div>
						</article>
					</form>
				</div>
			</div>
		</div>
		<p class="gotop wrap">
			<a onclick="window.history.back()">戻る</a>
		</p>
	</body>
</html>