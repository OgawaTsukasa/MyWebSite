<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<nav class="gmenu">
	<ul id="menu">
		<% boolean isLogin = session.getAttribute("isLogin")!=null?(boolean) session.getAttribute("isLogin"):false; %>

		<li><a href="Index">HOME</a></li>
		<li><a href="ItemList">シャツ一覧</a></li>
		<li><a href="CartServlet">カートを見る</a></li>

		<% if(isLogin){ %>
			<li><a href="UserData">お客様情報</a></li>
		<% }else{ %>
			<li><a href="Regist">会員登録</a></li>
		<% } %>

		<% if(isLogin){ %>
			<li><a href="Logout">ログアウト</a></li>
		<% }else{ %>
			<li><a href="Login">ログイン</a></li>
		<% } %>
	</ul>
</nav>
