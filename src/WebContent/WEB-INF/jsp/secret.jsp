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
        </header>
        <main>
            <div class="center">
            <form method="POST" action="/WebContent/SecretServlet">
                <h1>本人確認</h1>
                    <input placeholder="mailaddress" type="text" name="MAIL"/><br>
                    <select name="secret">
                        <option value="food">好きな食べ物は？</option>
                        <option value="pet">ペットの名前は？</option>
                        <option value="school">小学校の名前は？</option>
                        <option value="name">母親の旧姓は？</option>
                        <option value="date">一番最初にデートした場所は？</option>
                        <option value="love">初恋の相手の名前は？</option>
                        <option value="sushi">好きなお寿司のネタは？</option>
                        <option value="chara">好きなキャラクターは？</option>
                     </select>
                     <input placeholder="answer" type="text" name="ANSER"><br>
            <button id="c" onclick = "popup()">送信</button>
            </form>
            </div>

            <div class="popup">
                <div class="close_btn">&times;
                </div>
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
		</div>
        </main>
​
    <!-- 共通js -->
<script >
    document.querySelector("btn").
    addEventListener("click",function(){
        document.
        querySelector(".popup").classList.add("active");
    });
    document.querySelector("popup. close_btn").
    addEventListener("click",function(){
        document.querySelector(".popup").classList.add("active");
    });

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
        }
</script>
</body>
</html>