<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>mippy</title>

    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="img/favicon.png" type="image/x-icon">
       <title>個人情報変更</title>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/information.css">
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
        <form name="" method="POST" action="InformationServlet" class="info">
            <h2>メールアドレス変更</h2>
                <input class = "u_addr" type = "email" name = "u_addr" placeholder="新規メールアドレス"required/>
                   <input type="submit" class="button1" name="addr_update" value="更新">
                   <input type="reset" class="button1" name="reset" value="リセット">
        </form>

        <form  method="POST" action="InformationServlet" class="info2" onsubmit="return validateForm();">
            <h2>パスワード変更</h2>
                <input type="password" id = "new_pw" class = "new_pw" name="new_pw"  placeholder=新規パスワード required/>
                <input type="password" id = "co_pw" class = "co_pw"  placeholder=パスワードをもう一度入力してください  required/><br><br>
                <span id="errorText" style="color: red;"></span>
                   <div class ="butooon">
	                <input type="submit"  class="button2"name="pw_update"  value="更新">
					<input type="reset" class="button2" name="reset" value="リセット" id = "resetbutton">
				   </div>


        </form>
        <div class  = "foot-link">
           <a href ="/mippy/ProfileServlet">プロフィール画面に戻る</a>
        </div>
 </main>
        <script src = "/mippy/js/common.js"></script>
	    <script src = "/mippy/js/information.js"></script>
    </body>
</html>
