<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
 <link rel="icon" href="img/favicon.png" type="image/x-icon">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>mippy</title>

    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/food_register.css">
    </head>
    <body>
        <header>
            <div id = "head">
				<a id = "logo" href = "/mippy/CalendarServlet">
				<img class = "img" src = "img/mippy_logo.png" alt = "ロゴ">
                </a>
                <div id = "menu" onclick="menu()">
                    <ul id = "menu_bar">
                        <li class = "bar"></li>
                        <li class = "bar"></li>
                        <li class = "bar"></li>
                    </ul>
                </div>
                <div id = "box">
                </div>
            </div>
        </header>
		<main>
			<h1>品目登録</h1>
			<!-- 登録してある食事を検索して表示 -->
			<div id = "foods_show">
				<p1>検索</p1>
				<form action = "Food_registerServlet" method = "POST" id = "search_foods">
					<select name = "s_category" id = "s_category" class = "search_input">
						<option value = "" selected hidden>カテゴリー</option>
						<!-- サーブレットからリストを受け取る -->
						<c:forEach var = "e" items = "${f_category}">
							<option value = "${e.foods_category}">${e.foods_category}</option>
						</c:forEach>
					</select>
					<input type = "text" name = "s_name" id = "s_name" class = "search_input">
					<input type = "submit" name = "s_submit" id = "s_submit" class = "search_input" value = "検索">

				</form>
				<ul id = "s_result">
						<c:if test="${empty search_list}">
							<p>一致するデータはありません</p>
						</c:if>
						<c:forEach var = "e" items = "${search_list}">
							<li class = "list">
								<span class = "left">${e.foods_name}</span><span class = "right">${e.foods_cal}kcal</span>
							</li>
						</c:forEach>
				</ul>
			</div>

			<!-- 食事を登録するフォーム -->
			<div id = "register_foods">
				<form action = "Food_registerServlet" method = "POST">
					<div class = "register_input">
						<p>カテゴリー</p>
						<select name = "a_category" id = "a_category" required>
							<option value = "" selected hidden>カテゴリーを選択</option>
							<!-- サーブレットからリストを受け取る -->
							<c:forEach var = "e" items = "${f_category}">
								<option value = "${e.foods_category}">${e.foods_category}</option>
							</c:forEach>
						</select>
					</div>

					<div class = "register_input">
						<p>品目名</p>
						<input type = "text" name = "a_name" id = "a_name" required>
					</div>

					<div class = "register_input">
						<p>カロリー</p>
						<input type = "number" step = "0.1" min ="0" name = "a_cal" id = "a_cal" required>
					</div>
					<input type = "submit" value = "登録" name = "a_submit" id = "a_submit">

				</form>
				<div class = "loog-link">
	                    <a href = /mippy/Log_Servlet>食事ログに戻る</a>
	                </div>
			</div>
		</main>

        <!-- 共通js -->
        <script src = "js/common.js"></script>
        <!-- ページjs -->
        <!-- <script src = "js/"></script>-->
    </body>
</html>
