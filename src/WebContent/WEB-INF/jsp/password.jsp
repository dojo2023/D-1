<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>mippy</title>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<!-- 共通css -->
<link rel="stylesheet" href="css/common.css">
<!-- ページcss -->
<link rel="stylesheet" href="css/password.css">
</head>

<body>
	<header>
		<div id="head">
			<a id="logo" href="/mippy/CalendarServlet"> <img class="img"
				src="img/mippy_logo.png" alt="ロゴ">
			</a>
		</div>
	</header>
	<main>
		<form action="LoginServlet" method="POST"
			onsubmit="return validateForm();">
			<div class="group">
				<div class="password">
					<h2>パスワード変更</h2>
					<input type="password" id="new_pw" class="new_pw" name="new_pw"
						placeholder="新規パスワード" required /><br> <input type="password"
						id="co_pw" class="co_pw" placeholder="パスワードをもう一度入力してください" required /><br>
				</div>
				<br> <span id="errorText" style="color: red;"></span><br>
				<div class="bigbutton">
					<input type="submit" class="button2" name="pw_update" value="更新"
						id="updateButton"> <input type="reset" class="button2"
						name="reset" value="リセット" id="resetButton">
				</div>
			</div>
		</form>

	</main>
	<script src="/mippy/js/common.js"></script>
	<script src="/mippy/js/password.js"></script>
</body>
</html>

