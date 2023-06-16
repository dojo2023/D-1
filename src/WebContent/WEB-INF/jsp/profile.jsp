<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール画面	</title>
	    <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/profile.css">
</head>
<body>
<header>
            <div id = "head">
                <a id = "logo" href = "カレンダーサーブレット">
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
                    <ul id = "menu_text"></ul>
                </div>
            </div>

    </header>
    <div id="date">
    </div>
    <main>
        <div class = "profile">
			<form method="POST" action="/mippy/Profile_Servlet" onsubmit="return validateForm();">
     			ニックネーム<br><input type="text" name="USER_NICKNAME"><br>
				身長<br><input type="text" name="USER_HEIGHT">cm<br>
	 			体重<br><input type="text" name="USER_WEIGHT">kg<br>
	 			性別<br>
	 			<select name="USER_GENDER">
	 				<option value="1">男性</option>
	 				<option value="2">女性</option>
	 			</select><br><br>

	 			<div class="form-select-wrap1">
   					 <select class="birthday-year">
    				</select>年
    		    	 <select class="birthday-month">
    				</select>月
   					<select class="birthday-day">
    				</select>日
				</div>
				<div class="goal">
					目標体重<br><input type="text" name="USER_GOALW">kg<br>
					期限
					<div class="form-select-wrap2">
   					 <select class="goal-year">
    				</select>年
    		    	 <select class="goal-month">
    				</select>月
   					<select class="goal-day">
    				</select>日
					</div>
				</div>
				<div class = "avatar">
				<img src="img/mippy_3.gif" alt="アバター表示"><br>
				</div>
				<div class = "button-group">
				 <input type="button" class="button1" onclick="buttonClicked()">
 				 <input type="button" class="button2" onclick="buttonClicked()">
  			     <input type="button" class="button3" onclick="buttonClicked()">
  			     <input type="button" class="button4" onclick="buttonClicked()">
	    		</div>
	    		<input type ="submit" class = "button5" name ="update" value="更新">
	    		<div class = "avatars">
	    		</div>
	    		 <input type="button" class = "button6" onclick="window.location.href='/mippy/InformationServlet';" value="個人情報変更">
			</form>
			</div>
    </main>
</body>
<!-- 共通js -->
        <script src = "js/common.js"></script>
        <!-- ページjs -->
        <script src = "js/profile.js"></script>
</html>