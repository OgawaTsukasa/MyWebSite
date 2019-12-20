<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<link rel="stylesheet" href="./css/common.css" media="all">
<link rel="stylesheet" href="./css/sub.css" media="all">
<link rel="stylesheet" href="./css/layout.css" media="all">
</head>

<body>
	<header>
		<figure>
			<img src="./img/PageTop/topimg (1).jpg">
		</figure>

	</header>
	<nav class="gmenu">
		<ul id="menu">
			<jsp:include page="/baselayout/header.jsp"/>
		</ul>
	</nav>

	<div class="contents wrap">
		<div class="confirm">
			<h2 align="center">■オーダーシャツの採寸方法・お客様の身体を計る方法。</h2>
			<table class="table1 fixed v_top">
				<tbody>
					<tr>
						<td valign="top"><img src="./img/size/title_kubi.jpg"
							border="0"><br> <br> 首周り（ネックサイズ）の採寸です。<br> <br>
							シャツの首元を大きく開けて頂いてから採寸をお願いできればと思いますが、丁度シャツのカラ－が首に当たるところを１周した数値が首周りになります。ただ御注文の際には実寸ではなく出来上がりの数値を入れて頂きたく思います。
							<br> <br>
							出来上がりサイズというのは首周りをお計りする際に写真のように軽く指が２本入るくらい。ゆったり目がお好きであれば３本ゆっくり入る方法が良いと覆います。目安として首周りの実寸より２．５センチ、ゆったり目であれば３センチ程プラスして頂ければ間違いないと思います。
						</td>
						<td><img src="./img/size/neck.jpg" border="0" align="top"><br></td>
						<br>
					</tr>

					<tr>
						<td valign="top"><img src="./img/size/title_katahaba.jpg"
							border="0"><br> <br>
							ジャストサイズのシャツをご着用であれば、シャツの肩巾を右の写真やその下に貼ってあります。Youtubeの動画を確認頂きましてお計り頂ければと思います。<br>
							<br>
							肩巾は肩の左右の骨。グリグリと骨が出ているところまで計ります。大きく計るとゆったりとして着心地が良く思えるかも知れませんが、あまり大きく採寸すると逆に手が上がりにくくなります。<br>
							<br> シャツのゆとり（ゆるみ）は大きくとったとしても肩巾はジャストサイズをお勧め致します。</td>
						<td><img src="./img/size/katahaba.jpg" border="0"><br></td>
					</tr>

					<tr>
						<td valign="top"><img src="./img/size/title_yukitake.jpg"
							border="0"> <br>
							衿の真後ろ、ヨークの中心、肩幅の半分）より肩先を通してカフスの先まで計ります。<br> <br>
							基本的に５ミリ単位です。左右の長さが違う人が当店の経験上半数くらいはいらっしゃいますので、左右をお計り下さい。<br>
							<br>
							ジャストサイズのシャツをご着用の場合はカフスの先まで、シャツをご着用でない場合は、基本的には手の骨のグリグリより１．５センチ～２センチ程長く（下方向
							手首のくびれがある所
							個人差があり）お計りになられれば良いと思います。この位置を基本にして長めがお好きか短めがお好きかで裄丈のサイズを決定して頂ければと思います。
						</td>
						<td><img src="./img/size/sodetake (1).jpg" border="0"><br></td>
					</tr>

					<tr>
						<td valign="top"><img src="./img/size/title_ah.jpg"
							border="0" align="top"><br> <br>
							アームホール（袖周り）のサイズです。脇の下から肩先（骨の上）を通って1周計ります。<br> <br>
							袖を下ろした状態で、しっかりとお計り頂ければと思います。ルーズに計る必要もあまりありません。<br> <br>
							<br>
							また左右のアームホールには誰もが多少の差があるとも思いますが、基本的には右利きの方は右、左利きの方は左をお計り頂ければと思います。<br>
							<br> <br>
							また採寸の加減が難しいところでもあります。どうしても採寸の仕方が分からなければ胸囲からアームホールを割り出すことも可能ですのでアームホールに関してはご記入なさらなくても御注文は可能です。
						</td>
						<td><img src="./img/size/arm_hole.jpg" border="0"><br></td>
					</tr>

					<tr>
						<td valign="top"><img src="./img/size/title_bust.jpg"
							border="0"><br> <br>
							上胴（バスト）のお採寸です。特に難しことはありません。基本的にはは胸の一番高い所、乳首の上辺を採寸して頂ければと思います。<br>
							<br> <br> 背中側にメジャーのたるみの無いように採寸して頂ければと思います。<br> <br>
						</td>
						<td><img src="./img/size/bust (1).jpg" border="0"><br></td>
					</tr>

					<tr>
						<td valign="top"><img src="./img/size/title_waist.jpg"
							border="0" align="top"><br> <br>
							中胴（ウエスト）の採寸です。上胴と同じように採寸して頂ければと思います。<br> <br> <br>
							目安としてはおへその辺りを計ればいいと思います。一番お腹の出ている箇所の計測となります。<br>
							この場合はスラックスの寸法と同じになることはありません。恐らくはスラックスのウエスト寸法よりも数センチ大きな値になると思います。こちらも胸囲の測定同様、きつめに計る必要もありませんし、極端にゆったり計る必要もありません。
						</td>
						<td><img src="./img/size/waist (1).jpg" border="0"><br></td>
					</tr>

					<tr>
						<td valign="top"><img src="./img/size/title_hip.jpg"
							border="0" align="top"><br> <br>
							下胴（ヒップ）の採寸です。上胴中胴と同様な採寸方法で良いと思います。お尻の真ん中、一番大きな所を一周計ります。<br>
							<br> <br> 採寸時に後ろ側でメジャーがたるまないように気を付けて頂ければと思います。</td>
						<td><img src="./img/size/hip (1).jpg" border="0"><br></td>
					</tr>

					<tr>
						<td valign="top"><img src="./img/size/title_kitake.jpg"
							border="0" align="top"><br> <br>
							シャツの丈、着丈の採寸です。衿の直ぐ下、ヨークと衿の継ぎ目から真っ直ぐにお尻の下までを計測します。<br> <br>
							<br>
							写真ではそのまま１直線にメジャーを下ろしていますが、人間の身体はおへその裏辺りが一番くびれております。動画で確認できますようにその辺りで一度メジャーを止めてお尻の下までお計り頂ければ一番正確な数値になると思います。<br>
							<br> <br>
							パンツアウトしてご着用になるシャツの場合着丈を短くしてお作りする場合もあります。その時はちょうどお尻の半分辺までを採寸して頂ければと思います。丁度右写真の白から緑に変わる部分があると思いますが、その白から緑に変わった辺から２センチ程下が一般的なサイズだと思います。<br>
							<br> <br> その際には脇からシャツが出ないように裾のカーブを浅く裁断するように致します。</td>
						<td><img src="./img/size/kitake.jpg" border="0"><br></td>
					</tr>

					<tr>
						<td valign="top"><img src="./img/size/title_cuffs.jpg"
							border="0"><br> <br>
							カフス周りの採寸です。カフスの大きさを決定する訳ですが、ここでは実寸をご記入下さい。<br> <br>
							袖口の骨の所一番大きな（太い）箇所になると思います。その一周をお計り下さい。もし左右の手首の差があるようですと両方お計り頂ければと思いますが、手首に関しては左右同じ大きさの方がほとんどだと思います。<br>
							<br>
							通常は実寸に７センチのゆとり（ゆるみ）をお入れしてカフスの大きさを決定します。左手に時計をされる方は少し左側を大きくする場合がありますが、その数値の決定に関しては御注文時にサイズをご記入頂くところで選択できるようにしてあります。
						</td>
						<td><img src="./img/size/cuffs (1).jpg" border="0"><br>
						<iframe></iframe></td>
					</tr>
				</tbody>
			</table>

			<h2 align="center">■採寸箇所をイラストでご確認下さい</h2>
			<table class="wid726 fixed">
				<tbody>
					<tr>
						<td><img src="./img/size/buck.jpg" border="0"></td>
						<td><img src="./img/size/front.jpg" border="0"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<p class="gotop wrap">
		<a onclick="window.history.back()">戻る</a>
	</p>
</body>
</html>