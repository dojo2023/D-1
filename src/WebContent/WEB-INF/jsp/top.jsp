<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="img/favicon.png" type="image/x-icon">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mippy</title>

    <!-- 共通css -->
	<link rel="stylesheet" type="text/css" href="css/common.css">
    <!-- top用css -->
    <link rel="stylesheet" type="text/css" href="css/top.css">
    <!-- <style>
   		body{
			background-image: url('img/4.jpg');
			background-size: cover;
			background-position: center;
		}
	</style> -->
</head>
<body>
	<header>
		<div id="head">
		<a id = "logo" href = "/mippy/CalendarServlet">
			<img class = "img" src = "img/mippy_logo.png" alt = "ロゴ">
		</a>
		</div>
	</header>​
	<form name="Top" method="POST" action="/mippy/Top">
		<main>
			<p>Eat well, live well.</p>
			<div class="slide">
				<img src="img/intro1.png" alt="calendar" class="active">
				<img src="img/intro2.png" alt="profile">
				<img src="img/intro3.png" alt="graph">
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