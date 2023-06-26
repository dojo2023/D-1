<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mippy</title>
<!-- 共通css -->
<link rel="stylesheet" href="css/common.css">
<!-- ページcss -->
<link rel="stylesheet" href="css/user_register.css">
</head>
<body>
	<header>
		<div id="head">
				<a id = "logo" href = "/mippy/CalendarServlet">
				<img class = "img" src = "img/mippy_logo.png" alt = "ロゴ">
				</a>
		</div>
	</header>
	<main>
		<div class="register-wrap">
			<div class="register-html">

				<div class="big-button1">
					<input name="signin" type="button" class="button1"
						onclick="window.location.href='/mippy/LoginServlet';" value="ログイン">
					<input name="signup" type="button" class="button1"
						onclick="window.location.href='/mippy/User_RegisterServlet';"
						value="新規登録">
				</div>


				<form method="POST" action="/mippy/User_RegisterServlet" onsubmit="return validateForm();">
					<div class="big-group">
						<input type="email" name="USER_ADDR" class="input" placeholder="メールアドレス"  required> <br>
						<input type="password" name="USER_PW" id="password" class="input" placeholder="パスワード" required> <br>
						<input type="password" id="confirmpassword" class="input" placeholder="パスワードをもう一度入力してください" required><br>
					</div>


					<select name="USER_SECRET" class="input2" required>
						<option value="" selected hidden>秘密の質問</option>
						<option value="1">好きな食べ物は？</option>
						<option value="2">ペットの名前は？</option>
						<option value="3">小学校の名前は？</option>
						<option value="4">母親の旧姓は？</option>
						<option value="5">一番最初にデートした場所は？</option>
						<option value="6">初恋の相手の名前は？</option>
						<option value="7">好きなお寿司のネタは？</option>
						<option value="8">好きなキャラクターは？</option>
					</select><br>

					<input type="text" name="USER_ANSWER" class="input"placeholder="秘密の質問の答え" required><br>
					<span id="errorText" style="color: red;"></span> <!-- エラーメッセージを表示する場所 -->

					<div class="big-button2">
						<input type="submit" class="button2" name="register" value="登録">
						<input type="reset" class="button2" name="reset" value="リセット">
					</div>
				</form>
			</div>
		</div>
	</main>
	<!-- 共通js -->
	<script src="js/common.js"></script>
	<!-- ページjs -->
	<script src="js/User_Register.js"></script>
</body>
</html>