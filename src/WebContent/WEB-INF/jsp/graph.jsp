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
       	<p>平均カロリー：  kcal</p>
            <div class="graphArea">
            	<input type = "month" id = "cal" value = "" onchange="onInput()">
            	<div id = "selecter">
            		<div class = "before" id = "before" onclick = "beforeMonth()"></div>
                    <div class = "after" id = "after" onclick = "afterMonth()"></div>
        		</div>
                <canvas id="graph" width="1000" height="400"></canvas>
            </div>
            <div class="goal">
            	<div class = "scor">
		            <c:forEach var="e" items="${userList}" >
		            	基礎代謝<br>
		            	<input type="button" onclick="result(${e.getUser_gender()}, ${e.getUser_weight()}, ${e.getUser_height()}, ${e.getUser_age()})" value = "BMR">：<span id="result"></span><br>
						目標体重<br>${e.user_goalw} kg<br>
						目標まであと<br>${e.user_weight- e.user_goalw} kg<br>
					</c:forEach>
					<c:forEach var = "a" items = "${cardList }">
						${a.record_date}:${a.totalcal}<br>
					</c:forEach>
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
		//今日の日付および月末までを判定
		//month は　- 1 で表示される
		const year = new Date().getYear() + 1900;
		const month = new Date().getMonth() ;
		const first = new Date(year, month, 1).getDay();
		const last = new Date(year, month + 1, 0).getDate();

		//カレンダーに表示している月を表示する
		let cal_date = document.getElementById("cal");
		cal_date.value = year + "-" + ('00' + (month+1)).slice( -2 );

	    var rawData = [
    		<c:forEach var="a" items="${cardList}">
    			{ date: '${a.record_date}' + 'T00:00:00', total_calories: '${a.totalcal}' },
    		</c:forEach>
    	];

	  //こっからファンクション--------------------------------------------------------------------------------------
	    var display_year;
	    var display_month;
	    var display_first;
	    var display_last;

	    function onInput() {
	        //カレンダーの月日を取得
	        display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
	        display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
	        display_first = new Date(display_year, display_month, 1).getDate();
	        display_last = new Date(display_year, display_month + 1, 0).getDate();

	        define(display_year, display_month, display_first, display_last);
	    }

	    // 関数を呼び出す
	    onInput();
	    console.log(display_year);  // 表示された年
	    console.log(display_month);  // 表示された月
	    console.log(display_first);  // 月の最初の日
	    console.log(display_last);  // 月の最終日
	    //ここまでファンクション--------------------------------------------------------------------------------------

	    //beforメソッド--------------------------------------------------------------------------------------------------
	    var display_year1;
	    var display_month1;
	    var display_first1;
	    var display_last1;

	    function beforeMonth(){
	        //カレンダーの月日を取得
	        display_year1 = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
	        display_month1 = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
	        display_first1 = new Date(display_year, display_month , 1).getDate();
	        display_last1 = new Date(display_year, display_month + 1 , 0).getDate();

	        console.log("現在は" + display_year1 + "+" + (display_month1) + "+" + display_first1 + "+" + display_last1);
	        if(display_month1 == 0){
	            display_year1 -= 1;
	            display_month1 = 11;
	            display_first1 = new Date(display_year1, display_month1 , 1).getDate();
	            display_last1 = new Date(display_year1, display_month1 + 1 , 0).getDate();

		        define(display_year1, display_month1, display_first1, display_last1);
	            cal_date.value = display_year1 + "-" + "12";
	            console.log("変更後" + display_year1 + "+" + (display_month1) + "+" + display_first1 + "+" + display_last1);
	        }else{
	            display_month1 -= 1;
	            display_first1 = new Date(display_year1, display_month1 , 1).getDate();
	            display_last1 = new Date(display_year1, display_month1 + 1 , 0).getDate();

		        define(display_year1, display_month1, display_first1, display_last1);
	            cal_date.value = display_year1 + "-" + ('00' + (display_month1 + 1)).slice( -2 );
	            console.log("変更後" + display_year1 + "+" + (display_month1) + "+" + display_first1 + "+" + display_last1);
	        }
	    }
	    //beforメソッド--------------------------------------------------------------------------------------------------

	    //afterメソッド--------------------------------------------------------------------------------------------------
	    var display_year2;
	    var display_month2;
	    var display_first2;
	    var display_last2;

	    function afterMonth(){
	        display_year2 = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
	        display_month2 = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
	        display_first2 = new Date(display_year2, display_month2 , 1).getDate();
	        display_last2 = new Date(display_year2, display_month2 + 1 , 0).getDate();

	        console.log("現在は" + display_year2 + "+" + (display_month2) + "+" + display_first2 + "+" + display_last2);

	        if(display_month2 == 11){
	            display_yea2r += 1;
	            display_month2 = 0;
	            display_first2 = new Date(display_year2, display_month2 , 1).getDate();
	            display_last2 = new Date(display_year2, display_month2 + 1 , 0).getDate();

		        define(display_year2, display_month2, display_first2, display_last2);
	            cal_date.value = display_year2 + "-" + "01";
	            console.log("変更後" + display_year2 + "+" + (display_month2) + "+" + display_first2 + "+" + display_last2);
	        }else{
	            display_month2 += 1;
	            display_first2 = new Date(display_year2, display_month2 , 1).getDate();
	            display_last2 = new Date(display_year2, display_month2 + 1 , 0).getDate();

		        define(display_year2, display_month2, display_first2, display_last2);
	            cal_date.value = display_year2 + "-" + ('00' + (display_month2 + 1)).slice( -2 );
	            console.log("変更後" + display_year2 + "+" + (display_month2) + "+" + display_first2 + "+" + display_last2);
	        }
	    }
	    //afterメソッド--------------------------------------------------------------------------------------------------

	    //軸と紐づけ--------------------------------------------------------------------------------------------------
	    var graphData;
	    var display_first5;
	    var display_last5;

	    function define(display_year, display_month, display_first, display_last){
	    	var display_month3 = display_month + 1;
	    	display_first5 = display_first;
	    	display_last5 = display_last;

		    if (display_month3 < 10) {
		    	var display_month4 = "0" + display_month3;
		    } else {
		    	var display_month4 = display_month3;
		    }

		    var inc = display_year + "-" + display_month4;
		    console.log(inc);

		    var filteredData = rawData.filter(data => data.date.includes(inc));
		    var labels = filteredData.map(data => new Date(data.date));
		    //データ挿入
		    graphData = {
		    	labels: labels/* filteredData.map(data => data.date) */,
		    	datasets: [{
		    		label: '合計摂取カロリー',
		    		data: filteredData.map(data => data.total_calories),
		    		borderColor: "rgba(255,0,0,1)",
		    		backgroundColor: "rgba(0,0,0,0)"
		    	}],
		    };
	    }

	    define();
	    console.log(graphData);
	    console.log(display_first5);
	    console.log(display_last5);
	    //ここまで紐づけ----------------------------------------------------------------------------------------------

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