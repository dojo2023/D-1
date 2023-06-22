<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<main>
		<div class="profile"><br>
				<div id="date">
				</div><br>
				<form method="POST" action="/mippy/ProfileServlet">
				<c:forEach var="e" items="${cardList }">
				<div class ="te">ニックネーム</div>

					<input type="text" name="USER_NICKNAME" class="input" value="${e.user_nickname}" required>
					<br>

				<div class ="te">身長</div>
				<div class="same">
					<input type="text" name="USER_HEIGHT" class="input" value="${e.user_height}" required>cm<br>
				</div>
				<div class ="te">体重</div>
				<div class="same">
					<input type="text" name="USER_WEIGHT" class="input" value="${e.user_weight}" required>kg<br>
				</div>
				<div class ="te">性別</div>
				<div class="sei">
					<div class="same">
					<select name="USER_GENDER" class="input">
						<option value="" disabled selected>性別を選択してください</option>
						<option value="1" ${e.user_gender == 1 ? 'selected' : ''}>男性</option>
						<option value="2" ${e.user_gender == 2 ? 'selected' : ''}>女性</option>
						<option value="3" ${e.user_gender == 3 ? 'selected' : ''}>その他</option>
					</select>
					<br>
					</div>
				</div>
				<div class ="te">生年月日</div>
				<div class="same">
					<input type="date" name="USER_BIRTH" class="input"value="${e.user_birth}" >
					<br>
				</div>
				<div class ="te">目標体重</div>
				<div class="same">
					<input type="text" name="USER_GOALW" class="input" value="${e.user_goalw}" required>kg<br>
				</div>
				<div class ="te">期限</div>
				<div class="same">
					<input type="date" name="USER_LIMIT" class="input" value="${e.user_limit}">まで！<br>
				</div>
				<div class ="te">アバター</div>
				<div class="sei">
					<div class="same">
					<select id="avatar-select" name="USER_AVATAR" class="input" onchange="showAvatarImage()">
						<option value="1" ${e.user_avatar == 1 ? 'selected' : ''}>アバター1</option>
						<option value="2" ${e.user_avatar == 2 ? 'selected' : ''}>アバター2</option>
						<option value="3" ${e.user_avatar == 3 ? 'selected' : ''}>アバター3</option>
						<option value="4" ${e.user_avatar == 4 ? 'selected' : ''}>アバター4</option>
						<option value="5" ${e.user_avatar == 5 ? 'selected' : ''}>アバター5</option>
						<option value="6" ${e.user_avatar == 6 ? 'selected' : ''}>アバター6</option>
						<option value="7" ${e.user_avatar == 7 ? 'selected' : ''}>アバター7</option>
						<option value="8" ${e.user_avatar == 8 ? 'selected' : ''}>アバター8</option>
						<option value="9" ${e.user_avatar == 9 ? 'selected' : ''}>アバター9</option>
						<option value="10" ${e.user_avatar == 10 ? 'selected' : ''}>アバター10</option>
					</select><br>
					</div>
				</div>
				<div id="avatar-message">
				</div>



				<br><br>
				<div class="avatar-container">
				<img id="avatar-image-1" class="avatar-image" src="img/mippy_1.gif">
  				<img id="avatar-image-2" class="avatar-image" src="img/mippy_2.gif">
  				<img id="avatar-image-3" class="avatar-image" src="img/mippy_3.gif">
  				<img id="avatar-image-4" class="avatar-image" src="img/mippy_4.gif">
  				<img id="avatar-image-5" class="avatar-image" src="img/mippy_5.gif">
  				<img id="avatar-image-6" class="avatar-image" src="img/mippy_6.gif">
  				<img id="avatar-image-7" class="avatar-image" src="img/mippy_7.gif">
  				<img id="avatar-image-8" class="avatar-image" src="img/mippy_8.gif">
  				<img id="avatar-image-9" class="avatar-image" src="img/mippy_9.gif">
  				<img id="avatar-image-10" class="avatar-image" src="img/mippy_10.gif">
				</div>
				</c:forEach>

				<div class="button-container">
				<input type="submit" class="button" name="update" value="更新">
				<input type="button" class="button" onclick="window.location.href='/mippy/InformationServlet';" value="個人情報変更">
				</div>
				 <!-- 背景色 --><br>
					 <select id="color-select" name="USER_COLOR" onchange="changeBackgroundColor()" hidden >
						<option value="1" ${e.user_color == 1 ? 'selected' : ''} >桃色</option>
						<option value="2" ${e.user_color == 2 ? 'selected' : ''} >若草色</option>
						<option value="3" ${e.user_color == 3 ? 'selected' : ''} >藤紫色</option>
					</select><br>
			</form>

	</main>
</body>
<!-- 共通js -->
<script src="js/common.js"></script>
<!-- ページjs -->
<script src="js/profile.js"></script>
</html>