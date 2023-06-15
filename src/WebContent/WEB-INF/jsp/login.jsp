<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
    <title>mippy</title>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "/mippy/css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "/mippy/css/login.css">
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
        <main>

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
                                    <label  class = "label">メールアドレス</label><br>
                                        <input id = "user_addr" type = "text" class = "input" name = "user_addr">
                                    </div>

                                    <div class = "group">
                                    <label class = "label">パスワード</label><br>
                                        <input id = "user_pw" type = "password" class = "input" name = "user_pw">
                                    </div>
                                </div>

                                <div class ="big-button2">
                                    <input type = "button" class = "button2" value="ログイン" onclick="check()" >
                                    <input type = "reset" class = "button2"><br><br>

                                </div>
                                <span id="output"></span><br>
                            </div>
                        </div>
                    </form>

                    <div class  = "foot-link">
                        <a href = secret.jsp>パスワードを忘れた方はこちら</a>
                    </div>
                </div>
            </div>


        </main>

        <!-- 共通js -->
        <script src = "/mippy/js/common.js"></script>
        <!-- ページjs -->
        <script src = "/mippy/js/login.js"></script>
    </body>
</html>
