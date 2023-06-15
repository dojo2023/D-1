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

<body>
     <div class="mail">
		<h1>メールアドレス変更</h1>
			<div class = "form-element">
	     	<label for="mailaddress">新規メールアドレス</label><br>
	     	<input type="text" id="mailaddress" placeholder="新規メールアドレスを入力">
	     </div>
	     <table>
	     	<div class = "form-element">
	     		<tr>
				<tb><input type="submit" value="更新" /></tb>
				<tb><input type="button" value="クリア" onclick="clearText()" /></tb>
				</tr>
			</div>
		</table>
	 <div class="form">
	     	<h2>パスワード変更</h2>
	     <div class = "form-element">
	     	<label for="newpassword">新しいパスワード</label><br>
	     	<input type="text" id="newpassword" placeholder="新しいパスワードを入力">
	     </div>
	     <div class = "form-element">
	     	<label for="chpassword">確認</label><br>
	     	<input type="text" id="chpassword" placeholder="もう一度パスワードを入力">
	     </div>
	     <table>
	     	<div class = "form-element">
	     		<tr>
				<tb><button>更新</button></tb>
				<tb><button>クリア</button></tb>
				</tr>
			</div>
		</table>
	</div>
	<script >
	function clearText() {
    	var textForm = document.getElementById("newpassword");
      textForm.value = '';
    }

    function clearTextarea() {
    	var textareaForm = document.getElementById("chpassword");
      textareaForm.value = '';
    }
	const btn = document.getElementById('btn');

        function SheckPassword(password_confirmation) {
            var newpassword =password.value;
            var chpassword = password_comfirmation.value;
            formObj.onreset = function() {
                errorMessageObj.textContent = null;
            };
            if(newpassword != chpassword){
                password_confirmation.setCustomValidity("入力値が一致しません。");
            }else{
                password_confirmation.setCustomValidity('');
            }

	</script>
</body>
</html>