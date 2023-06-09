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
	<link rel="stylesheet" type="text/css" href="css/common.css">
    <!-- top用css -->
    <link rel="stylesheet" type="text/css" href="css/top.css">

    <!-- 共通js -->
    <script src="/mippy/js/common.js"></script>
    <!-- top用js -->
    <script src="js/top.js"></script>

</head>
<body>
    <form name="Top" method="POST" action="/mippy/Top">
        <div class="wrapper">
            <header>
                <img id="avatar_top" src="img/mippy2号.gif" alt="avatar">
            </header>
            <main>
                <img class="logo" src="img/logo.png" alt="mippy">
                <p>Eat well, live well.</p>
                <div class="slide">
                    <img src="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-1-7/img/img_01.jpg" alt="calendar" class="active">
                    <img src="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-1-7/img/img_02.jpg" alt="profile">
                    <img src="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/6-1-7/img/img_03.jpg" alt="graph">
                </div>
                <p class="exp">説明文</p>
                <div class="sign">
                    <input name="signup" type="button" onclick="window.location.href='/mippy/User_Register';" value="新規登録">
                    <input name="signin" type="submit" onclick="window.location.href='/mippy/Login';" value="ログイン">
                </div>
            </main>
        </div>
    </form>
</body>
</html>