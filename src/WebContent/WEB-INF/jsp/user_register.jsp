<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>mippy</title>
	    <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/user_register.css">
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
        <!-- 共通js -->
        <script src = "js/common.js"></script>
        <!-- ページjs -->
        <script src = "js/User_Register.js"></script>

	<div class = "register-wrap">
    <div class = "register-html">

    <div class="big-button1">
    <input name="signin" type="button" class = "button1" onclick="window.location.href='/miffy/LoginServlet';" value="ログイン">
    <input name="signup" type="button" class = "button1" onclick="window.location.href='/miffy/User_RegisterServlet';" value="新規登録">
    </div>

	<div class = "big-group">
     <form method="POST" action="/miffy/User_RegisterServlet" onsubmit="return validateForm();">
     メールアドレス<br><input type="text" name="USER_ADDR"><br>
	 パスワード<br><input type="text" name="USER_PW"><br>
	 <label for = "pass" class = "label">パスワード <br>
	 <div class ="confirm">
	 ※確認のためもう一度入力してください</label><br>
	 </div>

     <input id = "pass" type = "password" class = "input"><br>
     秘密の質問<br>
     <select name="secret">
        <option value="food">好きな食べ物は？</option>
        <option value="pet">ペットの名前は？</option>
        <option value="school">小学校の名前は？</option>
        <option value="name">母親の旧姓は？</option>
        <option value="date">一番最初にデートした場所は？</option>
        <option value="love">初恋の相手の名前は？</option>
        <option value="sushi">好きなお寿司のネタは？</option>
        <option value="chara">好きなキャラクターは？</option>
     </select><br>
     秘密の質問の答え<br>
     <input type ="text" name ="USER_ANSWER"><br>
     </div>
	<input type ="submit" class = "button2" name ="register" value="登録">
	<input type="reset" class = "button2" name="reset" value="リセット">
	</form>
	</div>
	</div>
    </main>
</body>
</html>