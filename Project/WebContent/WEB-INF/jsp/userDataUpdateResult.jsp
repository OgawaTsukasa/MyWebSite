<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<div class="gmenu">
 			<h2>
				<a href="Index">Made-To-Order</a>
			</h2>
		</div>
		<div class="contents wrap">
			<div class="row center">
				<article>
					<h2>更新完了</h2>
				</article>
			</div>

			<div class="container">
				<div class="row">
					<div class="section">
						<div class="col s12">
							<div class="card grey lighten-5">
								<div class="card-content">
									<div class="row">
										<div class="input-field col s5">
											<input type="text" value="${personal.name}" readonly> <label class="active">名前</label>
										</div>

										<div class="input-field col s5">
											<input type="text" name="kana" value="${personal.kana}" readonly> <label class="active">ふりがな</label>
										</div>

										<div class="input-field col s2">
											<input type="text" name="kana" value="${personal.gender}" readonly> <label class="active">性別</label>
										</div>
									</div>

									<div class="row">
										<div class="input-field col s4">
											<span class="red-text" id="zip_error"></span>
											<input type="text" name="zip" value="${personal.zip}" readonly> <label class="active">郵便番号</label>
										</div>
										<div class="input-field col s8">
											<span class="red-text" id="address_error"></span>
											<input type="text" name="address" value="${personal.address}" readonly> <label class="active">住所</label>
										</div>
									</div>

									<div class="row">
										<div class="input-field col s5">
											<span class="red-text" id="tel_error"></span>
											<input type="text" name="tel" value="${personal.tel}" readonly> <label class="active">電話番号</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="section">
								<div class="col s6 offset-s3">
									<h4 class="center-align">上記内容で更新しました</h4>
									<p class="center-align">【ユーザー情報へ】をクリックしてください。</p>
									<br><br>
									<ul class="submitbtn">
										<li>
											<a href="UserData">
												<input  type="submit"  value="ユーザー情報へ">
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>