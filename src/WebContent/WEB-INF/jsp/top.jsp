<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mippy</title>
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
			</div>
		</div>
	</header>​
	<form name="Top" method="POST" action="/mippy/Top">
		<main>
			<p>Eat well, live well.</p>
			<div class="slide">
				<img src="img/1.png" alt="calendar" class="active">
				<img src="img/2.png" alt="profile">
				<img src="img/3.png" alt="graph">
			</div>
			<p class="exp">説明文</p>
			<div class="sign">
				<input name="signup" type="button" onclick="window.location.href='/mippy/User_Register';" value="新規登録">
				<input name="signin" type="submit" onclick="window.location.href='/mippy/LoginServlet';" value="ログイン">
			</div>
		</main>
	</form>
</body>
</html>