<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
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
                                    <label  class = "label">メールアドレス</label><br>
                                    <input id = "u_addr" type = "text" class = "q_addr" name = "MAIL"placeholder="メールアドレスを入力">
                                    </div>
                                    <select name="question">
				                        <option value="food">好きな食べ物は？</option>
				                        <option value="pet">ペットの名前は？</option>
				                        <option value="school">小学校の名前は？</option>
				                        <option value="name">母親の旧姓は？</option>
				                        <option value="date">一番最初にデートした場所は？</option>
				                        <option value="love">初恋の相手の名前は？</option>
				                        <option value="sushi">好きなお寿司のネタは？</option>
				                        <option value="chara">好きなキャラクターは？</option>
                     				</select><br>
                     				<input placeholder="秘密の質問答え" type="text" name="answer"><br>
                                    <input type = "button" class = "q_submit" value="送信" onclick="check()" >
								</div>

							<div class = "popup">
								<h2>パスワード変更</h2>
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
                                    <input type = "button" class = "update" value="更新" onclick="check()" >
                                    <input type = "reset" class = "reset" value="クリア"><br><br>

                                </div>
                                <span id="output"></span><br>
                            </div>

                    </form>
​
    <!-- 共通js -->
   <script src = "/mippy/js/common.js"></script>
</body>
</html>