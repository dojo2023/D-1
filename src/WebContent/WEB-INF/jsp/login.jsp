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
	<link rel="stylesheet" type="text/css" href="/miffy/css/common.css">
    <!-- login用css -->
    <link rel="stylesheet" type="text/css" href="/miffy/css/login.css">

    <!-- 共通js -->
    <script src="/miffy/js/common.js"></script>
    <!-- login用js -->
    <script src="/miffy/js/login.js"></script>

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
		<input type="button" class = "button1" onclick="location.href='/miffy/User_RegisterServlet'" value="新規登録">
	</div>

        <div class = "login-form">
            <div class = "sign-in-html">

			<div class = "big-group">
                <div class = "group">
                    <label for = "user" class = "label">メールアドレス</label><br>
                    <input id = "user" type = "text" class = "input">
                </div>

                <div class = "group">
                    <label for = "pass" class = "label">パスワード</label><br>
                    <input id = "pass" type = "password" class = "input">
                </div>
            </div>

			<div class ="big-button2">
					<input type="button" class = "button2" onclick="location.href='/miffy/CalendarServlet'" value="ログイン">
 					<button type = "button" class = "button2">リセット</button>
			</div>

                <div class  = "foot-link">
                    <a href = secret.jsp>パスワードを忘れた方はこちら</a>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>