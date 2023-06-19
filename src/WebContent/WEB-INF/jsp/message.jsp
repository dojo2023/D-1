<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メッセージ</title>
</head>
<body>
<p>${message}</p>
<script>
	//2秒後にリダイレクトする処理
	setTimeout(function() {
		location.href = "/mippy/CalendarServlet";
	}, 2000);
</script>
</body>
</html>