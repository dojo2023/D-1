<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" href = "css/secret.css">
    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/secret.css">
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
            <title>秘密の質問</title>
        </header>
       <body>
		<form name="SecretServlet" method="POST" action="" id="secret">

                            <div class = "form">

                               <div class = "form1">
                                <h1>本人確認</h1>
                                    <div class = "group">
                                    <input id = "u_addr" type = "text" class = "q_addr" name = "user_addr" placeholder="メールアドレス">
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
                     				<input placeholder="秘密の質問答え" type="text" name="answer"><br>
                                    <input type = "button" class = "q_submit" value="送信" name = "secretsubmit" onclick="addrsecretcheck()" >
								</div>

							<div class = "popup" id = "popup" >
								<h2>パスワード変更</h2>
                                    <div class = "group">

                                        <input id = "new_pw" type = "password" class = "input" name = "new_pw" placeholder="新規パスワード">
                                    </div>
                                    <div class = "group">

                                        <input id = "u_pw" type = "password" class = "input" name = "co_pw" placeholder="パスワードをもう一度入力">
                                    </div>

                                <div class ="info2">
                                    <input type = "submit" class = "button1" value="更新" name = "PwButton"  onclick="return check();">
                                    <input type = "button" class = "button2" value="クリア" onclick="clearInput2()">

                                </div>
                                <span id="output"></span><br>
                                </div>
                            </div>
		<div  class = "hidden">
    <input type="hidden" name="user1Secret" value="${userSecret}" />
    <input type="hidden" name="user1Answer" value="${userAnswer}" />
    <input type="hidden" name="user1addr" value="${useraddr}" />
		</div>
                    </form>
​
    <!-- 共通js -->
   <script src = "/mippy/js/common.js"></script>
   <script src = "/mippy/js/secret.js"></script>
</body>
</html>