<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>秘密の質問</title>

<link rel="stylesheet" href="css/secret.css">
<head>
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<!-- 共通css -->
<link rel="stylesheet" href="css/common.css">
<!-- ページcss -->
<link rel="stylesheet" href="css/secret.css">

</head>
<body>
	<header>
		<div id="head">
			<a id="logo" href="/mippy/TopServlet"> <img class="img"
				src="img/mippy_logo.png" alt="ロゴ">
			</a>
		</div>
	</header>
<body>
	<form name="SecretServlet" method="POST" action="PasswordServlet">
		<div class="form">
			<h1>本人確認</h1>
			<div class="group">
				<input id="u_addr" type="email" class="q_addr" name="user_addr"placeholder="メールアドレス" required>
			</div>
			<select name="USER_SECRET" class="input2">
				<option value="0" selected>秘密の質問</option>
				<option value="1">好きな食べ物は？</option>
				<option value="2">ペットの名前は？</option>
				<option value="3">小学校の名前は？</option>
				<option value="4">母親の旧姓は？</option>
				<option value="5">一番最初にデートした場所は？</option>
				<option value="6">初恋の相手の名前は？</option>
				<option value="7">好きなお寿司のネタは？</option>
				<option value="8">好きなキャラクターは？</option>
			</select><br>
			<input placeholder="秘密の質問答え" type="text" name="answer" class="s_answer" required><br>
				<input type="submit" class="q_submit" value="送信" name="secretsubmit"onclick="addrsecretcheck()" >
		</div>
	</form>
	​
	<!-- 共通js -->
	<script src="js/common.js"></script>
	<script src="js/secret.js"></script>
</body>
</html>