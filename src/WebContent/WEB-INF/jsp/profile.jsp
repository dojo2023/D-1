<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール設定画面</title>
<!-- 共通css -->
<link rel="stylesheet" href="css/common.css">
<!-- ページcss -->
<link rel="stylesheet" href="css/profile.css">
</head>
<body>
	<header>
		<div id="head">
			<a id="logo" href="カレンダーサーブレット"> <img class="img"
				src="img/logo.png" alt="ロゴ">
			</a>
			<div id="menu" onclick="menu()">
				<ul id="menu_bar">
					<li class="bar"></li>
					<li class="bar"></li>
					<li class="bar"></li>
				</ul>
			</div>

			<div id="box"></div>
		</div>

	</header>
	<div id="date"></div>
	<main>
		<div class="profile">
			<form method="POST" action="/mippy/ProfileServlet">
				ニックネーム<br>
				<input type="text" name="USER_NICKNAME" value="${nickname}"><br>
				身長<br>
				<input type="text" name="USER_HEIGHT" value="${height}">cm<br>
				体重<br>
				<input type="text" name="USER_WEIGHT" value="${weight}">kg<br>
				性別<br>
				<select name="USER_GENDER">
					<option value="" disabled selected>性別を選択してください</option>
					<option value="1" ${gender == 1 ? 'selected' : ''}>男性</option>
					<option value="2" ${gender == 2 ? 'selected' : ''}>女性</option>
					<option value="3" ${gender == 3 ? 'selected' : ''}>その他</option>
				</select><br> 生年月日<br>
				<input type="date" name="USER_BIRTH" value="${birth}"
					pattern="[0-9]{8}" placeholder="YYYYMMDD" maxlength="8"><br>
				目標体重<br>
				<input type="text" name="USER_GOALW" value="${goalw}">kg<br>
				期限<br>
				<input type="date" name="USER_LIMIT" value="${limit}"
					pattern="[0-9]{8}" placeholder="YYYYMMDD" maxlength="8">まで！<br>
		</div>
		アバター<br>
		<select name = "USER_AVATAR">
		<option value="1" ${avatar == 1 ? 'selected' : ''}>アバター1</option>
		<option value="2" ${avatar == 2 ? 'selected' : ''}>アバター2</option>
		<option value="3" ${avatar == 3 ? 'selected' : ''}>アバター3</option>
		</select><br>
		アバターカラー<br>
		<select name = "USER_COLOR">
		<option value="1" ${color == 1 ? 'selected' : ''}>カラー1</option>
		<option value="2" ${color == 2 ? 'selected' : ''}>カラー2</option>
		<option value="3" ${color == 3 ? 'selected' : ''}>カラー3</option>
		</select><br>

		<input type="submit" class="button" name="update" value="更新">
		<div class="avatars"></div>
		<input type="button" class="button"
			onclick="window.location.href='/mippy/InformationServlet';"
			value="個人情報変更">
		</form>
		</div>
	</main>
</body>
<!-- 共通js -->
<script src="js/common.js"></script>
<!-- ページjs -->
<script src="js/profile.js"></script>
</html>