<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>名刺管理</title>
	<link rel="icon" href="/mippy/img/mippy1号.gif">

    <!-- 共通css -->
	<link rel="stylesheet" type="text/css" href="/mippy/css/common.css">
    <!-- top用css -->
    <link rel="stylesheet" type="text/css" href="/mippy/css/top.css">
    <!-- slickのcssを適用する（https://kenwheeler.github.io/slick/） -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">

    <!-- 共通js -->
    <script src="/mippy/js/common.js"></script>
    <!-- top用js -->
    <script src="/mippy/js/top.js"></script>
    <!-- slick用js -->
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<body>
    <div class="wrapper">
        <main>
            <form name="Top" method="POST" action="/mippy/Top">
                <img class="logo" src="/mippy/img/logo.png" alt="mippy">
                <h3>Eat well, live well.</h3>
                <img id="avatar_top" src="/mippy/img/mippy2号.png" alt="avatar">
                <ul class="slide">
                    <li><img src="" alt="calendar"></li>
                    <li><img src="" alt="profile"></li>
                    <li><img src="" alt="graph"></li>
                </ul>
                <p class="exp">説明文</p>
                <div class="sign">
                    <input name="signup" type="button" onclick="window.location.href='/mippy/User_Register';" value="新規登録">
                    <input type="submit" name="signin" onclick="window.location.href='/mippy/Login';" value="ログイン">
                </div>
            </form>
        </main>
    </div>
</body>
</html>