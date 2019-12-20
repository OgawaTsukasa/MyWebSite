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
		<link rel="stylesheet" href="css/order.css" media="all">
		<link rel="stylesheet" href="css/layout.css" media="all">

		<script src="js/jquery-3.4.1.min.js"></script>
		<script src="js/ajaxzip3-source.js"></script>
		<script src="js/oder.js"></script>
	</head>

	<body>
		<header>
			<figure>
				<img src="img/PageTop/main_2042.fit-scale.jpg">
			</figure>
		</header>
		<jsp:include page="/baselayout/header.jsp"/>
		<div class="contents wrap">
			<form method="post" action="BuyConfirm">
				<article>
					<h1><c:forEach var="message" items="${ActionMessage}" ><br>
							<span class="red">${message}</span>
						</c:forEach>
					</h1>
					<h2>ショッピングカート内の生地</h2>
					<p>生地のページでショッピングカートに追加された生地と枚数です。</p>

					<div class="t_c">
						<ol class="kijilist">
							<c:forEach var="item" items="${cart}" varStatus="status">

								<li>NO-${item.itemId}   ■${item.cloth}   ■${item.brandDataBeans.bName}   ■${item.material}<span>${item.num}枚</span></li>

							</c:forEach>
						</ol>
					</div>
				</article>

				<article>
					<h2>サイズを入力してください</h2>
					<p>【先ずは採寸お疲れ様でした。お計り頂きましたサイズをご記入下さい。その後型を決めていきましょう。】</p>
					<p>こちらのサイズはお客様自身がお客様のサイズを計った場合を想定して記入欄を設けております。更に細かいサイズの指定をご希望の方は、最後の【その他のご要望】欄で補足をお願い致します。</p>


					<table class="inputsize">
						<tbody>
							<tr>
								<th><label for="b1">首周り</label></th>
								<td><input name="size" value="${size.neck}" type="text"
									size="15" id="b1"><label for="b1">センチ(０．５CM単位で)<br>
										０．５センチ単位で記入が可能です。既製品のサイズではちょっと大きい、ちょっと小さいと思われた方は5ミリの単位でサイズの調整が可能です。例えば(41.5)<span
										class="red">首周りは仕上がり(出来上がり）寸法でご記入下さい。</span></label></td>
							</tr>
							<tr>
								<th><label for="b2">肩幅</label></th>
								<td><input name="size" value="${size.shoulder}" type="text" size="15"
									id="b2"><label for="b2">センチ（1CM単位で）<span
										class="red">（出来上がり寸法）</span></label></td>
							</tr>
							<tr>
								<th><label for="b3">アームホール</label></th>
								<td><input name="size" value="${size.arm}" type="text" size="15"
									id="b3"><label for="b3">センチ（1CM単位で）<span
										class="red">（実寸）</span></label></td>
							</tr>
							<tr>
								<th><label for="b4">裄丈右</label></th>
								<td><input name="size" value="${size.sleeveRigt}" type="text" size="15"
									id="b4"><label for="b4">センチ（0.5CM単位で）<span
										class="red">（出来上がり寸法）</span></label></td>
							</tr>
							<tr>
								<th><label for="b5">裄丈左</label></th>
								<td><input name="size" value="${size.sleeveLeft}" type="text"
									size="15" id="b5"><label for="b5">センチ（0.5CM単位で）<span
										class="red">（出来上がり寸法）</span></label></td>
							</tr>
							<tr>
								<th><label for="b6">上胴（バスト）</label></th>
								<td><input name="size" value="${size.bust}" type="text" size="15"
									id="b6"><label for="b6">センチ（1CM単位で）<span
										class="red">（実寸）</span></label></td>
							</tr>
							<tr>
								<th><label for="b7">中胴（ウエスト）</label></th>
								<td><input name="size" value="${size.waist}" type="text" size="15"
									id="b7"><label for="b7">センチ（1CM単位で）<span
										class="red">（実寸）</span></label></td>
							</tr>
							<tr>
								<th><label for="b8">下胴（ヒップ）</label></th>
								<td><input name="size" value="${size.hips}" type="text" size="15"
									id="b8"><label for="b8">センチ（1CM単位で）<span
										class="red">（実寸）</span></label></td>
							</tr>
							<tr>
								<th><label for="b9">着丈</label></th>
								<td><input name="size" value="${size.length}" type="text" size="15"
									id="b9"><label for="b9">センチ（1CM単位で）<span
										class="red">（出来上がり寸法）</span></label></td>
							</tr>
							<tr>
								<th><label for="b10">カフス周り右</label></th>
								<td><input name="size" value="${size.cuffsRigt}" type="text"
									size="15" id="b10"><label for="b10">センチ（1CM単位で）<span
										class="red">（実寸）</span>※仕上がりサイズは実寸プラス７センチを想定しております。
								</label></td>
							</tr>
							<tr>
								<th><label for="b11">カフス周り左</label></th>
								<td><input name="size" value="${size.cuffsLeft}" type="text"
									size="15" id="b11"><label for="b11">センチ（1CM単位で）<span
										class="red">（実寸）</span>※仕上がりサイズは実寸プラス７センチを想定しております。
								</label></td>
							</tr>
							<tr>
								<th><label for="b12">ご身長</label></th>
								<td><input name="size" value="${size.height}" type="text" size="15"
									id="b12"><label for="b12">センチ（1CM単位で）</label></td>
							</tr>
						</tbody>
					</table>

					<h3>シャツのシルエット</h3>
					<p>※次にシャツのゆるみ（ゆとり）に関して選択下さい。(イラストはイメージです）</p>
					<div class="tblbox">
						<ul class="col4 yutori">


							<li><label for="c1">
									<p>
										■ モードスタイル<br>かなりタイトなシルエット<br>座るとお腹辺が<br>開く恐れあります。
									</p>
									<figure>
										<img src="img/oderForm/oderSlectStyle/style1.jpg">
										<figcaption>
											ボディの実寸プラス<br>バスト＋１２センチ<br>ウエスト＋９センチ
										</figcaption>
									</figure>
							</label>
								<p>
									<input type="radio" value="1" name="style" id="c1" checked=""
									${order.silhouetteType == "モードスタイル" ?"checked":""}>
								</p></li>


							<li><label for="c2">
									<p>
										■ イタリアンスタイル<br>（ノーマル）<br>こちらのスタイルを<br>お勧めします。
									</p>
									<figure>
										<img src="img/oderForm/oderSlectStyle/style2.jpg">
										<figcaption>
											ボディの実寸プラス<br>バスト＋１５センチ<br>ウエスト＋１２センチ
										</figcaption>
									</figure>
							</label>
								<p>
									<input type="radio" value="2" name="style"id="c2"
									${order.silhouetteType == "イタリアンスタイ" ?"checked":""}>
								</p></li>


							<li><label for="c3">
									<p>■ セミソフトスタイル</p>
									<figure>
										<img src="img/oderForm/oderSlectStyle/style3.jpg">
										<figcaption>
											ボディの実寸プラス<br>バスト＋１６センチ<br>ウエスト＋１４センチ
										</figcaption>
									</figure>
							</label>
								<p>
									<input type="radio" value="3" name="style" id="c3"
									${order.silhouetteType == "セミソフトスタイル" ?"checked":""}>
								</p></li>


							<li><label for="c4">
									<p>■ ソフトスタイル</p>
									<figure>
										<img src="img/oderForm/oderSlectStyle/style4.jpg">
										<figcaption>
											ボディの実寸プラス<br>バスト＋１８センチ<br>ウエスト＋１６センチ
										</figcaption>
									</figure>
							</label>
								<p>
									<input type="radio" value="4" name="style" id="c4"
									${order.silhouetteType == "ソフトスタイル" ?"checked":""}>
								</p></li>
						</ul>
					</div>

				</article>

				<article>
					<h2>襟のデザイン</h2>
					<p>２４の衿型がございます。その中からお好みのデザインをセレクトして下さい。またデザインページでも以下の衿型にないものも掲載してあります。また下記の衿型を基本として、衿の長さや高さも調整可能です。</p>
					<ul class="zoom">
						<li><img src="img/oderForm/oderSlectCollar/cs1.jpg"><br>
							<p>
								一番一般的なカラーです。お店によって若干のデザインの差はあるかと思いますが、当店の場合は衿の高さは<b>4センチ</b>衿の長さは<b>7センチ</b>です。
							</p>
							<p>１）レギュラーカラー</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs2.jpg"><br>
							<p>
								レギュラーカラーの衿先の長さをレギュラーより1センチほど短くしたものです。衿先の長さは<b>6センチ</b>、後ろ衿台の高さは<b>4センチ</b>です。
							</p>
							<p>２）ショートカラー</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs3.jpg"><br>
							<p>
								こちらはレギュラーよりも衿先を2センチ長くしたものです。衿先<b>9センチ</b>衿の高さは<b>4センチ</b>です。
							</p>
							<p>３）ロングポイント</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs4.jpg"><br>
							<p>
								衿先にボタンを付けて、ボディーと衿とを繋いだものです。衿先の長さ<b>8センチ</b>衿の高さは<b>4センチ</b>です。
							</p>
							<p>
								４）ボタンダウン<br> <span class="blue">◯ボタンダウン</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs5.jpg"><br>
							<p>
								通常のボタンダウンよりも剣先衿台の高さを高く衿先の長さ９センチ後ろ衿台の高さは<b>４．２センチ</b>、前衿台<b>３．０センチ</b>です。
							</p>
							<p>
								５）クラッシコボタンダウン<br> <span class="blue">◯ボタンダウン</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs6.jpg"><br>
							<p>
								ボタンダウンなのですが、衿先を二重にし比翼仕立てにしてボタンダウンのボタンの半分を比翼の下に隠したデザインです。衿の長さや衿の高さはボタンダウンと同様<b>8センチ</b>と<b>4センチ</b>です。
							</p>
							<p>
								６）マイタカラーのボタンダウン<br> <span class="blue">◯ボタンダウン</span><br></li>
						<li><img src="img/oderForm/oderSlectCollar/cs7.jpg"><br>
							<p>
								ボタンダウンのボタンの代わりに衿羽根裏にスナップを付けてとめてあります。 後ろ衿台の高さ<b>4センチ</b>衿の長さは<b>8.5センチ</b>です。
							</p>
							<p>７）スナップダウン</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs8.jpg"><br>
							<p>
								衿の羽根の内側は通常は直線ですが、このモデルは内側にアールをつけたデザイン。 衿先長さ<b>7.5センチ</b>衿の高さ<b>4センチ</b>
							</p>
							<p>８）イタリアンラウンド</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs9.jpg"><br>
							<p>
								ワイドの衿先を短くしたデザインです。第一ボタンは外した時も綺麗なデザインです。<b>4センチ</b>衿の長さは<b>６センチ</b>です。
							</p>
							<p>
								９）ゲーブルカラーショートワイド<br> <span class="green">◯ワイド系衿型</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs10.jpg"><br>
							<p>
								後ろ衿台を通常より高く、衿の羽根は短くし、オープンのした時も綺麗に見えるようにしました。衿先<b>７．５センチ</b>後ろ衿台の高ささは<b>４．２センチ</b>です。
							</p>
							<p>
								１０）クラッシコワイド<br> <span class="green">◯ワイド系衿型</span><br></li>
						<li><img src="img/oderForm/oderSlectCollar/cs11.jpg"><br>
							<p>
								レギュラーとワイドの中間の開き。 衿の長さ<b>８センチ</b>衿の後ろ衿台の高さ<b>4.0センチ</b>
							</p>
							<p>
								１１）セミワイド<br> <span class="green">◯ワイド系衿型</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs12.jpg"><br>
							<p>
								レギュラーよりも衿の開きを広くしたものです。剣先もレギュラーよりも1センチ長くしました。衿先<b>8センチ</b>衿の高さは<b>4センチ</b>です。
							</p>
							<p>
								１２）ワイド<br> <span class="green">◯ワイド系衿型</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs13.jpg"><br>
							<p>
								ゲーブルカラーなどとも言いますが、ワイドの更に広がりのあるカラーほとんど水平に広がります。少し衿の高さも高くしてみました。
								衿先の長さ<b>９センチ</b>衿の高さ<b>4.2センチ</b>">
							</p>
							<p>
								１３）ホリゾンタルワイド<br> <span class="green">◯ワイド系衿型</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs14.jpg"><br>
							<p>
								衿型と言うかスタイルの一部です。前衿台にボタンを二つ付け、開けた時も綺麗に見えるようにしてあります。 衿先<b>９センチ</b>衿の高さは<b>4センチ</b>です。
							</p>
							<p>１４）ドゥエボットーニ</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs15.jpg"><br>
							<p>
								ドゥエボットーニの衿台で、衿羽根はボタンダウンにしたデザイン。衿先<b>９センチ</b>衿の高さは<b>4センチ</b>です。
								このデザインでフロントボタンを１個にする場合もあります。
							</p>
							<p>
								１５）ドゥエボットーニのボタンダウン<br> <span class="blue">◯ボタンダウン</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs16.jpg"><br>
							<p>
								ドゥエボットーニ前衿台にボタンを二つ付けで衿羽根をワイドにしてあります。 衿先<b>８センチ</b>衿の高さは<b>4センチ</b>です。
							</p>
							<p>
								１６）ドゥエボットーニのワイドカラー<br> <span class="green">◯ワイド系衿型</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs17.jpg"><br>
							<p>
								基本的にはレギュラーと同じ形ですが、衿先を丸くしたデザインです。ソフトなイメージがします。衿先の長さ<b>6.5センチ</b>衿の高さ<b>4センチ</b>
							</p>
							<p>１７）ラウンドカラー</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs18.jpg"><br>
							<p>
								衿の開き（角度）の狭い衿型です。 衿先の長さ<b>7センチ</b>衿の高さ<b>4センチ</b>
							</p>
							<p>１８）ナローカラー</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs19.jpg"><br>
							<p>
								衿先をまたぐループをつけたもの、ループの先はフォック止めです。ネクタイの下でループを結びます長さ<b>7センチ</b>衿の高さ<b>4センチ</b>
							</p>
							<p>１９）タブカラー</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs20.jpg"><br>
							<p>
								衿にピンをさしてその間にタイを通す衿型です。ピンを通す穴が空いております。ピンは附属しておりません。<b>7センチ</b>衿の高さ<b>4センチ</b>
							</p>
							<p>２０）ピンホール</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs21.jpg"><br>
							<p>
								衿先は短く衿の先にボタンを付け、ボディーではなく衿台につけてしまったデザイン、勿論ネクタイはできません。スタンドカラーのデザインものと言う感じです。衿の高さ<b>3.5センチ</b>
							</p>
							<p>
								２１）スタンドのボタンダウン<br> <span class="blue">◯ボタンダウン</span>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs22.jpg"><br>
							<p>
								バンドカラーとも言います。衿の羽根のないスタイル。タイを締めなくても大丈夫なスタイルです。衿の高さ<b>3センチ</b>
							</p>
							<p>２２）スタンドカラー</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs23.jpg"><br>
							<p>
								スタンドカラーの上部と下部を分けて下の台と上を一体にしたデザインです。スタンドカラーの変形ですが、ネクタイが無い分首元のアクセントになると思います。
								衿の高さ<b>3.5センチ</b>
							</p>
							<p>２３）二段のスタンドカラー</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs24.jpg"><br>
							<p>
								主としてタキシードなどのフォーマルシャツの衿型です。 後ろ衿台の高さ<b>4センチ</b>
							</p>
							<p>
								２４）ウィングカラー<br>
							</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs25.jpg"><br>
							<p>
								衿羽根を大きく開いたデザイン。ノーネクタイなどの時に綺麗に見えます。衿羽根にアールをつけた、カッタウエイカラー（２）もあります。
								衿の高さ<b>4.0センチ</b>衿の羽根の長さ<b>9.0センチ</b>
							</p>
							<p>２５）カッタウエイカラー（１）</p></li>
						<li><img src="img/oderForm/oderSlectCollar/cs26.jpg"><br>
							<p>
								羽根を大きく開いたデザイン。ノーネクタイなどの時に綺麗に見えます。衿羽根は直線的な、カッタウエイカラー（１）もあります。 衿の高さ<b>4.0センチ</b>衿の羽根の長さ<b>9.0センチ</b>
							</p>
							<p>２６）カッタウエイカラー（２）</p></li>
					</ul>
					<br><br><br><br>
					<div class="t_c">
						<p class="red">＊衿のデザインは必須項目です。</p>
						<select name="collar" size="1">
							<option value="" selected="">こちらから衿のデザインをお選び下さい。</option>
							<option value="1" ${order.collarType == "レギュラーカラー" ?"selected":""}>
							１）レギュラーカラー</option>
							<option value="2" ${order.collarType == "ショートカラー" ?"selected":""}>
							２）ショートカラー</option>
							<option value="3" ${order.collarType == "ロングポイント" ?"selected":""}>
							３）ロングポイント</option>
							<option value="4" ${order.collarType == "ボタンダウン" ?"selected":""}>
							４）ボタンダウン</option>
							<option value="5" ${order.collarType == "クラッシコボタンダウン" ?"selected":""}>
							５）クラッシコボタンダウン</option>
							<option value="6" ${order.collarType == "マイタカラーのボタンダウン" ?"selected":""}>
							６）マイタカラーのボタンダウン</option>
							<option value="7" ${order.collarType == "スナップダウン" ?"selected":""}>
							７）スナップダウン</option>
							<option value="8" ${order.collarType == "イタリアンラウンド" ?"selected":""}>
							８）イタリアンラウンド</option>
							<option value="9" ${order.collarType == "ゲーブルカラーショートワイド" ?"selected":""}>
							９）ゲーブルカラー ショートワイド</option>
							<option value="10" ${order.collarType == "クラッシコワイド" ?"selected":""}>
							１０）クラッシコワイド</option>
							<option value="11" ${order.collarType == "セミワイド" ?"selected":""}>
							１１）セミワイド</option>
							<option value="12" ${order.collarType == "ワイド" ?"selected":""}>
							１２）ワイド</option>
							<option value="13" ${order.collarType == "ホリゾンタルワイド" ?"selected":""}>
							１３）ホリゾンタルワイド</option>
							<option value="14" ${order.collarType == "ドゥエボットーニ" ?"selected":""}>
							１４）ドゥエボットーニ</option>
							<option value="15" ${order.collarType == "ドゥエボットーニのボタンダウン" ?"selected":""}>
							１５）ドゥエボットーニのボタンダウン</option>
							<option value="16" ${order.collarType == "ドゥエボットーニのワイドカラー" ?"selected":""}>
							１６）ドゥエボットーニのワイドカラー</option>
							<option value="17" ${order.collarType == "ラウンドカラー" ?"selected":""}>
							１７）ラウンドカラー</option>
							<option value="18" ${order.collarType == "ナローカラー" ?"selected":""}>
							１８）ナローカラー</option>
							<option value="19" ${order.collarType == "タブカラー" ?"selected":""}>
							１９）タブカラー</option>
							<option value="20" ${order.collarType == "ピンホール" ?"selected":""}>
							２０）ピンホール</option>
							<option value="21" ${order.collarType == "スタンドのボタンダウン" ?"selected":""}>
							２１）スタンドのボタンダウン</option>
							<option value="22" ${order.collarType == "スタンドカラー" ?"selected":""}>
							２２）スタンドカラー</option>
							<option value="23" ${order.collarType == "二段のスタンドカラー" ?"selected":""}>
							２３）二段のスタンドカラー</option>
							<option value="24" ${order.collarType == "ウィングカラー" ?"selected":""}>
							２４）ウィングカラー</option>
							<option value="25" ${order.collarType == "カッタウエイカラー(1)" ?"selected":""}>
							２５）カッタウエイカラー（１）</option>
							<option value="26" ${order.collarType == "カッタウエイカラー(2)" ?"selected":""}>
							２６）カッタウエイカラー（２）</option>
						</select>
					</div>
					<br>


					<h3>衿デザインのご要望</h3>
					<div class="wid60">
						<p>
							 更に細かい注文も可能です。<br>
							【例】<br> <span class="lgreen">◆レギュラーカラーの剣先（衿の長さ）を9センチにしてほしい。<br>
								◆ドゥエボットーニでボタンダウンにしてほしい。
							</span>
						</p>
						<p>上記の◆のようにご用意した衿のスタイルの変更を求められる場合は下記の覧にご記入頂けますでしょうか。作業が困難なものもあるかも知れませんができるだけご要望にお答えできればと考えております。
							変更が可能かどうかはご注文確認のメールをお送りする際にご連絡を致します。</p>
					</div>
					<div class="t_c">
						<textarea name="collarRequest" rows="7" cols="70">${order.requestBeans.collarRequest}</textarea>
					</div>
				</article>

				<article>
					<h2>カフスのデザイン</h2>
					<br>
					<p>１０のカフス型がございます。その中からお好みのデザインをセレクトして下さい。</p>
					<br>

					<ul class="zoom">
						<li><img src="img/oderForm/oderSlectCuffs/ks1.jpg"><br>
							<p>
								通常のデザインのカフスです。カフスの先は少し丸みを付けてあります。カフス巾<b>6.5センチ</b>
							</p>
							<p>１）スタンダードカフス</p></li>

						<li><img src="img/oderForm/oderSlectCuffs/ks2.jpg"><br>
							<p>
								ノーマルなデザインよりも少し丸みを付けたデザインです。カフス巾<b>７．０センチ</b>">
							</p>
							<p>２）ラウンドカフス（中丸）</p></li>

						<li><img src="img/oderForm/oderSlectCuffs/ks3.jpg"><br>
							<p>
								カフスを大きく丸みを付けたデザインです。カフス巾も通常よりは1センチ大きくなります。カフス巾<b>7.5センチ</b>
							</p>
							<p>３）ラウンドカフス(大丸)</p></li>
						<li><img src="img/oderForm/oderSlectCuffs/ks4.jpg"><br>
							<p>
								カフスの角を切り落としたデザインです。カフス巾<b>6.5センチ</b>
							</p>
							<p>４）スクエア 角落とし</p></li>
						<li><img src="img/oderForm/oderSlectCuffs/ks5.jpg"><br>
							<p>
								カフスの角を直角にカットしたものです。カフス巾<b>6.5センチ</b>">
							</p>
							<p>５）直角（本カフス）</p></li>
						<li><img src="img/oderForm/oderSlectCuffs/ks6.jpg"><br>
							カフスにボタンを2個付けたデザインです。カフス巾が若干長くなります。カフス巾<b>7.5センチ</b><br>
							<p>その他カフスの先が角落としのものもございます。</p>
							<p>６）ボタン2個付き ラウンド</p></li>
						<li><img src="img/oderForm/oderSlectCuffs/ks7.jpg"><br>
							<p>
								カフスを折り曲げて二重にしたデザインです。カフスボタンを必ず使います。カフス巾<b>７．０センチ</b><br>
								折り返しが直角になったデザインもあります。">
							</p>
							<p>７）ダブルカフス 折り返しラウンド</p></li>
						<li>７<img src="img/oderForm/oderSlectCuffs/ks8.jpg"><br>
							<p>
								カフスを折り曲げて二重にしたデザインです。カフスボタンを必ず使います。カフス巾<b>７．０センチ</b><br>
								折り返しが丸になったデザインもあります。">
							</p>
							<p>８）ダブルカフス 折り返し直角</p>
						</li>
						<li><img src="img/oderForm/oderSlectCuffs/ks9.jpg"><br>
							<p>
								Wカフスのように折り返しになりますが、カフスボタンではなくて通常のボタン止めです。<br>カフス巾<b>7.0センチ</b><br>
							</p>
							<p>９）ターンナップカフス ボタン1個</p></li>
						<li><img src="img/oderForm/oderSlectCuffs/ks10.jpg"><br>
							<p>
								Wカフスのように折り返しになりますが、カフスボタンではなくて通常のボタン止めです。こちらはボタン2個のタイプ。カフス巾<b>7.0センチ</b><br>
							</p>
							<p>１０）ターンナップカフス ボタン２個</p></li>
					</ul>
					<br>
					<div class="t_c">
						<p class="red">＊カフスのデザイン選択は必須項目です。</p>
						<select name="cuffsDesing" size="1">
							<option value="" selected="">こちらからカフスのデザインをお選び下さい。</option>
							<option value="1" ${order.cuffsDesignType == "スタンダードカフス" ?"selected":""}>
							１）スタンダードカフス</option>
							<option value="2" ${order.cuffsDesignType == "ラウンドカフス(中丸)" ?"selected":""}>
							２）ラウンドカフス（中丸）</option>
							<option value="3" ${order.cuffsDesignType == "ラウンドカフス(大丸)" ?"selected":""}>
							３）ラウンドカフス(大丸)</option>
							<option value="4" ${order.cuffsDesignType == "スクエア　角落し" ?"selected":""}>
							４）スクエア 角落とし</option>
							<option value="5" ${order.cuffsDesignType == "直角(本カフス)" ?"selected":""}>
							５）直角（本カフス）</option>
							<option value="6" ${order.cuffsDesignType == "ラウンド　ボタン2個付き" ?"selected":""}>
							６）ボタン2個付きラウンド</option>
							<option value="7" ${order.cuffsDesignType == "ダブルカフス　折り返しラウンド" ?"selected":""}>
							７）ダブルカフス折り返しラウンド</option>
							<option value="8" ${order.cuffsDesignType == "ダブルカフス　折り返し直角" ?"selected":""}>
							８）ダブルカウス折り返し直角</option>
							<option value="9" ${order.cuffsDesignType == "ターンナップカフス　ボタン1個" ?"selected":""}>
							９）ターンナップカフスボタン1個</option>
							<option value="10" ${order.cuffsDesignType == "ターンナップカフス　ボタン2個" ?"selected":""}>
							１０）ターンナップカフスボタン２個</option>
						</select>
					</div>


					<h3>カフスのコンバーチブル仕様</h3>
					<p>カフスボタンの仕様も選択できます。</p>
					<p>
						■シングルボタン止め（ボタン止めだけのカフスの仕様）<br>
						■ボタン止めもできるコンバーチブル仕様（ボタン止めもできるし、カフスボタンもできる共用の仕様）<br>
						■ボタン無し（カフスボタンだけのカフスの仕様）<br> ■ダブルカフスはカフスボタンは付きません。<br>
						※ターンナップカフスはボタン止めのみの仕様となります。
					</p>

					<div class="tblbox">
						<ul class="col3">


							<li>
								<figure>
									<label for="h2"><img src="img/oderForm/oderSlectCuffs/single.jpg"></label>
								</figure>
								<p>
									<input type="radio" value="1" name="cuffsButton" id="h2" checked=""
									${order.cuffsButtonType == "シングルボタン止め" ?"checked":""}>
									<label for="h2">シングルボタン止め</label>
								</p>
							</li>


							<li>
								<figure>
									<label for="h3"><img src="img/oderForm/oderSlectCuffs/con1.jpg"></label>
								</figure>
								<p>
									<input type="radio" name="cuffsButton" value="2" id="h3"
									${order.cuffsButtonType == "カフスもできるコンバーチブル仕様" ?"checked":""}>
									<label for="h3">カフスもできるコンバーチブル仕様</label>
								</p>
							</li>


							<li>
								<figure>
									<label for="h4"><img src="img/oderForm/oderSlectCuffs/con2.jpg"></label>
								</figure>
								<p>
									<input type="radio" name="cuffsButton" value="3" id="h4"
									${order.cuffsButtonType == "ボタン無し仕様(ダブルカフスはこちら)" ?"checked":""}>
									<label for="h4">ボタン無しの仕様（ダブルカフスはこちらを選択）</label>
								</p>
							</li>
						</ul>
					</div>

					<h3>カフスの時計仕様（左右の大きさ）</h3>
					<p>時計をされる場合、時計の大きさだけカフスの周りの大きさを変えられます。</p>
					<p>一般的にはカフス周りの大きさというのは左右同一です。ただ時計をする場合はどうしても時計がカフスに当たりカフスを早く痛めてしまう可能性が高いです。それを少しでも回避する為にカフスの左右の大きさを変えることが可能です。</p>
					<p>必要であれば、チェックを入れて下さい。左右の差を１．０センチ以上にすることも可能ですが、その場合は【カフスデザインのご要望】の欄に左右何センチとご記入ください。</p>

					<table class="tbl3">
						<tbody>
							<tr>
								<td></td>
								<td>時計をされない方</td>
								<td>薄い時計の場合</td>
								<td>厚い時計の時</td>
							</tr>

							<tr>
								<td>左カフス</td>
								<td rowspan="2">
									<input type="radio" name="cuffsWatch" value="1" id="i1" checked=""
									${order.cuffsWatchType == "左右差無し" ?"checked":""}>
									<label for="i1">左右差無し</label>
								</td>

								<td>
									<input type="radio" name="cuffsWatch" value="2" id="i2"
									${order.cuffsWatchType == "左カフス+0.5㎝" ?"checked":""}>
									<label for="i2">左カフス＋０．５ｃｍ</label>
								</td>

								<td>
									<input type="radio" name="cuffsWatch" value="3" id="i3"
									${order.cuffsWatchType == "左カフス+1.0㎝" ?"checked":""}>
									<label for="i3">左カフス＋１．０ｃｍ</label>
								</td>
							</tr>

							<tr>
								<td>右カフス（右に時計をされる方</td>
								<td>
									<input type="radio" name="cuffsWatch" value="4" id="i4"
									${order.cuffsWatchType == "右カフス+0.5㎝" ?"checked":""}>
									<label for="i4">右カフス＋０．５ｃｍ</label>
								</td>

								<td>
									<input type="radio" name="cuffsWatch" value="5" id="i5"
									${order.cuffsWatchType == "右カフス+1.0㎝" ?"checked":""}>
									<label for="i5">右カフス＋１．０ｃｍ</label>
								</td>
							</tr>
						</tbody>
					</table>

					<table class="bdnon">
						<tbody>
							<tr>
								<td><img src="img/oderForm/oderSlectCuffs/watch_cuffs1.jpg"
									width="280" height="212" border="0"></td>
								<td><img src="img/oderForm/oderSlectCuffs/cuffs_model.jpg"
									width="420" height="410" border="0" align="bottom"
									style="margin-left: 15px"></td>
							</tr>
						</tbody>
					</table>


					<h3>カフスデザインのご要望</h3>
					<p>当店のシャツは1枚1枚手作りですので、上記のアイテムを選択するだけではなく更に詳細にオーダーができます。更に細かい注文も可能です。</p>
					<p>
						【例】<br> <span class="lgreen">
							◆２）ラウンドカフスでカフスの長さを８センチにして欲しい。<br>
							◆１０）のデザインページの番号のカフスよりも更に１センチ、カフスの巾を長くしてほしい。
						</span>
					</p>

					<p>上記の◆のようにご用意したカフスのスタイルの変更を求められる場合は下記の覧にご記入頂けますでしょうか。作業が困難なものもあるかも知れませんができるだけご要望にお答えできればと考えております。</p>
					<div class="t_c">
						<textarea rows="7"  name="cuffsRequest" cols="70">${order.requestBeans.cuffsRequest}</textarea>
					</div>

					<h2>ポケットのデザイン</h2>
					<p>
						基本的には当店のポケットは以下の５種類、そしてポケット無しも選択できます。 またそれぞれに<u>両ポケット</u>の仕様も可能です。（両ポケットフラップボタン付きの場合だけ￥<u>１，５００＋税</u>のオプション料金をご負担頂ければと思います。
					</p>
					<p>サイズは上記のサイズでお作りしておりますが、お客様によってはパスポートを入れたいとか手帳を入れたいというようなご要望があるかと思います。その際には縦と横のサイズをお知らせ下さい。</p>


					<div class="tblbox">
						<ul class="col3 pocket">
							<li>
								<figure>
									<figcaption>■ ノーマルポケット</figcaption>
									<img src="img/oderForm/oderSlectPoket/n_pocket.jpg">
								</figure>
							</li>
							<li>
								<figure>
									<figcaption>■ ペンタゴン</figcaption>
									<img src="img/oderForm/oderSlectPoket/p_pocket.jpg">
								</figure>
							</li>
							<li>
								<figure>
									<figcaption>■ ボタン付き</figcaption>
									<img src="img/oderForm/oderSlectPoket/botton_pocket.jpg">
								</figure>
							</li>
							<li>
								<figure>
									<figcaption>■ フラップ付き</figcaption>
									<img src="img/oderForm/oderSlectPoket/flap_pocket.jpg">
								</figure>
							</li>
							<li>
								<figure>
									<figcaption>■ フラップのボタン付き</figcaption>
									<img src="img/oderForm/oderSlectPoket/flap_button_pocket.jpg">
								</figure>
							</li>
							<li>
								<figure>
									<figcaption>■ ポケット無し</figcaption>
									<img src="img/oderForm/oderSlectPoket/non_pocket.jpg">
								</figure>
							</li>
						</ul>
					</div>

					<table class="tbl3">
						<tbody>
							<tr>
								<td></td>
								<td>片ポケット</td>
								<td>両ポケット</td>
							</tr>

							<tr>
								<td>■ ノーマルポケット</td>

								<th><input type="radio" name="pocket" value="1" checked="" ${order.pocketBeans.poketId == "1" ?"checked=":""}></th>

								<th><input type="radio" name="pocket" value="2" ${order.pocketBeans.poketId == "2" ?"checked=":""}></th>
							</tr>
							<tr>
								<td>■ ペンタゴン</td>

								<th><input type="radio" name="pocket" value="3" ${order.pocketBeans.poketId == "3" ?"checked=":""}></th>

								<th><input type="radio" name="pocket" value="4" ${order.pocketBeans.poketId == "4" ?"checked=":""}></th>
							</tr>
							<tr>
								<td>■ ボタン付き</td>

								<th><input type="radio" name="pocket" value="5" ${order.pocketBeans.poketId == "5" ?"checked=":""}></th>

								<th><input type="radio" name="pocket" value="6" ${order.pocketBeans.poketId == "6" ?"checked=":""}></th>
							</tr>
							<tr>
								<td>■ フラップ付き</td>

								<th><input type="radio" name="pocket" value="7" ${order.pocketBeans.poketId == "7" ?"checked=":""}></th>

								<th><input type="radio" name="pocket" value="8" ${order.pocketBeans.poketId == "8" ?"checked=":""}></th>
							</tr>
							<tr>
								<td>■ フラップのボタン付き</td>

								<th><input type="radio" name="pocket" value="9" ${order.pocketBeans.poketId == "9" ?"checked=":""}></th>

								<th><input type="radio" name="pocket" value="10" ${order.pocketBeans.poketId == "10" ?"checked=":""}><br>
									オプション<br> ￥１，５００＋税</th>
							</tr>
							<tr>
								<td>■ ポケット無し</td>

								<th><input type="radio" name="pocket" value="11" ${order.pocketBeans.poketId == "11" ?"checked=":""}>
								</th>
								<td></td>
							</tr>
						</tbody>
					</table>

					<h3>ポケットデザインのご要望</h3>
					<p>当店のシャツは1枚1枚手作りですので、上記のアイテムを選択するだけではなく更に詳細にオーダーができます。</p>
					<p>
						【例】<br> <span class="lgreen">◆縦○○センチ横幅○○センチにしてほしい。など。<br>
							◆裾を水平にしてほしい。などなど
						</span>
					</p>
					<p>上記の◆のようにご用意したスタイルの変更を求められる場合は下記の覧にご記入頂けますでしょうか。作業が困難なものもあるかも知れませんができるだけご要望にお答えできればと考えております。
						変更が可能かどうかはご注文確認のメールをお送りする際にご連絡を致します。</p>
					<div class="t_c">
						<textarea rows="7" cols="70" name="pocketRequest">${order.requestBeans.pocketRequest}</textarea>
					</div>


					<br>
					<br>



					<article>
						<h2 id="names">ネーム</h2>
						<div class="wid80">
							<br>
							<p class="lgreen">
								※ネームを入れる（別途￥５５０＋税）<br>
							</p>

							<p>
								オーダーシャツはネームを入れたり入れる場所を選択できます。<br> 先ずはネームを入れるかどうかを選択して下さい。
							</p>
						</div>

						<div class="bdbox wid70">
							<input type="radio" name="nameDo_Not" value="1" id="m1" checked="" ${order.nameMessage == "ネームは入れない" ?"checked=":""}>
							<label for="m1">ネームは入れない（こちらにチェックをされた方は<a href="#button">次の<b>「ボタンの選択」</b></a>にお進み下さい）</label><br>

							<input type="radio" name="nameDo_Not" value="2" id="m2" ${order.nameMessage == "ネームを入いれる" ?"checked=":""}>
							<label for="m2">ネームを入れる方はこちらにチェック</label>
						</div>

						<div class="nametbl">
							<div class="tblbox">
							<p class="t_c">ネームを入れるにチェックされた方はネームの種類をお選び下さい。</p>
								<ul class="col4">
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/doitsu.jpg">
											<figcaption>
												１）ドイツ文字<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/italic.jpg">
											<figcaption>
												２）イタリック<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/goshic.jpg">
											<figcaption>
												３）ゴシック体<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/rome.jpg">
											<figcaption>
												４）活字体<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/hikkitai.jpg">
											<figcaption>
												５）筆記体 <br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/hikkitai_kasane.jpg">
											<figcaption>
												６）筆記体重ね<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/doitsu_kasane.jpg">
											<figcaption>
												７）ドイツ文字重ね<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/rome_kasane.jpg">
											<figcaption>
												８）活字体重ね<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/japanese.jpg">
											<figcaption>
												９）漢字<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
									<li>
										<figure>
											<img src="img/oderForm/oderSlectName/tuzurimoji.jpg">
											<figcaption>
												１０）筆記体 綴り文字<br>￥５５０＋税
											</figcaption>
										</figure>
									</li>
								</ul>
							</div>


							<div class="t_c">
								<p style="color:red">＊ネームの種類選択は必須項目です。</p>
								<select size="1" name="nameDesing">
									<option  value="" selected="">ネームの種類をお選び下さい</option>

									<option value="1" ${order.nameDesignBeans.designId == "1" ?"selected=":""}>
									１）ドイツ文字（プラス￥５５０＋税）</option>
									<option value="2" ${order.nameDesignBeans.designId == "2" ?"selected=":""}>
									２）イタリック（プラス￥５５０＋税）</option>
									<option value="3" ${order.nameDesignBeans.designId == "3" ?"selected=":""}>
									３）ゴシック体（プラス￥５５０＋税）</option>
									<option value="4" ${order.nameDesignBeans.designId == "4" ?"selected=":""}>
									４）活字体（プラス￥５５０＋税）</option>
									<option value="5" ${order.nameDesignBeans.designId == "5" ?"selected=":""}>
									５）筆記体（プラス￥５５０＋税）</option>
									<option value="6" ${order.nameDesignBeans.designId == "6" ?"selected=":""}>
									６）筆記体重ね（プラス￥５５０＋税）</option>
									<option value="7" ${order.nameDesignBeans.designId == "7" ?"selected=":""}>
									７）ドイツ文字重ね（プラス￥５５０＋税）</option>
									<option value="8" ${order.nameDesignBeans.designId == "8" ?"selected=":""}>
									８）活字体重ね（プラス￥５５０＋税）</option>
									<option value="9" ${order.nameDesignBeans.designId == "9" ?"selected=":""}>
									９）漢字（プラス￥５５０＋税）</option>
									<option value="10" ${order.nameDesignBeans.designId == "10" ?"selected=":""}>
									１０）筆記体綴り文字（プラス￥５５０＋税）</option>
								</select>
							</div>

							<div class="t_c" id="nameColorC">
								<p>
									先ずはお入れになるイニシャルを記載下さい <br>例：鈴木 太郎の場合は「T.S」<br>１０）筆記体
									綴り文字を選択された方は「T.Suzuki」(例)
								</p>
								<p style="color:red">＊イニシャルの記載は必須項目です。</p>
								<textarea rows="4" cols="30" name="nameInitial">${order.nameSpelling}</textarea>


								<p>次にネームのカラーです。</p>

								<figure>
									<img src="img/oderForm/oderSlectName/name_color.jpg" width="600"
										height="100" border="0">
								</figure>

								<table class="bdnon wid40">
									<tbody>
										<tr>
											<td class="t_l">（１９）シルバー光沢<br>  通常￥５５０＋税のイニシャルが<br>
												プラス￥３００＋税の￥８５０＋税となります。
											</td>
												<td><img src="img/oderForm/oderSlectName/silver.jpg" width="200"
												height="129" border="0"></td>
										</tr>
									</tbody>
								</table>

								<table class="tbl1 wid70">
									<tbody>
										<tr>
											<td>（１）ブラック</td>
											<td>（２）ネイビー</td>
											<td>（３）サックスブルー</td>
											<td>（４）シルバー</td>
										</tr>
										<tr>
											<td>（５）シルバーグレー</td>
											<td>（６）グレー</td>
											<td>（７）ライトブラウン</td>
											<td>（８）ブラウン</td>
										</tr>
										<tr>
											<td>（９）ダークブラウン</td>
											<td>（１０）レッド</td>
											<td>（１１）ワイン</td>
											<td>（１２）オレンジ</td>
										</tr>
										<tr>
											<td>（１３）イエロー</td>
											<td>（１４）エメラルドグリーン</td>
											<td>（１５）グリーン</td>
											<td>（１６）ピンク</td>
										</tr>
										<tr>
											<td>（１７）パープル</td>
											<td>（１８）ホワイト</td>
											<td>（１９）シルバー光沢<br>通常価格プラス￥３００＋税
											</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="t_c" id="nameColorC1">
								<p>
									<span class="lgreen">１）～１０）</span>までの刺繍の方は以下のフォーマットから色をお選び下さい。
								</p>
								<p style="color:red">＊色の選択は必須項目です。</p>
								<select size="1" id=nc1  name="nameColor1">
									<option value="" selected="">ネームの色をお選び下さい。</option>
									<option value="1" ${order.nameColorBeans1.colorId == "1" ?"selected=":""}>１）ブラック</option>
									<option value="2" ${order.nameColorBeans1.colorId == "2" ?"selected=":""}>２）ネイビー</option>
									<option value="3" ${order.nameColorBeans1.colorId == "3" ?"selected=":""}>３）サックスブルー</option>
									<option value="4" ${order.nameColorBeans1.colorId == "4" ?"selected=":""}>４）シルバー</option>
									<option value="5" ${order.nameColorBeans1.colorId == "5" ?"selected=":""}>５）シルバーグレー</option>
									<option value="6" ${order.nameColorBeans1.colorId == "6" ?"selected=":""}>６）グレー</option>
									<option value="7" ${order.nameColorBeans1.colorId == "7" ?"selected=":""}>７）ライトブラウン</option>
									<option value="8" ${order.nameColorBeans1.colorId == "8" ?"selected=":""}>８）ブラウン</option>
									<option value="9" ${order.nameColorBeans1.colorId == "9" ?"selected=":""}>９）ダークブラウン</option>
									<option value="10" ${order.nameColorBeans1.colorId == "10" ?"selected=":""}>１０）レッド</option>
									<option value="11" ${order.nameColorBeans1.colorId == "11" ?"selected=":""}>１１）ワイン</option>
									<option value="12" ${order.nameColorBeans1.colorId == "12" ?"selected=":""}>１２）オレンジ</option>
									<option value="13" ${order.nameColorBeans1.colorId == "13" ?"selected=":""}>１３）イエロー</option>
									<option value="14" ${order.nameColorBeans1.colorId == "14" ?"selected=":""}>１４）エメラルドグリーン</option>
									<option value="15" ${order.nameColorBeans1.colorId == "15" ?"selected=":""}>１５）グリーン</option>
									<option value="16" ${order.nameColorBeans1.colorId == "16" ?"selected=":""}>１６）ピンク</option>
									<option value="17" ${order.nameColorBeans1.colorId == "17" ?"selected=":""}>１７）パープル</option>
									<option value="18" ${order.nameColorBeans1.colorId == "18" ?"selected=":""}>１８）ホワイト</option>
									<option value="19" ${order.nameColorBeans1.colorId == "19" ?"selected=":""}>１９）シルバー光沢</option>
								</select>
							</div>

							<div class="t_c" id="nameColorC2">
								<p>
									<span class="lgreen">６）７）８）</span>の重ね文字の方はもう一色選択して下さい。
								</p>
								<p style="color:red">＊色の選択は必須項目です。</p>
								<select size="1" name="nameColor2">
									<option value="" selected="">ネームの色をお選び下さい。</option>
									<option value="1" ${order.nameColorBeans2.colorId == "1" ?"selected=":""}>１）ブラック</option>
									<option value="2" ${order.nameColorBeans2.colorId == "2" ?"selected=":""}>２）ネイビー</option>
									<option value="3" ${order.nameColorBeans2.colorId == "3" ?"selected=":""}>３）サックスブルー</option>
									<option value="4" ${order.nameColorBeans2.colorId == "4" ?"selected=":""}>４）シルバー</option>
									<option value="5" ${order.nameColorBeans2.colorId == "5" ?"selected=":""}>５）シルバーグレー</option>
									<option value="6" ${order.nameColorBeans2.colorId == "6" ?"selected=":""}>６）グレー</option>
									<option value="7" ${order.nameColorBeans2.colorId == "7" ?"selected=":""}>７）ライトブラウン</option>
									<option value="8" ${order.nameColorBeans2.colorId == "8" ?"selected=":""}>８）ブラウン</option>
									<option value="9" ${order.nameColorBeans2.colorId == "9" ?"selected=":""}>９）ダークブラウン</option>
									<option value="10" ${order.nameColorBeans2.colorId == "10" ?"selected=":""}>１０）レッド</option>
									<option value="11" ${order.nameColorBeans2.colorId == "11" ?"selected=":""}>１１）ワイン</option>
									<option value="12" ${order.nameColorBeans2.colorId == "12" ?"selected=":""}>１２）オレンジ</option>
									<option value="13" ${order.nameColorBeans2.colorId == "13" ?"selected=":""}>１３）イエロー</option>
									<option value="14" ${order.nameColorBeans2.colorId == "14" ?"selected=":""}>１４）エメラルドグリーン</option>
									<option value="15" ${order.nameColorBeans2.colorId == "15" ?"selected=":""}>１５）グリーン</option>
									<option value="16" ${order.nameColorBeans2.colorId == "16" ?"selected=":""}>１６）ピンク</option>
									<option value="17" ${order.nameColorBeans2.colorId == "17" ?"selected=":""}>１７）パープル</option>
									<option value="18" ${order.nameColorBeans2.colorId == "18" ?"selected=":""}>１８）ホワイト</option>
									<option value="19" ${order.nameColorBeans2.colorId == "19" ?"selected=":""}>１９）シルバー光沢</option>
								</select>
							</div>

							</tbody>

							<div class="tblbox" id="nemePosi"">
								<h3>ネームの場所</h3>
								<p class="t_c">下記の箇所からネームを入れる位置を選択できます。</p>
								<ul class="col2 nameplace">
									<li><img src="img/oderForm/oderSlectName/pocket_place.jpg"></li>
									<li>
										<table class="bdnon">
											<tbody>
												<tr class="v_m">
													<td><img src="img/oderForm/oderSlectName/pocket_ue.jpg"
														width="200" height="208" border="0">
													<p>1)ポケットの上中央</p></td>
													<td><img src="img/oderForm/oderSlectName/pocket_ue_hidari.jpg"
														width="200" height="208" border="0">
													<p>２）左ポケットの上ボディ中央より</p></td>
												</tr>
												<tr>
													<td><img src="img/oderForm/oderSlectName/pocket_under.jpg"
														width="200" height="208" border="0">
													<p>３）左ポケット下ボディ中央より</p></td>
													<td><img src="img/oderForm/oderSlectName/pocket_center.jpg"
														width="200" height="208" border="0">
													<p>４）ポケットの真ん中に</p></td>
												</tr>
												<tr>
													<td><img src="img/oderForm/oderSlectName/cuffs_naname.jpg"
														width="200" height="134" border="0">
													<p>５）カフスに斜めに</p></td>
													<td><img src="img/oderForm/oderSlectName/cuffs_center.jpg"
														width="200" height="134" border="0">
													<p>６）カフスの中央に</p></td>
												</tr>
											</tbody>
										</table>
									</li>
								</ul>

								<p>（下記のプルダウンメニューより上記の１）～６）までもしくは７）の左袖８）の直接ボディを選択して下さい）</p>
								<div class="t_c">
									<p style="color:red">＊ネームの場所は必須項目です。</p>
									<select name="namePosition">
										<option value="" selected="">ネームの場所を選択して下さい。</option>
										<option value="1" ${order.namePosition == "ポケット上中央" ?"selected=":""}>
										１）ポケットの上中央</option>
										<option value="2" ${order.namePosition == "左ポケット上ボディ中央" ?"selected=":""}>
										２）左ポケットの上ボディ中央より</option>
										<option value="3" ${order.namePosition == "左ポケット下ボディ中央" ?"selected=":""}>
										３）左ポケット下ボディ中央より</option>
										<option value="4" ${order.namePosition == "ポケット真ん中" ?"selected=":""}>
										４）ポケットの真ん中に</option>
										<option value="5" ${order.namePosition == "カフス斜め" ?"selected=":""}>
										５）カフスに斜めに</option>
										<option value="6" ${order.namePosition == "カフス中央" ?"selected=":""}>
										６）カフスの中央に</option>
										<option value="7" ${order.namePosition == "左袖" ?"selected=":""}>
										７）左袖</option>
										<option value="8" ${order.namePosition == "ボディ直接" ?"selected=":""}>
										８）直接ボディに</option>
									</select>
								</div>
							</div>
						</div>
					</article>

					<article>
						<h2 id="button">ボタン（フリーとオプション）</h2>
						<p>最初にフリー（無料）のボタンが４種類。次にオプションボタンが１８種類ご覧になられます。オプションの蝶貝とプラスチックボタンのカラーに関しては全てハンド（手付け）でボタンを付けさせて頂きます。</p>
						<p>
							ボタンは貝ボタンになるとオプション扱いで価格が高くなりますが、貝ボタンでも高瀬貝ではなく、最高級の白蝶貝を使用しております。<br>
							また貝釦とプラスチックボタンの半分色付きに関しては全て手付けにて作業を行わせて頂きますのでご理解を頂ければと思います。
						</p>
						<h4 class="t_c">フリー（無料）ボタン</h4>
						<div class="tblbox">
							<ul class="col4 optbtn">
								<li>
									<label for="n1">
										<figure>
											<img src="img/oderForm/oderSlectButton/PRS.jpg">
											<figcaption>プラスチック ホワイト 二穴ボタン ミシン付け</figcaption>
										</figure>
									</label>
									<p>
										<input type="radio" name="button" value="1" id="n1" checked="" ${order.buttonDesignBeans.buttonId == "1" ?"checked=":""}>
									</p>
								</li>

								<li><label for="n2"><figure>
											<img src="img/oderForm/oderSlectButton/P2S.jpg">
											<figcaption>プラスチック ホワイト 四穴ボタン ２ミリ厚 ミシン付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="2" id="n2" ${order.buttonDesignBeans.buttonId == "2" ?"checked=":""}>
									</p></li>

								<li><label for="n3"><figure>
											<img src="img/oderForm/oderSlectButton/P3S.jpg">
											<figcaption>プラスチック ホワイト 四穴ボタン ２．５ミリ厚 ミシン付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="3" id="n3" ${order.buttonDesignBeans.buttonId == "3" ?"checked=":""}>
									</p></li>

								<li><label for="n4"><figure>
											<img src="img/oderForm/oderSlectButton/P2SBLACK.jpg">
											<figcaption>プラスチック ブラック 四穴ボタン ミシン付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="4" id="n4" ${order.buttonDesignBeans.buttonId == "4" ?"checked=":""}>
									</p></li>

								<li><label for="n5"><figure>
											<img src="img/oderForm/oderSlectButton/P2SbrOWN.jpg">
											<figcaption>プラスチック ブラウン 四穴ボタン ミシン付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="5" id="n5" ${order.buttonDesignBeans.buttonId == "5" ?"checked=":""}>
									</p></li>
							</ul>
						</div>
						<h4 class="t_c">【オプションボタン】</h4>
						<div class="tblbox">
							<ul class="col4 optbtn">

								<li><label for="o1"><figure>
											<img src="img/oderForm/oderSlectButton/W2S.jpg">
											<figcaption>白蝶貝４つ穴２ミリ厚 オプション価格￥１，０００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="6" id="o1" ${order.buttonDesignBeans.buttonId == "6" ?"checked=":""}>
									</p></li>

								<li><label for="o2"><figure>
											<img src="img/oderForm/oderSlectButton/W3S.jpg">
											<figcaption>白蝶貝４つ穴３ミリ厚 オプション価格￥１，３００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="7" id="o2" ${order.buttonDesignBeans.buttonId == "7" ?"checked=":""}>
									</p></li>

								<li><label for="o3"><figure>
											<img src="img/oderForm/oderSlectButton/W4S.jpg">
											<figcaption>白蝶貝４つ穴４ミリ厚 オプション価格￥１，５００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="8" id="o3" ${order.buttonDesignBeans.buttonId == "8" ?"checked=":""}>
									</p></li>

								<li><label for="o4"><figure>
											<img src="img/oderForm/oderSlectButton/SS.jpg">
											<figcaption>四角の白蝶貝４つ穴４ミリ厚 オプション価格￥２，０００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="9" id="o4" ${order.buttonDesignBeans.buttonId == "9" ?"checked=":""}>
									</p></li>

								<li><label for="o5"><figure>
											<img src="img/oderForm/oderSlectButton/B2S.jpg">
											<figcaption>黒蝶貝４つ穴２ミリ厚 オプション価格￥１，０００＋税 手付</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="10" id="o5" ${order.buttonDesignBeans.buttonId == "10" ?"checked=":""}>
									</p></li>

								<li><label for="o6"><figure>
											<img src="img/oderForm/oderSlectButton/B3S.jpg">
											<figcaption>黒蝶貝４つ穴３ミリ厚 オプション価格￥１，３００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="11" id="o6" ${order.buttonDesignBeans.buttonId == "11" ?"checked=":""}>
									</p></li>

								<li><label for="o7"><figure>
											<img src="img/oderForm/oderSlectButton/br2S.jpg">
											<figcaption>茶蝶貝４つ穴２ミリ厚 オプション価格￥１，０００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="12" id="o7" ${order.buttonDesignBeans.buttonId == "12" ?"checked=":""}>
									</p></li>

								<li><label for="o8"><figure>
											<img src="img/oderForm/oderSlectButton/upgreen.jpg">
											<figcaption>下半分アクアブルー2.5ミリ厚 オプション価格￥８００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="13" id="o8" ${order.buttonDesignBeans.buttonId == "13" ?"checked=":""}>
									</p></li>

								<li><label for="o9"><figure>
											<img src="img/oderForm/oderSlectButton/upblue.jpg">
											<figcaption>下半分ブルー2.5ミリ厚 オプション価格￥８００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="14" id="o9" ${order.buttonDesignBeans.buttonId == "14" ?"checked=":""}>
									</p></li>

								<li><label for="o10"><figure>
											<img src="img/oderForm/oderSlectButton/upgrey.jpg">
											<figcaption>下半分グレー2.5ミリ厚 オプション価格￥８００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="15" id="o10" ${order.buttonDesignBeans.buttonId == "15" ?"checked=":""}>
									</p></li>

								<li><label for="o11"><figure>
											<img src="img/oderForm/oderSlectButton/uporange.jpg">
											<figcaption>下半分オレンジ2.5ミリ厚 オプション価格￥８００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="16" id="o11" ${order.buttonDesignBeans.buttonId == "16" ?"checked=":""}>
									</p></li>

								<li><label for="o12"><figure>
											<img src="img/oderForm/oderSlectButton/upred.jpg">
											<figcaption>下半分レッド2.5ミリ厚 オプション価格￥８００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="17" id="o12" ${order.buttonDesignBeans.buttonId == "17" ?"checked=":""}>
									</p></li>


								<li><label for="o14"><figure>
											<img src="img/oderForm/oderSlectButton/pb2.jpg">
											<figcaption>ネイビープラボタン２．５ミリ厚 オプション価格￥５００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="18" id="o14" ${order.buttonDesignBeans.buttonId == "18" ?"checked=":""}>
									</p></li>

								<li><label for="o15"><figure>
											<img src="img/oderForm/oderSlectButton/ps2.jpg">
											<figcaption>ブループラボタン２．５ミリ厚 オプション価格￥５００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="19" id="o15" ${order.buttonDesignBeans.buttonId == "19" ?"checked=":""}>
									</p></li>

								<li><label for="o16"><figure>
											<img src="img/oderForm/oderSlectButton/pp2.jpg">
											<figcaption>ピンクプラボタン２．５ミリ厚 オプション価格￥５００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="20" id="o16" ${order.buttonDesignBeans.buttonId == "20" ?"checked=":""}>
									</p></li>

								<li><label for="o17"><figure>
											<img src="img/oderForm/oderSlectButton/pw2.jpg">
											<figcaption>ワインプラボタン２．５ミリ厚 オプション価格￥５００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="21" id="o17" ${order.buttonDesignBeans.buttonId == "21" ?"checked=":""}>
									</p></li>

								<li><label for="o18"><figure>
											<img src="img/oderForm/oderSlectButton/pg2.jpg">
											<figcaption>グレープラボタン２．５ミリ厚 オプション価格￥５００＋税 手付け</figcaption>
										</figure></label>
									<p>
										<input type="radio" name="button" value="22" id="o18" ${order.buttonDesignBeans.buttonId == "22" ?"checked=":""}>
									</p></li>

							</ul>
						</div>

						<h3>ボタン付け糸・ホール糸</h3>
						<div class="wid80">
							<p>ボタン付け糸ボタンホール糸も白以外のものをお選び頂けます。変えない場合は次にお進み下さい。</p>

							<figure>
								<img src="img/oderForm/oderSlectButton/hole_color.jpg">
							</figure>
							<p>ボタンホールとボタンつけ糸も変更が可能です。一般的には白ですが、白以外にもアクセントとしてボタンつけ糸やボタンホール糸に色糸を使う場合がございます。</p>
							<p>ボタンホール糸とボタンつけ糸を白で選んだ場合でも濃色の生地の場合はボタンホール糸は白の方が目立ってしまう場合もございます。その場合は生地と同じ糸（縫い糸）をお勧めする場合がございます。</p>
							<p>下の色糸からボタンつけ糸、ボタンホール糸を変更する場合はお選び下さい。</p>

							<figure>
								<img src="img/oderForm/oderSlectButton/name_color.jpg">
							</figure>
							<p>上記の１８の色からお選び頂きます。１８の白を除いて下に画像を掲載させて頂きました。</p>
						</div>
						<table class="tbl1 wid70">
							<tbody>
								<tr>
									<td>（１）ブラック</td>
									<td>（２）ネイビー</td>
									<td>（３）サックスブルー</td>
									<td>（４）シルバー</td>
								</tr>
								<tr>
									<td>（５）シルバーグレー</td>
									<td>（６）グレー</td>
									<td>（７）ライトブラウン</td>
									<td>（８）ブラウン</td>
								</tr>
								<tr>
									<td>（９）ダークブラウン</td>
									<td>（１０）レッド</td>
									<td>（１１）ワイン</td>
									<td>（１２）オレンジ</td>
								</tr>
								<tr>
									<td>（１３）イエロー</td>
									<td>（１４）エメラルドグリーン</td>
									<td>（１５）グリーン</td>
									<td>（１６）ピンク</td>
								</tr>
								<tr>
									<td>（１７）パープル</td>
									<td>（１８）ホワイト</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>

						<figure>
							<img src="img/oderForm/oderSlectButton/ito_color1.jpg">
							<img src="img/oderForm/oderSlectButton/ito_color2.jpg">
						</figure>
						<table class="tbl4">
							<tbody>
								<tr>
									<td>ボタン付け糸</td>
									<th><select size="1" name="buttonThread">
											<option value="0" selected="">白(特に指定のない場合は白）</option>
											<option value="1" ${order.buttonThread1 == "ブラック" ?"selected=":""}>１）ブラック</option>
											<option value="2" ${order.buttonThread1 == "ネイビー" ?"selected=":""}>２）ネイビー</option>
											<option value="3" ${order.buttonThread1 == "サックスブルー" ?"selected=":""}>３）サックスブルー</option>
											<option value="4" ${order.buttonThread1 == "シルバー" ?"selected=":""}>４）シルバー</option>
											<option value="5" ${order.buttonThread1 == "シルバーグレー" ?"selected=":""}>５）シルバーグレー</option>
											<option value="6" ${order.buttonThread1 == "グレー" ?"selected=":""}>６）グレー</option>
											<option value="7" ${order.buttonThread1 == "ライトブラウン" ?"selected=":""}>７）ライトブラウン</option>
											<option value="8" ${order.buttonThread1 == "ブラウン" ?"selected=":""}>８）ブラウン</option>
											<option value="9" ${order.buttonThread1 == "ダークブラウン" ?"selected=":""}>９）ダークブラウン</option>
											<option value="10" ${order.buttonThread1 == "レッド" ?"selected=":""}>１０）レッド</option>
											<option value="11" ${order.buttonThread1 == "ワイン" ?"selected=":""}>１１）ワイン</option>
											<option value="12" ${order.buttonThread1 == "オレンジ" ?"selected=":""}>１２）オレンジ</option>
											<option value="13" ${order.buttonThread1 == "イエロー" ?"selected=":""}>１３）イエロー</option>
											<option value="14" ${order.buttonThread1 == "エメラルドグリーン" ?"selected=":""}>１４）エメラルドグリーン</option>
											<option value="15" ${order.buttonThread1 == "グリーン" ?"selected=":""}>１５）グリーン</option>
											<option value="16" ${order.buttonThread1 == "ピンク" ?"selected=":""}>１６）ピンク</option>
											<option value="17" ${order.buttonThread1 == "パープル" ?"selected=":""}>１７）パープル</option>
											<option value="18" ${order.buttonThread1 == "ホワイト" ?"selected=":""}>１８）ホワイト</option>
									</select></th>
								</tr>
								<tr>
									<td>ボタンホール糸（濃色の生地には縫い糸を使わせて頂きます）</td>
									<th><select size="1" name="buttonHole">
											<option value="0" selected="">白(特に指定のない場合は白、濃色の生地には縫い糸を使わせて頂きます）</option>
											<option value="1" ${order.buttonThread2 == "ブラック" ?"selected=":""}>１）ブラック</option>
											<option value="2" ${order.buttonThread2 == "ネイビー" ?"selected=":""}>２）ネイビー</option>
											<option value="3" ${order.buttonThread2 == "サックスブルー" ?"selected=":""}>３）サックスブルー</option>
											<option value="4" ${order.buttonThread2 == "シルバー" ?"selected=":""}>４）シルバー</option>
											<option value="5" ${order.buttonThread2 == "シルバーグレー" ?"selected=":""}>５）シルバーグレー</option>
											<option value="6" ${order.buttonThread2 == "グレー" ?"selected=":""}>６）グレー</option>
											<option value="7" ${order.buttonThread2 == "ライトブラウン" ?"selected=":""}>７）ライトブラウン</option>
											<option value="8" ${order.buttonThread2 == "ブラウン" ?"selected=":""}>８）ブラウン</option>
											<option value="9" ${order.buttonThread2 == "ダークブラウン" ?"selected=":""}>９）ダークブラウン</option>
											<option value="10" ${order.buttonThread2 == "レッド" ?"selected=":""}>１０）レッド</option>
											<option value="11" ${order.buttonThread2 == "ワイン" ?"selected=":""}>１１）ワイン</option>
											<option value="12" ${order.buttonThread2 == "オレンジ" ?"selected=":""}>１２）オレンジ</option>
											<option value="13" ${order.buttonThread2 == "イエロー" ?"selected=":""}>１３）イエロー</option>
											<option value="14" ${order.buttonThread2 == "エメラルドグリーン" ?"selected=":""}>１４）エメラルドグリーン</option>
											<option value="15" ${order.buttonThread2 == "グリーン" ?"selected=":""}>１５）グリーン</option>
											<option value="16" ${order.buttonThread2 == "ピンク" ?"selected=":""}>１６）ピンク</option>
											<option value="17" ${order.buttonThread2 == "パープル" ?"selected=":""}>１７）パープル</option>
											<option value="18" ${order.buttonThread2 == "ホワイト" ?"selected=":""}>１８）ホワイト</option>
									</select></th>
								</tr>
							</tbody>
						</table>

					</article>

					<h3>その他のご要望</h3>
					<p>
						【その他のご要望】<br>
						その他のご要望がございましたら、こちらにご記入下さい。作業が困難なものもあるかも知れませんができるだけご要望にお答えできればと考えております。<br>変更が可能かどうかはご注文確認のメールをお送りする際にご連絡を致します。
					</p>
					<div class="t_c">
						<textarea rows="7" cols="70" name="otherRequest">${order.requestBeans.otherRequest}</textarea>
					</div>
				</article>

				<article>
					<c:if test = "${!isLogin}">
						<h2>お客様情報</h2>
						<p class="lgreen">※お疲れ様でした。オーダーシャツももう少し。あとはお名前等の情報をご記入下さい。</p>

						<table class="persona">
							<tbody>
								<tr>
									<td colspan="2"><span class="lgreen">■</span>グリーンの四角の箇所は必ずご記入下さい。</td>
								</tr>
								<tr>
									<td><label for="t01"><span class="lgreen">■</span>郵便番号</label></td>
									<td>
										<input name="zip" type="text" maxlength="8" id="t01" value="${personal.zip}"
										onKeyUp="AjaxZip3.zip2addr(this,'','address','address');"><br>
										<span class="red" id="zip_error"></span>
									</td>
								</tr>
								<tr>
									<td><label for="t02"><span class="lgreen">■</span>住所</label></td>
									<td>
										<input name="address" type="text" size="83"id="t02" value="${personal.address}"><br>
										<span class="red" id="address_error"></span>
									</td>
								</tr>
								<tr>
									<td><label for="t03"><span class="lgreen">■</span>お名前</label></td>
									<td>
										<input name="name" type="text" size="45"id="t03" value="${personal.name}"><br>
										<span class="red" id="name_error"></span>
									</td>
								</tr>
								<tr>
									<td><label for="t04"><span class="lgreen">■</span>ふりがな</label></td>
									<td>
										<input name="kana" type="text" size="45" id="t04" value="${personal.kana}"><br>
										<span class="red" id="kana_error"></span>
									</td>
								</tr>
								<tr>
									<td><label for="t05"><span class="lgreen">■</span>お電話番号</label></td>
									<td>
										<input name="tel" type="text" size="45" id="t05" value="${personal.tel}">
										<label for="t05">お電話番号は<span class="st">（ハイフン）無し半角にてご記入下さい。</span></label><br>
										<span class="red" id="tel_error"></span>
									</td>
								</tr>
								<tr>
									<td>■性別</td>
									<td><input type="radio" name="gender" value="1"  checked="" id="t07"
									${personal.gender == "男性"?"checked":""}>
										<label for="t07">男性</label>&nbsp;
										<input type="radio" name="gender" value="2" id="t07"
										${personal.gender == "女性"?"checked":""}>
										<label for="t07">女性</label>&nbsp;
									</td>
								</tr>

								<tr>
									<td>■配送金額</td>
									<td>全国一律\500+税とさせて頂きます。</td>
								</tr>

							</tbody>
						</table>
					</c:if>

					<ul class="submitbtn">
						<li><input name="submit" type="submit"
							value="ご注文内容の確認です。クリックをお願いします。">
							<p>上の「ご注文内容の確認です。クリックをお願いします。」ボタンをクリックして頂きますと次ページにご記入頂いたデータを表にして表示させて頂きます。ご確認を頂き間違いがなければ次ページの送信ボタンを押して頂ければオーダーとなります。</p>
						</li>
						<li><input name="reset" type="reset" value="ご注文内容のクリア">
							<p>ご注文の内容をクリアする場合は上のボタンを押して下さい。</p></li>
					</ul>
				</article>
			</form>
		</div>
		<p class="gotop wrap">
			<a onclick="window.history.back()">戻る</a>
		</p>
	</body>
</html>