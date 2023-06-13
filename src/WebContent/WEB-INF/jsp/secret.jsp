<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mippy</title>
	<link rel="icon" href="/mippy/img/mippy1号.gif">

    <!-- 共通css -->
	<link rel="stylesheet" type="text/css" href="/miffy/css/common.css">
    <!-- login用css -->
    <link rel="stylesheet" type="text/css" href="/miffy/css/login.css">

    <!-- 共通js -->
    <script src="/miffy/js/common.js"></script>
    <!-- login用js -->
    <script src="/miffy/js/login.js"></script>

<link rel="stylesheet" href="/WebContent/css/secret.css">
</head>

<body>
<form method="POST" action="/WebContent/SecretServlet">
    <h1>秘密の質問</h1>
    <input placeholder="mailaddress" type="text" name="MAIL"/><br>
    <input placeholder="answer" type="text" name="ANSER">
    <input type="button" value="送信" onclick="execute()">
    -
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


    <button onclick="secret()">	更新</button>
    <button onclick="secret()">	クリア</button>
 </form>

  <footer>
    <h5> &copy; mippy.</h5>
  </footer>
</body>
</html>