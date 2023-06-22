<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/information.css">
    </head>

    <body>
	<header>
		<div id = "head">
		<a id = "logo" href = "/mippy/CalendarServlet">
		<img class = "img" src = "img/logo.png" alt = "ロゴ">
		</a>
			<div id = "menu" onclick="menu()">
				<ul id = "menu_bar">
				<li class = "bar"></li>
				<li class = "bar"></li>
				<li class = "bar"></li>
				</ul>
			</div>
			<div id = "box">
			</div>
		</div>
	</header>

	    <title>個人情報変更</title>
        <form name="" method="POST" action="InformationServlet" class="info">
            <h2>メールアドレス変更</h2>
                <input class = "u_addr" type = "text" name = "u_addr" placeholder="新規メールアドレス"required/>
                    <input type = "submit" class = "button1" value="更新" name = "AddrButton" onclick="koushin1()" >
                    <input type = "button" class = "button2" value="クリア" onclick="clearInput()">
        </form>

        <form  method="POST" action="InformationServlet" class="info2">
            <h2>パスワード変更</h2>
                <input type="password" class = "new_pw" name = "new_pw" placeholder=新規パスワード required/>
                <input type="password" class = "co_pw" placeholder=パスワードをもう一度入力してください  required/>
                    <input type = "submit" class = "button1" value="更新" name = "PwButton"  onclick="return check();">
                    <input type = "button" class = "button2" value="クリア" onclick="clearInput2()">


            <span id="output"></span>

        </form>
        <script src = "/mippy/js/common.js"></script>
	    <script src = "/mippy/js/information.js"></script>
    </body>
</html>
