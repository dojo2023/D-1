<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mippy</title>

    <!-- 共通css -->
	<link rel="stylesheet" type="text/css" href="css/common.css">
    <!-- top用css -->
    <link rel="stylesheet" type="text/css" href="css/top.css">
</head>
<body>
	<header>
		<div id="head">
			<a id="logo" href="/servlet/TopServlet"><img class="img" src="img/logo.png" alt="ロゴ"></a>
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
				<input name="signup" type="button" onclick="location.href='/mippy/User_RegisterServlet'" value="新規登録">
				<input name="signin" type="button" onclick="location.href='/mippy/LoginServlet'" value="ログイン">
			</div>
		</main>
	</form>
</body>
    <!-- 共通js -->
    <script src="js/common.js"></script>
    <!-- top用js -->
    <script src="js/top.js"></script>
</html>