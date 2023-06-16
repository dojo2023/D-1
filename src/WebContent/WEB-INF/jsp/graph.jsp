<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mippy</title>
	<link rel="icon" href="/mippy/img/mippy1号.gif">

    <!-- 共通css -->
	<link rel="stylesheet" type="text/css" href="css/common.css">
    <!-- top用css -->
    <link rel="stylesheet" type="text/css" href="css/graph.css">

</head>
<body>
    <header>
        <div id="head">
            <a id="logo" href="カレンダーサーブレット"><img class="img" src="img/logo.png" alt="ロゴ"></a>
            <div id="menu" onclick="menu()">
                <ul id="menu_bar">
                    <li class="bar"></li>
                    <li class="bar"></li>
                    <li class="bar"></li>
                </ul>
            </div>
            <div id="box">
                <ul id="menu_text"></ul>
            </div>
        </div>
    </header>
        <main>
       	<p>平均カロリー</p>
            <div class="graphArea">
                <canvas id="graph" width="1000" height="400"></canvas>
            </div>
            <div class="goal">
	            <c:forEach var="e" items="${userList}" >
	            	基礎代謝<br>
	            	BMR:
	            	<span id="result" data-bmr="result(${e.getUser_gender()}, ${e.getUser_weight()}, ${e.getUser_height()}, ${e.getUser_age()})"></span><br>
					目標体重<br>${e.user_weight} kg<br>
					目標まであと<br>${e.user_weight- e.user_goalw} kg<br>
				</c:forEach>
            </div>
        </main>

	<!-- 共通js -->
    <script src="js/common.js"></script>
    <!-- top用js -->
    <script src="js/graph.js"></script>
    <!-- guraph -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1"></script>
</body>
</html>