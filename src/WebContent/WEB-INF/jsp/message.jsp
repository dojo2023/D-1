<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<meta charset="UTF-8">
<title>メッセージ</title>
</head>
<body>
<div>
<p>${message}</p>
</div>
<script>
	//2秒後にリダイレクトする処理
	setTimeout(function() {
		location.href = "/mippy/LoginServlet";
	}, 2000);
</script>
</body>
</html>