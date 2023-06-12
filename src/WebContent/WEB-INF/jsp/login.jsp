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
    <div class = "login-wrap">
    <div class = "login-html">

        <button type = "button">ログイン</button>
		<input type="button" onclick="location.href='/miffy/User_RegisterServlet'" value="新規登録">
        <div class = "login-form">
            <div class = "sign-in-html">

                <div class = "group">
                    <label for = "user" class = "label">メールアドレス</label><br>
                    <input id = "user" type = "text" class = "input">
                </div>

                <div class = "group">
                    <label for = "pass" class = "label">パスワード</label><br>
                    <input id = "pass" type = "password" class = "input">
                </div>

                <table><tr><td>
                    <div class = "group">
                    <input type = "submit" class = "button" value = "ログイン">
                    <button type = "button">リセット</button>
                </div></td></tr></table>

                <hr>

                <div class = "hr"></div>

                <div class  = "foot-link">
                    <a href = secret.jsp>パスワードを忘れた方はこちら</a>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>