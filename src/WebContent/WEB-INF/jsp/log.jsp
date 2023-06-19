<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "/mippy/css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "/mippy/css/log.css">
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

            <div id = "list_show">
                <!-- 記録した食事のリスト -->
                <div id = "food_list">
                        <ul id = "log_list_1">
                            <li id = "list_1">
                                ＜朝＞<br>
                                卵ご飯
                            </li>
                        </ul>
                        <ul id = "log_list_2">
                            <li id = "list_2">
                                ＜昼＞<br>
                                チーズリゾット<br>
                                チーズ明太パスタ<br>
                                ガーリックトースト
                            </li>
                        </ul>
                        <ul id = "log_list_3">
                            <li id = "list_3">
                                ＜夜＞<br>
                                焼肉<br>
                                ラーメン<br>
                                炒飯<br>
                                餃子<br>
                                エビチリ<br>
                                天津飯<br>
                                ゴマ団子<br>
                                杏仁豆腐
                            </li>
                        </ul>
                        <ul id = "log_list_4">
                            <li id = "list_4">
                                ＜その他＞<br>
                                クロワッサン<br>
                                ベビーカステラ<br>
                                メロンパン<br>
                                フルーツタルト<br>
                                イチゴパフェ
                            </li>
                        </ul>
                </div>
            </div>

            <!-- 食事を記録するフォーム -->
            <div id = "record_form">
                <form action = "FoodLogServlet" method = "POST" id = "form">
                    <div class = "record_input">
                        <p class = "item">日付</p>
                        <input type = "date" name = "record_category_date" id = "record_category_date" value = "日付" required>
                    </div>

                    <div class = "record_input">
                        <p class = "item">朝昼夜その他</p>
                        <select name = "record_category_time" id = "record_category_time" value = "時間" required>
                            <option value = "" selected hidden>選択</option>
                            <option value = "time1">朝</option>
                            <option value = "time2">昼</option>
                            <option value = "time3">夜</option>
                            <option value = "time4">その他</option>
                        </select>

                    </div>

                    <div class = "record_input">
                        <p class = "item">カテゴリー</p>
                        <select name = "record_category" id = "record_category" value = "選択" required>
                            <option value = "" selected hidden>カテゴリーを選択</option>
                            <option value = "time2">昼</option>
                            <!-- サーブレットからリストを受け取る -->
                            <!-- <c:forEach >

                            </c:forEach> -->
                        </select>
                    </div>

                    <div class = "record_input">
                        <p class = "item">品目</p>
                        <input type = "text" name = "record_item" id = "record_item" placeholder = "品目" required>
                    </div><br>

                    <div class = "foot-link">
                        <a href = /mippy/Food_register>該当がなければこちら</a>
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

