<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="format-detection" content="telephone=no">
		<meta name="viewport"content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0" />


		<link rel="stylesheet" href="css/common.css" media="all">
		<link rel="stylesheet" href="css/layout.css" media="all">
		<link rel="stylesheet" href="css/materialize.css" media="all">

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>システムエラー</title>
	</head>

	<body>
		<div class="row center">
            <h2>
                <a href="Index">Made-To-Order</a>
            </h2>
        </div>

		<div class="container">
			<div class="row">
				<div class="section"></div>
				<div class="col s8 offset-s2">
					<div class="card grey lighten-5">
						<div class="card-content">
							<div class="row center">
								<h4 class="red-text">システムエラーが発生しました</h4>
								<h5 class="red-text">${errorMessarge}</h5>
							</div>
							<div class="row">
								<div class="conbtn">
									<a href="Index">
										<button class="btn" type="submit" >ホーム画面へ</button>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>