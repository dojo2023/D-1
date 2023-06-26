<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
    <head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>mippy</title>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "/mippy/css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "/mippy/css/login.css">
    </head>
    <body>
        <header>
            <div id = "head">
				<a id = "logo" href = "/mippy/CalendarServlet">
				<img class = "img" src = "img/mippy_logo.png" alt = "ロゴ">
				</a>
            </div>
        </header>
        <main>
            <div class = "login-wrap">
                <div class = "login-html">
                    <div class ="big-button1">
                        <button type = "button" class = "button1">ログイン</button>
                        <input type="button" class = "button1" onclick="location.href='/mippy/User_RegisterServlet'" value="新規登録">
                    </div>

                    <form name="LoginServlet" method="POST" action="/mippy/LoginServlet" id="login">
                        <div class = "login-form">
                            <div class = "sign-in-html">
                                <div class = "big-group">
                                    <div class = "group">
                                        <input id = "user_addr" type = "text" class = "input" name = "user_addr" placeholder= "メールアドレス">
                                    </div>
                                    <div class = "group">
                                        <input id = "user_pw" type = "password" class = "input" name = "user_pw" placeholder= "パスワード">
                                    </div>
                                </div>
                                <div class ="big-button2">
                                    <input type = "submit" class = "button2" value="ログイン" onclick = "return check();">
                                    <input type = "reset" class = "button2"><br><br>
                                </div>
                                <span id="output"></span><br>
                            </div>
                        </div>
                    </form>

                    <div class  = "foot-link">
                        <a href = /mippy/SecretServlet>パスワードを忘れた方はこちら</a>
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