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
	<link rel="stylesheet" type="text/css" href="/mippy/css/common.css">
    <!-- login用css -->
    <link rel="stylesheet" type="text/css" href="/mippy/css/login.css">

    <!-- 共通js -->
    <script src="/mippy/js/common.js"></script>
    <!-- login用js -->
    <script src="/mippy/js/login.js"></script>

</head>
<body>

<header>
            <div id = "head">
                <a id = "logo" href = "カレンダーサーブレット">
                    <img class = "img" src = "logo.png" alt = "ロゴ">
                </a>
                <div id = "menu" onclick="menu()">
                    <ul id = "menu_bar">
                        <li class = "bar"></li>
                        <li class = "bar"></li>
                        <li class = "bar"></li>
                    </ul>
                </div>
                <div id = "box">
                    <ul id = "menu_text"></ul>
                </div>
            </div>
        </header>
<div class = "login-wrap">
	<div class = "login-html">
		<div class ="big-button1">
			<button type = "button" class = "button1">ログイン</button>
			<input type="button" class = "button1" onclick="location.href='/mippy/User_RegisterServlet'" value="新規登録">
		</div>

		<form name="LoginServlet" method="POST" action="" id="login">
			<div class = "login-form">
				<div class = "sign-in-html">

					<div class = "big-group">
						<div class = "group">
						<!--  <label  class = "label">メールアドレス</label><br>-->
							<input id = "user_addr" type = "text" class = "input" name = "user_addr">
						</div>

						<div class = "group">
						<!--  --><label class = "label">パスワード</label><br>
							<input id = "user_pw" type = "password" class = "input" name = "user_pw">
						</div>
					</div>

					<div class ="big-button2">
						<input type = "button" class = "button2" value="ログイン" onclick="check()">
						<input type = "reset" class = "button2">
					</div>
				</div>
			</div>
		</form>

		<div class  = "foot-link">
			<a href = secret.jsp>パスワードを忘れた方はこちら</a>
		</div>
	</div>
</div>
</body>
</html>