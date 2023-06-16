<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel = "stylesheet" href = "css/secret.css">
    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/information.css">
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
	<meta charset="UTF-8">
	<title>個人情報変更</title>
	</header>
	<body>
	<form name="InfomationServlet" method="POST" action="" id="info">
                        <div class = "info-form">

                                <div class = "big-group">
                                <h1>個人情報変更</h1>
                                    <div class = "group">
                                    <label  class = "label">メールアドレス</label><br>
                                        <input id = "u_addr" type = "text" class = "input" name = "u_addr"placeholder="新規メールアドレスを入力">
                                    </div>
                                    <input type = "button" class = "addr_update" value="更新" onclick="check()" >
                                    <input type = "reset" class = "reset" value="クリア"><br><br>

                                    <div class = "group">
                                    <label class = "label">新規パスワード</label><br>
                                        <input id = "u_pw" type = "password" class = "input" name = "new_pw"placeholder="新しいパスワードを入力">
                                    </div>
                                    <div class = "group">
                                    <label class = "label">確認</label><br>
                                        <input id = "u_pw" type = "password" class = "input" name = "co_pw"placeholder="もう一度パスワードを入力">
                                    </div>
                                </div>

                                <div class ="info2">
                                    <input type = "submit" class = "addr_update" value="更新" onclick="return check()" >
                                    <input type = "reset" class = "reset" value="クリア"><br><br>

                                </div>
                                <span id="output"></span><br>
                            </div>

                    </form>
	<script src = "/mippy/js/common.js"></script>
</body>
</html>