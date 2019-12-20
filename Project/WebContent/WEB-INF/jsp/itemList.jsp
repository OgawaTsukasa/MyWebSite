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
		<link rel="stylesheet" href="./css/common.css" media="all">
		<link rel="stylesheet" href="./css/sub.css" media="all">
		<link rel="stylesheet" href="./css/layout.css" media="all">
	</head>

	<body>

		<header>
			<!--head-->
			<figure>
				<img src="./img/PageTop/RoyalCaribbeanCotton3.jpg" width="750px" height="420px">
			</figure>

		</header>

		<jsp:include page="/baselayout/header.jsp"/>

		<div class="contents wrap">
			<div class="clearfix">
				<article class="newkiji">
					<h2 align="center">${name}生地一覧</h2>
					<aside>
						<div>
							<c:forEach var="item" items="${itemList}" varStatus="status">
								<dl>
									<dt>
										<a href="DetailServlet?id=${item.id}">
											<figure>
												<img src="./img/cloth/${item.fileName1}" alt="">
											</figure>
										</a>
									</dt>
									<dd>
										<h3>
											<p>
												No.${item.id}<br>・${item.brandDataBeans.cName}<br>・${item.brandDataBeans.bName}<br>・${item.material}
											</p>
										</h3>
										<p>${item.cloth}</p>
									</dd>
									<dd>
										<h1>【お仕立てあがり￥${item.price}＋税】</h1>
									</dd>
								</dl>
							</c:forEach>
						</div>
					</aside>
				</article>
				<div>
					<nav class="page clearfix">
						<!-- １ページ戻るボタン  -->
						<c:choose>
							<c:when test="${pageNum == 1}">
							</c:when>
							<c:otherwise>
								<a href="${url}?id=${word}&name=${name}&page_num=${pageNum - 1}" class="btn">
								<img src="img/icon_prev.jpg">prev</a>
							</c:otherwise>
						</c:choose>

						<!-- ページインデックス -->
						<ol>
							<c:forEach begin="${(pageNum - 3) > 0 ? pageNum - 3 : 1}" end="${(pageNum + 3) > pageMax ? pageMax : pageNum + 3}" step="1" varStatus="status">
							<li <c:if test="${pageNum == status.index }"> class="nav_on" </c:if>>
								<a href="${url}?id=${word}&name=${name}&page_num=${status.index}">${status.index}</a>
							</li>
							</c:forEach>
						</ol>

						<!-- １ページ送るボタン  -->
						<c:choose>
							<c:when test="${pageNum == pageMax || pageMax == 0}">
							</c:when>
							<c:otherwise>
								<a href="${url}?id=${word}&name=${name}&page_num=${pageNum + 1}" class="btn">
								next<img src="./img/icon_next.jpg"></a>
							</c:otherwise>
						</c:choose>
					</nav>
				</div>
			</div>
		</div>
		<p class="gotop wrap">
			<a onclick="window.history.back()">戻る</a>
		</p>
	</body>
</html>