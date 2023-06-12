<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>mippy</title>
</head>
<body>
	<div class = "User_Register-wrap">
    <div class = "User_Register-html">

    <div class="sign">
    				<input name="signin" type="button" onclick="window.location.href='/miffy/LoginServlet';" value="ログイン">
                    <input name="signup" type="button" onclick="window.location.href='/miffy/User_RegisterServlet';" value="新規登録">
    </div>

    <div class = "User_Register-form">
    <div class = "User_Register-html">

    <div class = "group">
         <label for = "user" class = "label">メールアドレス</label><br>
         <input id = "user" type = "text" class = "input">
    </div>

    <div class = "group">
          <label for = "pass" class = "label">パスワード</label><br>
          <input id = "pass" type = "password" class = "input">
    </div>
    <div class = "group">
           <label for = "pass" class = "label">パスワード ※確認のためもう一度入力してください</label><br>
           <input id = "pass" type = "password" class = "input">
    </div>

    <div class = "group">
           <label for = "pass" class = "label">秘密の質問</label><br>
           <select name="options">
            <option value="option1">秘密の質問1</option>
            <option value="option2">秘密の質問2</option>
            <option value="option3">秘密の質問3</option>
            </select>
     </div>
     <div class = "group">
                    <label for = "pass" class = "label">秘密の質問の答え</label><br>
                    <input id = "pass" type = "password" class = "input">
     </div>
     <table>
      <tr>
      <td>
       <div class = "group">
      <input type = "submit" class = "button" value = "登録">
      <button type = "button">リセット</button>
      </div>
      </td>
      </tr>
      </table>

      </div>
      </div>
    </div>
</div>

</body>
</html>