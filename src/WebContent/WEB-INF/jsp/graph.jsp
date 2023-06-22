<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mippy</title>
	<link rel="icon" href="img/mippy1号.gif">

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

            </div>
        </div>
    </header>
        <main>
            <div class="graphArea">
       			<p>平均カロリー：  kcal</p>
       			<div class = "back">
       				<input type = "month" id = "cal" value = "" onchange="onInput()">
	            	<div id = "selecter">
	            		<div class = "before" id = "before" onclick = "beforeMonth()"></div>
	                    <div class = "after" id = "after" onclick = "afterMonth()"></div>
	        		</div>
	                <canvas id="graph" width="1000" height="400"></canvas>
       			</div>
            </div>
            <div class="goal">
            	<div class = "scor">
		            <c:forEach var="e" items="${userList}" >
		            	<div class = "basal">
		            		基礎代謝<br>
			            	<input type="button" onclick="result(${e.getUser_gender()}, ${e.getUser_weight()}, ${e.getUser_height()}, ${e.getUser_age()})" value = "BMR">：<span id="result"></span><br>
		            	</div>
		            	<div class = "basal">
		            		目標体重<br>${e.user_goalw} kg<br>
		            	</div>
		        		<div class = "basal">
		        			目標まであと<br>${e.user_weight- e.user_goalw} kg<br>
		        		</div>
					</c:forEach>
					<%-- <c:forEach var = "a" items = "${cardList }">
						${a.record_date}:${a.totalcal}<br>
					</c:forEach> --%>
				</div>
				<div class = "rand">
					<%!
					    String[] imglist = {
					        "img/mippy_1.gif",
					        "img/mippy_2.gif",
					        "img/mippy_3.gif",
					        "img/mippy_4.gif",
					        "img/mippy_5.gif"
					    };
					    int selectnum = (int) (Math.random() * imglist.length);
					    String selectedImage = imglist[selectnum];
					%>
					<img class = "pct" src = "<%= selectedImage %>">
					<%!
					    String[] msg = {
					        "<b>大吉！</b> … 今日はものすごく良いことがあるでしょう",
					        "<b>吉！</b> … 今日はまあまあ良いことがあるでしょう",
					        "<b>小吉！</b> … 今日は普通の日ですね",
					        "<b>凶！</b> … 今日は凶。。。",
					        "<b>大・激・凶！</b> … もう最悪っスね！！（ウソです）"
					    };
					    String randomMessage = msg[(int) (Math.random() * msg.length)];
					%>
					<div class = "box"><%= randomMessage %></div>
				</div>
            </div>
        </main>

	<!-- 共通js -->
    <script src="js/common.js"></script>
    <!-- top用js -->
    <script src="js/graph.js"></script>
    <!-- guraph -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/locale/ja.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@1.0.0"></script>
    <script>
	    var rawData = [
    		<c:forEach var="a" items="${cardList}">
    			{ date: '${a.record_date}' + 'T00:00:00', total_calories: '${a.totalcal}' },
    		</c:forEach>
    	];

	    //こっからファンクション
	    var display_year;
	    var display_month;
	    var display_first;
	    var display_last;

	    // こっからファンクション
	    function onInput() {
	        //カレンダーの月日を取得
	        display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
	        display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
	        display_first = new Date(display_year, display_month, 1).getDate();
	        display_last = new Date(display_year, display_month + 1, 0).getDate();
	    }

	    // 関数を呼び出す
	    onInput();
	    console.log(display_year);  // 表示された年
	    console.log(display_month);  // 表示された月
	    console.log(display_first);  // 月の最初の日
	    console.log(display_last);  // 月の最終日
	    //ここまでファンクション

	    var display_month1 = display_month + 1;

	    if (display_month1 < 10) {
	    	var display_month2 = "0" + display_month1;
	    } else {
	    	var display_month2 = display_month1;
	    }

	    var inc = display_year + "-" + display_month2;
	    console.log(inc);

	    var filteredData = rawData.filter(data => data.date.includes(inc));
	    var labels = filteredData.map(data => new Date(data.date));
	    var graphData = {
   			labels: labels/* filteredData.map(data => data.date) */,
   			datasets: [{
   				label: '合計摂取カロリー',
   				data: filteredData.map(data => data.total_calories),
   				borderColor: "rgba(255,0,0,1)",
   				backgroundColor: "rgba(0,0,0,0)"
   			}],
   		};

	    /* sample
		    var graphData = {
			labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'],
			datasets: [{
				label: '合計摂取カロリー',
				data: [1639, 873, 536, 596, 1851, 1028, 1127, 1613, 1333, 1165, 1303, 752, 622, 1230, 1572, 1579, 617, 68, 1296, 1270, 1945, 1853, 1592, 864, 1106, 1667, 1332, 392, 1761, 336, 1024],
				borderColor: "rgba(255,0,0,1)",
				backgroundColor: "rgba(0,0,0,0)"
			}],
		}; */
    </script>
</body>
</html>