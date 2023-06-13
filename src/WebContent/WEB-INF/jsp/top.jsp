<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>名刺管理</title>
	<link rel="icon" href="/mippy/img/mippy1号.gif">

    <!-- 共通css -->
	<link rel="stylesheet" type="text/css" href="css/common.css">
    <!-- top用css -->
    <link rel="stylesheet" type="text/css" href="css/top.css">

    <!-- 共通js -->
    <script src="js/common.js"></script>
    <!-- top用js -->
    <script src="js/top.js"></script>

</head>
<body>
	<header>
		<div id="head">
			<a id="logo" href="カレンダーサーブレット"><img class="img" src="img/logo.png" alt="ロゴ"></a>
			<div id="menu" onclick="menu()">
				<ul id="menu_bar">
					<li class="bar"></li>
					<li class="bar"></li>
					<li class="bar"></li>
				</ul>
			</div>
			<div id="box">
				<ul id="menu_text"></ul>
			</div>
		</div>
	</header>​
	<form name="Top" method="POST" action="/mippy/Top">
		<main>
			<div class="wrapper">
				<p>Eat well, live well.</p>
				<div class="slide">
					<img src="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-1-7/img/img_01.jpg" alt="calendar" class="active">
					<img src="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-1-7/img/img_02.jpg" alt="profile">
					<img src="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-1-7/img/img_03.jpg" alt="graph">
				</div>
				<p class="exp">説明文</p>
				<div class="sign">
					<input name="signup" type="button" onclick="window.location.href='/mippy/User_Register';" value="新規登録">
					<input name="signin" type="submit" onclick="window.location.href='/mippy/Login';" value="ログイン">
				</div>
			</div>
		</main>
	</form>
</body>
</html>