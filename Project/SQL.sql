CREATE DATABASE IF NOT EXISTS `Made_to_order` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `Made_to_order`;





CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personal_id` int(11) NOT NULL ,
  `size_id` int(11) NOT NULL ,
  `login_id` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `personal_info`(
	`id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`user_id` int(11) DEFAULT NULL,
	`name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
	`kana` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
	`zip` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
	`address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
	`tel` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
	`gender` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




CREATE TABLE `size` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`user_id` int(11) DEFAULT NULL,
	`neck` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
	`shoulder` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
	`arm` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	`sleeveRigt` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	`sleeveLeft` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	`bust` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	`waist` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
 	`hips` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	`length` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	`cuffsRigt` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	`cuffsLeft` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	`height` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `brand` (
	`id` int(11) PRIMARY KEY,
	`b_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`c_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `brand` (`id`, `b_name`, `c_name`) VALUES
	(1,'Canclini(カンクリーニ)社製','イタリア'),
	(2,'Thomas Mason(トーマスメイソン)社製','イタリア'),
	(3,'Alumo(アルモ)','スイス'),
	(4,'Carlo Riva(カルロリーバ)社製','イタリア'),
	(5,'LEGGIUNO(レジウノ)社製','イタリア'),
	(6,'GIZA(ギザ)社製','日本');





CREATE TABLE `item` (
	`id` int(11) PRIMARY KEY,
	`brand_id` int(11) NOT NULL,
	`material` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`price` int(11) NOT NULL,
	`color` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`remark` text COLLATE utf8_unicode_ci,
	`depth` int(11) NOT NULL,
	`cloth` text COLLATE utf8_unicode_ci,
	`detail` text COLLATE utf8_unicode_ci,
	`file_name1` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
	`file_name2` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `item` (`id`,`brand_id`,`material`,`price`,`color`,`remark`,`depth`,`cloth`,`detail`,`file_name1`,`file_name2`)VALUES
	(1,1,'コットン１００％',21000,'ホワイト','９０番手双糸',5,'当店一押しの白の変わり織り生地','立体感があり、白でもフォーマルっぽくなく仕上がります。ノーネクタイ等で着用したいシャツに仕上げるのも良いかも知れません。ボタンダウンやカッタウェイなどの衿で。','image1','image4'),
	(2,1,'綿１００％',18000,'ブルー','ビジネス・カジュアル',3,'ネイビー細ストライプ生地','シンプルな飽きのこないネイビーブルーのストライプシャツです。白の部分の方が多いので、コーディネートしやすいと思います。ボタンダウンや、クレリックにしても綺麗だと思います。','image1 (1)','image4 (1)'),
	(3,1,'綿１００％',18000,'ピンク','カジュアル・ドレス',3,'明るいピンクの太ストライプ生地','生地のタッチもよく、明るくすっきりとしたストライプです。','image1 (2)','image4 (2)'),
	(4,1,'綿１００％',18000,'グレー','ビジネス・カジュアル',3,'グレーの太ストライプ生地','落ち着いた色合いのすっきりとしたストライプです。','image1 (3)','image4 (3)'),
	(5,1,'綿１００％',18000,'ブラック','ビジネス・カジュアル',3,'黒の太巾ストライプ生地','黒が約4.5ミリ、白の部分が約2ミリ。ロンドンストライプは等幅のものをいいますが、こちらは黒の部分が多い生地。ロンドンストライプよりも、更にシャープな印象です。','image1 (4)','image4 (4)');


INSERT INTO `item` (`id`,`brand_id`,`material`,`price`,`color`,`remark`,`depth`,`cloth`,`detail`,`file_name1`,`file_name2`)VALUES
	(6,2,'コットン１００％',20000,'ホワイト','ブロード',3,'トーマスメイソン社製の120番手双糸','トーマスメイソンの生地は国産の生地に比べると張りがあるのが特徴です。決して硬い訳ではありませんが、糸番手が上がると柔らかくなり張りがなくなってくるのが普通かと思います。<br>こちらの生地は触りは優しくそしてシワになりにくような張りもある。お好みにもよりますが、生地を作るうえでのコンセプトの違いかと思います。エジプト綿や海島綿の白もの柔らかさ、そして同じ番手であってもトーマスメイソンの白。どちらも楽しみ方が違うところです。','image1 (5)','image4 (5)'),
	(7,2,'コットン１００％',25000,'ブルー','１４０番手ゴールドライン',3,'最高級番手ブルーオックスフォード','トーマスメイソンの最高級グレード。ゴールドラインのオックスフォードクロス。ブルーですが少し赤みを帯びたブルーです。しなやかだけど、張りのある生地。このラインのファンの方も多いはず。','image1 (11)','image4 (10)'),
	(8,2,'綿１００％',20000,'ピンク','120番手双糸',3,'１２０番手ピンクツイル生地（綾織り）','新しく登場しました、トーマスメイソンのピンクの120番手のツイル（綾織り）生地です。トーマスメイソンの人気は他の生地メーカーよりも、糸のテンションが強く、皺になりにくいのが特徴で、多くのファンから愛されていますが、されにこの生地は特殊な加工を施してあり、通常のトーマスメイソンよりも更に皺になりにくい生地です。120番手と高級番手なのに皺になりにくい。','image1 (6)','image4 (6)'),
	(9,2,'コットン１００％',25000,'グレー','ビジネス・カジュアル',3,'グレーのヘリンボーン生地','トーマスメイソンのゴールドライン。その品質は誰もが知るところではありますが。柔らかさそして張り。両方を兼ね備えた生地です。','image1 (7)','image4 (7)'),
	(10,2,'リネン１００％',25000,'ブラック','SAHARA BRIGHT 100%LINEN 23/1',1,'リネン１００％ブラック生地 ','シャリ感のある、サラッとした生地です。黒でも多少は透けますので、下着の上にご着用の方は白の下着は避けた方が良いかと思います。黒や色や黒っぽいグレーなどが良いかと思います。','image1 (8)','image3');


INSERT INTO `item` (`id`,`brand_id`,`material`,`price`,`color`,`remark`,`depth`,`cloth`,`detail`,`file_name1`,`file_name2`)VALUES
	(11,3,'綿１００％',22000,'ホワイト','１２０番手双糸',3,'ヘリンボーン調の光沢あるストライプドビー柄の生地','凹凸感もあり、光沢もあります。１２０番という細番手でありながら、立体感のある織り方で、厚みも確保しています。','image1 (9)','image4 (8)'),
	(12,3,'綿１００％',25000,'ブルー','170番手双糸',2,'１７０番高級番手のブルーチェック生地','糸番手が１７０番と超高級番手、細番手だから一本一本の線も細く、その線で構成されたチェック生地です。','image1 (10)','image4 (9)'),
	(13,3,'綿１００％',25000,'ピンク','ビジネス・カジュアル・170番手',3,'落ち着いたピンクの高級オックスフォードクロス','鮮やかなピンクと、落ち着いたピンクがありますが、この生地はどちらかというと、落ち着いたピンク色。170番手の超細番手。オックスフォードクロスでもサラッとした肌触りです。','image1 (12)','image4 (11)'),
	(14,3,'綿１００％',25000,'グレー','１７０番手双糸',2,'グレーの細ストライプ１７０番手双糸','ガーゼのような肌触りの高級番手生地。綿ローンです。糸が細いために生地は薄め。と言ってもボイルのような生地でもありません。綿ローンですね。このような生地を着るともう戻れなくなるかも知れません。','image1 (13)','image4 (12)');


INSERT INTO `item` (`id`,`brand_id`,`material`,`price`,`color`,`remark`,`depth`,`cloth`,`detail`,`file_name1`,`file_name2`)VALUES
	(15,4,'綿１００％',45000,'ホワイト','	リシオ　180番手双糸',2,'最高級リシオ１８０番手のツイル白の生地','リシオは１８０番と超細番手ですが、この生地はツイル（綾織り）なので、平織りに比べると多少は厚いかと思いますし、そのおかげで透けにくいと思います。着ているのかどうか？が分からなくなるほど、軽い仕上がりのシャツです。','image1 (14)','image4 (13)'),
	(16,4,'綿１００％',45000,'ブルー','170番手双糸',2,'マットなブルー無地','、無地ですが、日本にはないような色合いです。落ち着いたブルーというのでしょうか。赤みのあるブルーも多いですが、こちらはまさに落ち着いたブルーとしか表現できない色合いです。','image1 (15)','image4 (14)'),
	(17,4,'綿１００％',45000,'ピンク','	170番手双糸・ツイル',3,'１７０番ツイル（綾織）ピンク生地','打ち込みがしっかりした170番手の生地のツイル生地。平織りよりも光沢があり、上品な輝きは着る人さえ選ぶでしょう。','image1 (16)','image4 (15)'),
	(18,4,'綿１００％',40000,'グレー','１７０番手双糸・スーパーリバ',3,'高級素材グレーのツイル・スーパーリバ　170番手','カルロ・リーバでも張りのある生地です。<br>生地を手で持った写真をご覧になって頂ければ、その光沢がよく分かるかと思います。','image1 (17)','image4 (16)');


INSERT INTO `item` (`id`,`brand_id`,`material`,`price`,`color`,`remark`,`depth`,`cloth`,`detail`,`file_name1`,`file_name2`)VALUES
	(19,5,'綿１００％',19000,'マルチ','プリント生地・カジュアル',4,'パイプ柄のプリント生地','パイプでも色んな形、色んな色を組み合わせて、また方向に変化を付けてシャツ生地に。','image1 (18)','image4 (17)'),
	(20,5,'綿１００％',19000,'マルチ','プリント生地・カジュアル',4,'クラッシクカー柄のプリント生地','クラッシクカー柄のプリント生地です。バックプリントのように薄いブルーで自由の女神がプリントされています。','image1 (19)','image4 (18)'),
	(21,5,'綿１００％',19000,'マルチ','プリント生地・カジュアル',4,'楽器柄のプリント生地','全ての柄をいいますと、ドラム、ギター2種類（ベースかも？）、電子ピアノ、トランペット、ドラムのスティック、マイク（2種類）、ヘッドフォン、音符、ROCKという文字。','image1 (20)','image4 (19)'),
	(22,5,'綿１００％',19000,'マルチ','プリント生地・カジュアル',4,'レコード柄ジュークボックス・ロカビリー柄','白地にレコードを散りばめたプリント、そして良き時代のアメリカの音楽シーンをイメージしたプリント柄です。','image1 (21)','image4 (20)'),
	(23,5,'綿１００％',18000,'マルチ','プリント生地・カジュアル',4,'サーカス柄のプリント生地','ご覧の通りの楽しいサーカスの柄のプリント生地。象に虎に、ピエロも。アシカだっています。カジュアルシャツに如何でしょうか。','image1 (22)','image4 (21)');


INSERT INTO `item` (`id`,`brand_id`,`material`,`price`,`color`,`remark`,`depth`,`cloth`,`detail`,`file_name1`,`file_name2`)VALUES
	(24,6,'コットン１００％',16000,'ホワイト','ビジネス・フォーマル',3,'定番の白のヘリンボーン生地','エジプト綿の１００番手双糸を使った定番の白ドビー生地です。エジプト綿自体が柔らかい生地ですが、更に綾で織りましと柔らかさと光沢が増します。ソフトな肌触り、そして飽きない柄をお求めでしたらお勧めします。','image1 (23)','image4 (22)'),
	(25,6,'綿１００％',17000,'ブルー','	ビジネス高級番手',4,'綿の綾織の生地ブルー','素材だけでも充分に高級ですし、その糸で織った生地ならば艶や着心地もいいのは間違いないのですが、平織りではなくツイル(綾織)ですのでその素材の持ち味を充分いかした生地だと思います。','image1 (24)','image4 (23)'),
	(26,6,'綿１００％',16000,'ピンク','１００番手双糸シャンブレー',3,'淡い色合いのピンクのシャンブレー生地','シャンブレーとは縦糸に色糸、横糸に白糸、もしくは縦糸と違う色糸を使用した生地のことをいい。生地に立体感が出て、平織りのベタ無地に比べると高級感増す生地になります。','image1 (25)','image4 (24)'),
	(27,6,'綿１００％',16000,'グレー','１００番手双糸シャンブレー',3,'グレーのシャンブレー生地','シャンブレーとは縦糸に色糸、横糸に白糸、もしくは縦糸と違う色糸を使用した生地のことをいい。生地に立体感が出て、平織りのベタ無地に比べると高級感増す生地になります。<br>こちらの生地はグレーといっても、沈み込むような暗いグレーではなく、少し赤みの入ったブルーがかったグレーです。','image1 (26)','image4 (25)'),
	(28,6,'綿１００％',17000,'ブラック','エジプト綿１２０番手双糸',3,'黒の細ロンドンストライプ生地','勿論素材はエジプト綿。糸番手は120番双糸の高級番手です。触りもかなりしなやか上品なドレスシャツにはぴったりな感じです。色柄とそして素材の高級さとバランスのとれたシャツ生地です。 黒と白のストライプですから、全体的には濃いグレーに見えると思います。','image1 (27)','image4 (26)');





CREATE TABLE `silhouette_design` (
  `id` int(11) NOT NULL,
  `style` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `silhouette_design` (`id`,`type`,`file`) VALUES
	(1,'モードスタイル','style1.jpg'),
	(2,'イタリアンスタイ','style2.jpg'),
	(3,'セミソフトスタイル','style3.jpg'),
	(4,'ソフトスタイル','style4.jpg');





CREATE TABLE `collar_design` (
  `id` int(11) NOT NULL,
  `type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `collar_design` (`id`,`type`,`file`) VALUES
	(1,'レギュラーカラー','cs1.jpg'),
	(2,'ショートカラー','cs2.jpg'),
	(3,'ロングポイント','cs3.jpg'),
	(4,'ボタンダウン','cs4.jpg'),
	(5,'クラッシコボタンダウン','cs5.jpg'),
	(6,'マイタカラーのボタンダウン','cs6.jpg'),
	(7,'スナップダウン','cs7.jpg'),
	(8,'イタリンラウンド','cs8.jpg'),
	(9,'ゲーブルカラーショートワイルド','cs9.jpg'),
	(10,'クラッシコワイルド','cs10.jpg'),
	(11,'セミワイド','cs11.jpg'),
	(12,'ワイド','cs12.jpg'),
	(13,'ホリゾンタルワイド','cs13.jpg'),
	(14,'ドゥエボットーニ','cs14.jpg'),
	(15,'ドゥエボットーニのボタンダウン','cs15.jpg'),
	(16,'ドゥエボットーニのワイルドカラー','cs16.jpg'),
	(17,'ラウンドカラー','cs17.jpg'),
	(18,'ナローカラー','cs18.jpg'),
	(19,'タブラカー','cs19.jpg'),
	(20,'ピンホール','cs20.jpg'),
	(21,'スタンドのボタンダウン','cs21.jpg'),
	(22,'スタンドカラー','cs22.jpg'),
	(23,'二段のスタンドカラー','cs23.jpg'),
	(24,'ウィングカラー','cs24.jpg'),
	(25,'カッタウエイカラー(1)','cs25.jpg'),
	(26,'カッタウエイカラー(2)','cs26.jpg');





CREATE TABLE `cuffs_design` (
	`id` int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`file` varchar(256) COLLATE utf8_unicode_ci NOT NULL
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `cuffs_design` (`id`,`type`,`file`) VALUES
	(1,'スタンダードカフス','ks1.jpg'),
	(2,'ラウンドカフス(中丸)','ks2.jpg'),
	(3,'ラウンドカフス(大丸)','ks3.jpg'),
	(4,'スクエア　角落し','ks4.jpg'),
	(5,'直角(本カフス)','ks5.jpg'),
	(6,'ラウンド　ボタン2個付き','ks6.jpg'),
	(7,'ダブルカフス　折り返しラウンド','ks7.jpg'),
	(8,'ダブルカフス　折り返し直角','ks8.jpg'),
	(9,'ターンナップカフス　ボタン1個','ks9.jpg'),
	(10,'ターンナップカフス　ボタン2個','ks10.jpg');





CREATE TABLE `cuffs_button`(
	`id` int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256)  utf8_unicode_ci NOT NULL,
	`file` varchar(256) COLLATE utf8_unicode_ci NOT NULL
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `cuffs_button` (`id`,`type`,`file`) VALUES
	(1,'シングルボタン止め','single.jpg'),
	(2,'カフスもできるコンバーチブル仕様','con1.jpg'),
	(3,'ボタン無し仕様(ダブルカカフスはこちら)','con2.jpg');





CREATE TABLE `cuffs_watch`(
	`id` int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256) COLLATE utf8_unicode_ci
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `cuffs_watch` (`id`,`type`) VALUES
	(1,'左右差無し'),
	(2,'左カフス+0.5㎝'),
	(3,'左カフス+1.0㎝'),
	(4,'右カフス+0.5㎝'),
	(5,'右カフス+1.0㎝');





CREATE TABLE `pocket_oder`(
	`id` int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`price` int(11) NULL
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `pocket_oder` (`id`,`type`,`price`) VALUES
	(1,'ノーマルポケット(片ポケット)','0'),
	(2,'ノーマルポケット(両ポケット)','0'),
	(3,'ペンタゴン(片ポケット)','0'),
	(4,'ペンタゴン(両ポケット)','0'),
	(5,'ボタン付き(片ポケット)','0'),
	(6,'ボタン付き(両ポケット)','0'),
	(7,'フラップ付き(片ポッケット)','0'),
	(8,'フラップ付き(両ポケット)','0'),
	(9,'フラップのボタン付き(片ポケット)','0'),
	(10,'フラップのボタン付き(両ポケット)','1500'),
	(11,'ポケット無し','0');





CREATE TABLE `name_design` (
	`id` int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`price` int(11) NOT NULL,
	`file` varchar(256) COLLATE utf8_unicode_ci NOT NULL
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `name_design` (`id`,`type`,`price`,`file`) VALUES
	(1,'ドイツ文字','550','doitsu.jpg'),
	(2,'イタリック','550','italic.jpg'),
	(3,'ゴシック体','550','goshic.jpg'),
	(4,'活字体','550','rome.jpg'),
	(5,'筆記体','550','hikkitai.jpg'),
	(6,'筆記体重ね','550','hikkitai_kasane.jpg'),
	(7,'ドイツ文字重ね','550','doitsu_kasane.jpg'),
	(8,'活字体重ね','550','rome_kasane.jpg'),
	(9,'漢字','550','japanese.jpg'),
	(10,'筆記体　綴り文字','550','tuzurimoji.jpg');





CREATE TABLE `name_color` (
	`id` int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`price` int(11) NOT NULL
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `name_color` (`id`,`type`,`price`) VALUES
	(1,'ブラック',0),
	(2,'ネイビー',0),
	(3,'サックスブルー',0),
	(4,'シルバー',0),
	(5,'シルバーグレー',0),
	(6,'グレー',0),
	(7,'ライトブラウン',0),
	(8,'ブラウン',0),
	(9,'ダークブラウン',0),
	(10,'レッド',0),
	(11,'ワイン',0),
	(12,'オレンジ',0),
	(13,'イエロー',0),
	(14,'エメラルドグリーン',0),
	(15,'グリーン',0),
	(16,'ピンク',0),
	(17,'パープル',0),
	(18,'ホワイト',0),
	(19,'シルバー光沢',300);





CREATE TABLE `name_position`(
	`id` int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`file` varchar(256) COLLATE utf8_unicode_ci
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `name_position` (`id`,`type`,`file`) VALUES
	(1,'ポケット上中央','pocket_ue.jpg'),
	(2,'左ポケット上ボディ中央','pocket_ue_hidari.jpg'),
	(3,'左ポケット下ボディ中央','pocket_under.jpg'),
	(4,'ポケット真ん中','pocket_center.jpg'),
	(5,'カフス斜め','cuffs_naname.jpg'),
	(6,'カフス中央','cuffs_center.jpg'),
	(7,'左袖',''),
	(8,'ボディ直接','');





CREATE TABLE `button_design` (
	`id` int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
	`price` int(11) NOT NULL,
	`file` varchar(256) COLLATE utf8_unicode_ci NOT NULL
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `button_design` (`id`,`type`,`price`,`file`) VALUES
	(1,'プラスチック　ホワイト　２つ穴ボタン',0,'PRS.jpg'),
	(2,'プラスチック　ホワイト　４つ穴ボタン(２㎜厚)',0,'P2S.jpg'),
	(3,'プラスチック　ホワイト　４つ穴ボタン(２．５㎜厚)',0,'P3S.jpg'),
	(4,'プラスチック　ブラック　４つ穴ボタン',0,'P2SBLACK.jpg'),
	(5,'プラスチック　ブラウン　４つ穴ボタン',0,'P2SbrOWN.jpg'),
	(6,'白蝶貝４つ穴２㎜厚',1000,'W2S.jpg'),
	(7,'白蝶貝４つ穴３㎜厚',1300,'W3S.jpg'),
	(8,'白蝶貝４つ穴４㎜厚',1500,'W4S.jpg'),
	(9,'四角の白蝶貝４つ穴４㎜厚',2000,'SS.jpg'),
	(10,'黒蝶貝４つ穴２㎜厚',1000,'B2S.jpg'),
	(11,'黒蝶貝４つ穴３㎜厚',1300,'B3S.jpg'),
	(12,'茶蝶貝４つ穴２㎜厚',1000,'br2S.jpg'),
	(13,'下半分アクアブルー２．５㎜厚',800,'upgreen.jpg'),
	(14,'下半分ブルー２．５㎜厚',800,'upblue.jpg'),
	(15,'下半分グレー２．５㎜厚',800,'upgrey.jpg'),
	(16,'下半分オレンジ２．５㎜厚',800,'uporange.jpg'),
	(17,'下半分レッド２．５㎜厚',800,'upred.jpg'),
	(18,'ネイビープラボタン２．５㎜厚',500,'pb2.jpg'),
	(19,'ブループラボタン２．５㎜厚',500,'ps2.jpg'),
	(20,'ピンクプラボタン２．５㎜厚',500,'pp2.jpg'),
	(21,'ワインプラボタン２．５㎜厚',500,'pw2.jpg'),
	(22,'グレープラボタン２．５㎜厚',500,'pg2.jpg');





CREATE TABLE `button_thread` (
	`id`  int(11) PRIMARY KEY NOT NULL,
	`type` varchar(256) COLLATE utf8_unicode_ci
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `button_thread` (`id`,`type`) VALUES
	(0,'白'),
	(1,'ブラック'),
	(2,'ネイビー'),
	(3,'サックスブルー'),
	(4,'シルバー'),
	(5,'シルバーグレー'),
	(6,'グレー'),
	(7,'ライトブラウン'),
	(8,'ブラウン'),
	(9,'ダークブラウン'),
	(10,'レッド'),
	(11,'ワイン'),
	(12,'オレンジ'),
	(13,'イエロー'),
	(14,'エメラルドグリーン'),
	(15,'グリーン'),
	(16,'ピンク'),
	(17,'パープル'),
	(18,'ホワイト');




CREATE TABLE `buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `total_num` int(11) DEFAULT NULL,
  `silhouetteType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collarType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collarRequest` text COLLATE utf8_unicode_ci,
  `cuffsDesign` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuffsButtonType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuffsWatchType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuffsRequest` text COLLATE utf8_unicode_ci,
  `pocketDesign_id` int(11) DEFAULT NULL,
  `pocketRequest` text COLLATE utf8_unicode_ci,
  `nameMessage` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nameDesign_id` int(11) DEFAULT NULL,
  `nameSpelling` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nameColor1_id` int(11) DEFAULT NULL,
  `nameColor2_id` int(11) DEFAULT NULL,
  `namePosition` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buttonDesign_id` int(11) DEFAULT NULL,
  `buttonThread1` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buttonThread2` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherRequest` text COLLATE utf8_unicode_ci,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




CREATE TABLE `buy_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_num` int(11) NOT NULL,
  `personal_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
