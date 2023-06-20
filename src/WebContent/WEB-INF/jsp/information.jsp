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
	<h1>個人情報変更</h1>
	<body>
	<form name="" method="POST" action="InformationServlet" id="info">
                                <h2>メールアドレス変更</h2>
                                <div class = "group1">

                                    <label  class = "u_addr">メールアドレス</label><br>
                                        <input id = "u_addr" type = "text" class = "input" name = "u_addr" placeholder="新規メールアドレスを入力"required/>
									<script>
									function clearInput(){
										document.getElementById('u_addr').value = '';
									}
									</script>
                                    <input type = "submit" class = "addr_update" value="更新" onclick="koushin1()" >
                                    <h3 id="heading_A"></h3>
                                    <input type = "button" class = "reset" value="クリア" onclick="clearInput()"><br><br>

									</div>
  </form>
  <form  method="POST" action="InformationServlet" id="info2">
                                    <div class = "group">
                                    <h2>パスワード変更</h2>
                                    <label for = "new_pw">新規パスワード</label><br>
                                    <input type="password" id = "new_pw" name = "new_pw" placeholder=新しいパスワードを入力 required/>
                                    </div>
                                    <label class = "co_pw">確認</label><br>
                                     <input type="password" id = "co_pw" placeholder=もう一度パスワードを入力  required/>


                                    <input type = "submit" class = "addr_update" value="更新"  onclick="return check();">
                                    <input type = "button" class = "reset" value="クリア"onclick="clearInput2()"><br><br>
									<p id="errorText"></p>
									<script>
									function clearInput2(){
										document.getElementById('new_pw').value = '';
										document.getElementById('co_pw').value = '';
									}
									</script>

                                <span id="output"></span><br>



 </form>
	<script src = "/mippy/js/common.js"></script>
	<script src = "/mippy/js/infomation.js"></script>
</body>
</html>