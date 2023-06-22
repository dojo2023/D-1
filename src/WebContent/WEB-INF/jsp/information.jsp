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
                <a id = "logo" href = "CarendarServlet">
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

	    <title>個人情報変更</title>
        <form name="" method="POST" action="InformationServlet" class="info">
            <div class = "group1">
            <h2>メールアドレス変更</h2>
                <input ,class = "u_addr" type = "text" name = "u_addr" placeholder="新規メールアドレス"required/>
                <div class = button1>
                    <input type = "submit" id = "koushin" value="更新" name = "AddrButton" onclick="koushin1()" ><br>
                    <input type = "button" id = "clear" value="クリア" onclick="clearInput()">
                </div>
            </div>
        </form>

        <form  method="POST" action="InformationServlet" class="info2">
            <div class = "group2">
            <h2>パスワード変更</h2>
                <input type="password" class = "new_pw" name = "new_pw" placeholder=新規パスワード required/>
                <input type="password" iclass = "co_pw" placeholder=パスワードをもう一度入力してください  required/>
                <div class = button2>
                    <input type = "submit" id = "addr_update" value="更新" name = "PwButton"  onclick="return check();">
                    <input type = "button" id = "reset" value="クリア"onclick="clearInput2()">
                </div>
            </div>

            <span id="output"></span>

        </form>
        <script src = "/mippy/js/common.js"></script>
	    <script src = "/mippy/js/information.js"></script>
    </body>
</html>
