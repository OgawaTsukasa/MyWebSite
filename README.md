# サイトのトップページ
![a](https://github.com/OgawaTsukasa/WebSite/blob/master/2019-12-26%20(2).png)
# サイト内容
オーダーメイドシャツの購入サイト

# サイト内の機能
* ユーザー登録機能
* ログイン、ログアウト機能
* ユーザー情報編集機能
* 郵便番号による住所検索機能
* パスワードのハッシュ化機能
* 入力パスワードの可視化機能
* 購入履歴機能
* 商品一覧機能
* 商品検索機能
* 商品詳細機能
* ページネーション機能
* カート機能
* DBテーブルのリレーション機能

# 開発環境
* Eclipse(4.7.3a)
* OS：Windows10

# 使用言語
* Java(フレームワーク：無し)
* JavaScript(フレームワーク：jQuery)

# ミドルウェア
* Web：ApacheHTTP
* AP：Tomcat8.0
* DB：MySQL

# 必要なソフトウェア
* Eclipse　(http://mergedoc.osdn.jp/)
* MySQL (https://www-jp.mysql.com/)

# 使い方
 データベース側の作業
1. MySQLをインストールする必要があります。
2. インストールしたMySQLデータベースにGitHubのProjectディレクトリ内にあるSQL.sqlファイルのテーブル情報を全てコピーペーストで登録してください。

ファイルの場所  
　　↓
```
Project/
　┃─ WebContent/
　┃─ src/
　┃　
　┃─ .classpath
　：
  ┗【SQL.sql】←ここ
```

* Eclipse側の作業
1. 動的ファイルを作成してください。  
[ファイル]→[新規]→[動的 Web プロジェクト]→[任意のプロジェクト名]→[完了]
2. 作成したファイルにこのプロジェクトをインポートします。  
[ファイル上で右クリック]→[インポート]→[Git]→[Gitからプロジェクト]→[クローン URI]  
→[ロケーションのURIに(https://github.com/OgawaTsukasa/WebSite.git) ]→[完了]
3. データベース接続用のjavaファイルを開きます。  
javaファイルの場所  
　 　↓
```
Project（作成した動的ファイル）
　┃─ WebContent/
　┣ Javaリソース　━┓
　:    　　　　　　┣━━━━ src 
　├ WebContent    :      ┣━━━ bese
  └ SQl.sql              │      ┗━━━【DBManager.java】←ここ
                         ├─── beanse
                         │       ├ ...
                         :
```
4. ファイル内の変数[URL],[DB_NAME],[USER],[PASS]の""で囲われた個所を環境に応じて変更してください。  
変更個所  
   ↓
```
package base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
	final private static String URL = "jdbc:mysql://localhost/";　←ここ
	final private static String DB_NAME = "Made_to_order;　←ここ
	final private static String USER = "root";　←ここ
	final private static String PASS = "password";　←ここ

	/**
	* DBへ接続するコネクションを返す
	*/
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL + DB_NAME, USER, PASS);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
```

* あとはTomcatを始動させて、ウェブブラウザでURLを入力すればサイトを使えます。  
URL: (localhost:[ホスト番号]/[プロジェクト名]/Index)
