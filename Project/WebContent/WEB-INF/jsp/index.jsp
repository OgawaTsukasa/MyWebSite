<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="UTF-8">

		<link rel="stylesheet" href="css/common.css" media="all">
		<link rel="stylesheet" href="css/top.css" media="all">
		<link rel="stylesheet" href="css/layout.css" media="all">
		<link rel="stylesheet" href="css/marker.css" media="all">

		<script src="js/jquery-3.4.1.min.js"></script>
	</head>

	<body>
		<header>
			<div class="head">
				<p >世界で一枚しかないフルオーダーシャツをお作りします。</p>
				</div>
			<div class="f_r">
				<div id="header_search" class="clearfix">
					<form action="ItemWordSearch" method="GET">
						<input type="text" name="id" size="23" maxlength="30" value="" placeholder="サイト内検索">
						<input id="search_btn" name="submit" type="image" src="//kinkodo.co.jp/com/img/search.jpg" alt="検索" align="absmiddle">
					</form>
				</div>
			</div>

			<figure>
				<img src="img/PageTop/1486370887.jpg">
			</figure>
		</header>
		<jsp:include page="/baselayout/header.jsp"/>

		<div class="contents wrap">
			<h2>
				クリック一つで速やかにお好みの生地へ。生地の選択方法を
				<span style="font-size: 32pt">
					<font color="#ff0000">3</font>
				</span>通り用意いたしました。
			</h2>
			<p align="center">
				<img src="img/click.jpg" width="60" height="80" border="0" class="example3" alt="3通りのオーダーシャツ通販の方法">
			</p>
			<p align="center">それぞれの↓バナーをクリックして頂ければ、速やかにお好みの生地にたどり着けます。</p>
			<div class="tside">
				<aside>
					<div class="tside">
						<aside>
							<nav>
								<script src="js/index.js"></script>
								<ul>
									<li>
										<p>
											<a class="accord" data-target="accrd01" id="brand">ブランドで選ぶ</a>
										</p>
										<ul class="accrd01" style="display: block;" id="brandS">
											<li class="canclini">
												<a href="ItemBrandSearch?id=1&name=カンクリーニ" alt="オーダーシャツ生地カンクリーニ">Canclini</a>
											</li>
											<li class="tmason">
												<a href="ItemBrandSearch?id=2&name=トーマスメイソン" alt="オーダーシャツ生地トーマスメイソン">Thomas Mason</a>
											</li>
											<li class="alumo">
												<a href="ItemBrandSearch?id=3&name=アルモ" alt="オーダーシャツ生地アルモ">Alumo</a>
											</li>
											<li class="carlo">
												<a href="ItemBrandSearch?id=4&name=カルロリーバ" alt="オーダーシャツ生地カルロリーバ">Carlo Riva</a>
											</li>
											<li class="leggiuno">
												<a href="ItemBrandSearch?id=5&name=レジウノ" alt="オーダーシャツ生地レジウノ">leggiuno</a>
											</li>
											<li class="giza">
												<a href="ItemBrandSearch?id=6&name=ギザ" alt="エジプト綿GIZA">Giza</a>
											</li>
										</ul>
									</li>

									<li>
										<p>
											<a class="accord" data-target="accrd02"id="color">カラーで選ぶ</a>
										</p>
										<ul class="accrd02" style="display: block;" id="colorS">
											<li>
												<a href="ItemColorSearch?id=ホワイト">
												<img src="./img/colorSelect/side_whites.jpg" alt="オーダーシャツ生地ホワイト">ホワイト</a>
											</li>
											<li>
												<a href="ItemColorSearch?id=ブルー">
												<img src="./img/colorSelect/side_blue.jpg" alt="オーダーシャツ生地ブルー">ブルー</a>
											</li>
											<li>
												<a href="ItemColorSearch?id=ピンク">
												<img src="./img/colorSelect/side_pink.jpg" alt="オーダーシャツ生地ピンク">ピンク</a>
											</li>
											<li>
												<a href="ItemColorSearch?id=グレー">
												<img src="./img/colorSelect/side_grey.jpg" alt="オーダーシャツ生地グレー">グレー</a>
											</li>
											<li>
												<a href="ItemColorSearch?id=ブラック">
												<img src="./img/colorSelect/side_black.jpg" alt="オーダーシャツ生地ブラック">ブラック</a>
											</li>
											<li>
												<a href="ItemColorSearch?id=マルチ">
												<img src="./img/colorSelect/side_multi.jpg" alt="オーダーシャツ生地マルチカラー">マルチカラー</a>
											</li>
										</ul>
									</li>
									<li>
										<p>
											<a class="accord" data-target="accrd04" id="price">価格帯で選ぶ</a>
										</p>
										<ul class="accrd04" style="display: block;" id="priceS">
											<li>
												<a href="ItemPriceSearch?id=1&name=￥18,000までの" alt="オーダーシャツ生地18,000円まで">
												<b>18,000</b>+税 まで</a>
											</li>
											<li>
												<a href="ItemPriceSearch?id=2&name=￥20,000までの" alt="オーダーシャツ生地20,000円まで">
												<b>20,000</b>+税 まで</a>
											</li>
											<li>
												<a href="ItemPriceSearch?id=3&name=￥25,000までの" alt="オーダーシャツ生地25,000円まで">
												<b>25,000</b>+税 まで</a>
											</li>
											<li>
												<a href="ItemPriceSearch?id=4&name=￥26,000以上の" alt="オーダーシャツ生地26,000円まで">
												<b>26,000</b>+税 以上</a>
											</li>
										</ul>
									</li>
								</ul>
							</nav>
						</aside>
					</div>
					<h2>採寸方法</h2>
					<table valign="middle">
						<tbody>
							<tr>
								<td>
									<a href="Sizing">
										<img src="./img/saisun_1.jpg" style="margin-right: 2px;">
									</a>
								</td>
							</tr>
						</tbody>
					</table>
				</aside>
			</div>
		</div>
	</body>
</html>