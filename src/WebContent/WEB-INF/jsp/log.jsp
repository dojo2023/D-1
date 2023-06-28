<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>mippy</title>

    <head>
    	<link rel="icon" href="img/favicon.png" type="image/x-icon">
        <!-- 共通css -->
        <link rel = "stylesheet" href = "/mippy/css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "/mippy/css/log.css">
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
            <h1>食事ログ</h1>

            <div id = "list_show">
                <!-- 記録した食事のリスト -->
                <div id = "food_list">
                        <ul id = "log_list_1">
                            <li class = "list_1">
                                <span class = "left">＜朝＞</span><span class = "right">合計:${list.getBreakfast()}kcal</span>
							</li>
							<li class = "list_2">
								<c:forEach var = "a" items = "${breakfast}">
									<p><span class = "left">${a.foods_name}</span>
									   <span class = "right" id = "kal">${a.foods_cal} kcal</span></p>
								</c:forEach>
                            </li>
                        </ul>
                        <ul id = "log_list_2">
                            <li class = "list_1">
                                <span class = "left">＜昼＞</span><span class = "right">合計:${list.getLunch()}kcal</span>
							</li>
							<li class = "list_2">
								<c:forEach var = "a" items = "${lunch}">
									<p><span class = "left">${a.foods_name}</span><span class = "right" id = "kal">${a.foods_cal} kcal</span></p>
								</c:forEach>
                            </li>
                        </ul>
                        <ul id = "log_list_3">
                            <li class = "list_1">
                                <span>＜夜＞</span><span class = "right">合計:${list.getDinner()}kcal</span>
							</li>
							<li class = "list_2">
								<c:forEach var = "a" items = "${dinner}">
									<p><span class = "left">${a.foods_name}</span><span class = "right" id = "kal">${a.foods_cal} kcal</span></p>
								</c:forEach>
                            </li>
                        </ul>
                        <ul id = "log_list_4">
                            <li class = "list_1">
                                <span class = "left">＜その他＞</span><span class = "right">合計:${list.getDessert()}kcal</span>
							</li>
							<li class = "list_2">
								<c:forEach var = "a" items = "${dessert}">
									<p><span class = "left">${a.foods_name}</span><span class = "right" id = "kal" >${a.foods_cal} kcal</span></p>
								</c:forEach>
                            </li>
                        </ul>
                </div>
            </div>

            <!-- 食事を記録するフォーム -->
            <div id = "record_form">
                <form action = "" method = "POST" id = "form" >
                    <div class = "record_input">
                        <p class = "item">日付</p>
                        <input type = "date" name = "record_category_date" id = "record_category_date" value ="${day}" onchange = "func()" >
                    </div>

                    <div class = "record_input">
                        <p class = "item">朝昼夜その他</p>
                        <select name = "record_category_time" id = "record_category_time" value = "時間" >
                            <option value = "" selected hidden>選択</option>
                            <option value = "1">朝</option>
                            <option value = "2">昼</option>
                            <option value = "3">夜</option>
                            <option value = "4">その他</option>
                        </select>

                    </div>

                    <div class = "record_input">
                        <p class = "item">カテゴリー</p>
                        <select name = "record_category" id = "record_category" value = "選択" >
                            <option value = "" selected hidden>カテゴリーを選択</option>
                            <!-- サーブレットからリストを受け取る -->
							<c:forEach var = "e" items = "${f_category}">
								<option value = "${e.foods_category}">${e.foods_category}</option>
							</c:forEach>
                        </select>
                    </div>

                    <div class = "record_input">
                        <p class = "item">品目</p>
                        <input type = "text" name = "record_item" id = "record_item" placeholder = "品目"  oninput="keyDown()" required>
                    	<div id = "suje"></div>
                    </div><br>
	                <div class = "foot-link">
	                    <a href = /mippy/Food_registerServlet>該当がなければこちら</a>
	                </div>
					<div class = "touroku">
	                <input type = "button" value = "登録" name = "record_submit" id = "button" onclick = "check()">
	                </div>
	                <p id = "output"style="color: red;">${error}</p>
                </form>

            </div>
        </main>
        <!-- 共通js -->
        <script src = "/mippy/js/common.js"></script>
        <!-- ページjs -->
        <script src = "/mippy/js/log.js"></script>

        <script>

        let text ;
		let food ;
		let list = [];
		<c:forEach var = "e" items = "${f_name}">
			food = String('${e.foods_name}')
			list.push(food);
		</c:forEach>

        function keyDown(){

        	delete_item();

        	text = document.getElementById("record_item").value;
        	let suj = list.filter(n => !n.indexOf(text));
        	console.log(text);

        	if(suj.length > 0 && text != ""){
        		for(let i = 0; i < suj.length ; i++){
      				let li = '<p id = "' + (i+1) + '" class = "sj">'+ suj[i] + '</p> ';
      				document.getElementById("suje").insertAdjacentHTML("beforeend", li);
      				if(i >= 4){
      					break;
      				}
        		}
        	}

        	if(document.getElementById(1) != null){
        		document.getElementById(1).addEventListener('click',function(){
        			document.getElementById("record_item").value = document.getElementById(1).textContent;
        			delete_item()
        		});
        	}
        	if(document.getElementById(2) != null){
        		document.getElementById(2).addEventListener('click',function(){
        			document.getElementById("record_item").value = document.getElementById(2).textContent;
        			delete_item()
        		});
        	}
        	if(document.getElementById(3) != null){
        		document.getElementById(3).addEventListener('click',function(){
        			document.getElementById("record_item").value = document.getElementById(3).textContent;
        			delete_item()
        		});
        	}
        	if(document.getElementById(4) != null){
        		document.getElementById(4).addEventListener('click',function(){
        			document.getElementById("record_item").value = document.getElementById(4).textContent;
        			delete_item()
        		});
        	}
        	if(document.getElementById(5) != null){
        		document.getElementById(5).addEventListener('click',function(){
        			document.getElementById("record_item").value = document.getElementById(5).textContent;
        			delete_item()
        		});
        	}
        }

        function delete_item(){
        	if(document.getElementById(1) != null){
        		document.getElementById(1).remove();
        	}
        	if(document.getElementById(2) != null){
        		document.getElementById(2).remove();
        	}
        	if(document.getElementById(3) != null){
        		document.getElementById(3).remove();
        	}
        	if(document.getElementById(4) != null){
        		document.getElementById(4).remove();
        	}
        	if(document.getElementById(5) != null){
        		document.getElementById(5).remove();
        	}
        }
        </script>
    </body>
</html>

