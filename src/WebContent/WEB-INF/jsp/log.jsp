<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "/mippy/css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "/mippoy/css/log.css">
    </head>
    <body>

        <header>
            <div id = "head">
                <a id = "logo" href = "カレンダーサーブレット">
                    <img class = "img" src = "logo.png" alt = "ロゴ">
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

            <!-- 記録した食事のリスト -->
            <div id = "food_list">
                    <ul id = "log_list_1">
                        <li class = "list_1">
                            ＜朝＞<br>
                            卵ご飯
                        </li>
                    </ul>
                    <ul id = "log_list_2">
                        <li class = "list_2">
                            ＜昼＞<br>
                            チーズリゾット
                        </li>
                    </ul>
                    <ul id = "log_list_3">
                        <li class = "list_3">
                            ＜夜＞<br>焼肉

                        </li>
                    </ul>
                    <ul id = "log_list_4">
                        <li class = "list_4">
                            ＜その他＞<br>
                            クロワッサン<br>
                            ベビーカステラ<br>
                            メロンパン<br>
                            フルーツタルト<br>
                            イチゴパフェ
                        </li>
                    </ul>
            </div>

            <!-- 食事を記録するフォーム -->
            <div id = "record_form">
                <form action = "FoodLogServlet" method = "POST">
                    <div class = "record_input">
                        <p>日付</p>
                        <input type = "date">
                    </div>

                    <div class = "record_input">
                        <p>朝昼夜その他</p>
                        <select name = "record_category_time" id = "record_category_time">
                            <option value = "selected hidden">選択</option>
                            <option value = "time1">朝</option>
                            <option value = "time2">昼</option>
                            <option value = "time3">夜</option>
                            <option value = "time4">その他</option>
                        </select>

                    </div>

                    <div class = "record_input">
                        <p>カテゴリー</p>
                        <select name = "record_category" id = "record_category">
                            <option value = "selected hidden">カテゴリーを選択</option>
                            <!-- サーブレットからリストを受け取る -->
                            <!-- <c:forEach >

                            </c:forEach> -->
                        </select>
                    </div>

                    <div class = "record_input">
                        <p>品目</p>

                    </div>

                    <div class = "foot-link">
                        <a href = food_register.jsp>該当がなければこちら</a>
                    </div>

                    <input type = "submit" value = "登録" name = "record_submit" id = "record_submit">
                </form>


            </div>




        </main>

        <!-- 共通js -->
        <script src = "js/common.js"></script>
        <!-- ページjs -->
        <script src = "js/"></script>
    </body>
</html>
