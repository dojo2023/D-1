<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>秘密の質問</title>
<link rel="stylesheet" href="/WebContent/css/secret.css">
</head>
<body>
<form method="POST" action="/WebContent/SecretServlet">
    <h1><a href="secret.html"><img src="/WebContent/img/logo.png" width="210" height="90" alt="mippy"></a></h1>
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
     <input placeholder="answer" type="text" name="ANSER"/>

    <script type="text/javascript">
        // サーブレットにリクエストを投げる
        function execute() {
            location.href = "/BlogApplication/secret"
        }
    </script>
    </head>
    <body>

        <input type="button" value="送信" onclick="execute()">
    </body>

    <script>
    btn.addEventListener('click', function() {
    var password = ('新しいパスワード');
    var pass = prompt('確認');
    formObj.onreset = function() {
  errorMessageObj.textContent = null;
  };
    if(password != pass){
        password_confirmation.setCustomValidity("入力値が一致しません。");
    }else{
        password_confirmation.setCustomValidity('');
    }
      });

    </script>
  </form>

  <footer>
    <h5> &copy; mippy.</h5>
  </footer>
</body>
</html>