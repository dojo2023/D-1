<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>mippy</title>

    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "/mippy/css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "/mippy/css/log.css">
    </head>
    <body>

        <header>
            <div id = "head">
                <a id = "logo" href = "/mippy/CalendarServlet">
                    <img class = "img" src = "img/logo.png" alt = "ロゴ">
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
            <h1>食事ログ</h1>

            <div id = "list_show">
                <!-- 記録した食事のリスト -->
                <div id = "food_list">
                        <ul id = "log_list_1">
                            <li id = "list_1">
                                ＜朝＞${list.getBreakfast()}kcal<br>
								<c:forEach var = "a" items = "${breakfast}">
									<p><span>${a.foods_name}</span><span>${a.foods_cal} kcal</span></p>
								</c:forEach>
                            </li>
                        </ul>
                        <ul id = "log_list_2">
                            <li id = "list_2">
                                ＜昼＞${list.getLunch()}kcal<br>
								<c:forEach var = "a" items = "${lunch}">
									<p><span>${a.foods_name}</span><span>${a.foods_cal} kcal</span></p>
								</c:forEach>
                            </li>
                        </ul>
                        <ul id = "log_list_3">
                            <li id = "list_3">
                                ＜夜＞${list.getDinner()}kcal<br>
								<c:forEach var = "a" items = "${dinner}">
									<p><span>${a.foods_name}</span><span>${a.foods_cal} kcal</span></p>
								</c:forEach>
                            </li>
                        </ul>
                        <ul id = "log_list_4">
                            <li id = "list_4">
                                ＜その他＞${list.getDessert()}kcal<br>
								<c:forEach var = "a" items = "${dessert}">
									<p><span>${a.foods_name}</span><span>${a.foods_cal} kcal</span></p>
								</c:forEach>
                            </li>
                        </ul>
                </div>
            </div>

            <!-- 食事を記録するフォーム -->
            <div id = "record_form">
                <form action = "Log_Servlet" method = "POST" id = "form">
                    <div class = "record_input">
                        <p class = "item">日付</p>
                        <input type = "date" name = "record_category_date" id = "record_category_date" value ="${day}" required>
                    </div>

                    <div class = "record_input">
                        <p class = "item">朝昼夜その他</p>
                        <select name = "record_category_time" id = "record_category_time" value = "時間" required>
                            <option value = "" selected hidden>選択</option>
                            <option value = "1">朝</option>
                            <option value = "2">昼</option>
                            <option value = "3">夜</option>
                            <option value = "4">その他</option>
                        </select>

                    </div>

                    <div class = "record_input">
                        <p class = "item">カテゴリー</p>
                        <select name = "record_category" id = "record_category" value = "選択" required>
                            <option value = "" selected hidden>カテゴリーを選択</option>
                            <!-- サーブレットからリストを受け取る -->
							<c:forEach var = "e" items = "${f_category}">
								<option value = "${e.foods_category}">${e.foods_category}</option>
							</c:forEach>
                        </select>
                    </div>

                    <div class = "record_input">
                        <p class = "item">品目</p>
                        <input type = "text" name = "record_item" id = "record_item" placeholder = "品目" required>
                    </div><br>

                    <div class = "foot-link">
                        <a href = /mippy/Food_registerServlet>該当がなければこちら</a>
                    </div><br>

                    <input type = "submit" value = "登録" name = "record_submit" id = "button" disabled>
                </form>


            </div>




        </main>

        <!-- 共通js -->
        <script src = "/mippy/js/common.js"></script>
        <!-- ページjs -->
        <script src = "/mippy/js/log.js"></script>
    </body>
</html>

