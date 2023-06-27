<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mippy</title>
	<!-- <link rel="icon" href="img/mippy1号.gif"> -->

    <!-- 共通css -->
	<link rel="stylesheet" type="text/css" href="css/common.css">
    <!-- top用css -->
    <link rel="stylesheet" type="text/css" href="css/graph.css">

</head>
<body>
    <header>
        <div id="head">
           	<a id = "logo" href = "/mippy/CalendarServlet">
			<img class = "img" src = "img/mippy_logo.png" alt = "ロゴ">
			</a>
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
			<p>
				<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<c:set var="sum" value="0" />
				<c:set var="count" value="0" />

				<c:forEach var="a" items="${cardList}">
					<c:set var="sum" value="${sum + a.totalcal}" />
					<c:set var="count" value="${count + 1}" />
				</c:forEach>

				<c:set var="average" value="${sum / count}" />
				平均カロリー： <p id = "ave"> </p>kcal
			</p>
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
    <script src="js/graph."></script>
    <!-- guraph -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/locale/ja.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@1.0.0"></script>
    <script>
		//今日の現在の日付のデータを取得
		const year = new Date().getYear() + 1900;
		const month = new Date().getMonth() ;
		const first = new Date(year, month, 1).getDay();
		const last = new Date(year, month + 1, 0).getDate();

		//カレンダーに表示している月を表示する
		let cal_date = document.getElementById("cal");
		cal_date.value = year + "-" + ('00' + (month + 1)).slice( -2 );

		//サーブレットから記録した日と総カロリーを取得
	    var rawData = [
    		<c:forEach var="a" items="${cardList}">
    			{ date: '${a.record_date}' + 'T00:00:00', total_calories: '${a.totalcal}' },
    		</c:forEach>
    	];

		//引数をもとにグラフデータを取得
		let context = document.querySelector("#graph").getContext('2d');
		let myLineChart;

		//グラフデータを取得し描写する
	    define(year, month, first, last);
		myLineChart = new Chart(context, showGraph(year, month));



	    //こっからファンクション--------------------------------------------------------------------------------------
		function define(display_year, display_month, display_first, display_last){
	    	var display_month3 = display_month + 1;
	    	var display_first5 = display_first;
	    	var display_last5 = display_last;

		    if (display_month3 < 10) {
		    	var display_month4 = "0" + display_month3;
		    } else {
		    	var display_month4 = display_month3;
		    }

		    var inc = display_year + "-" + display_month4;
		    var filteredData = rawData.filter(data => data.date.includes(inc));
		    var labels = filteredData.map(data => new Date(data.date));

		    var ave = 0;
		   	for(let i = 0 ; i < filteredData.map(data => data.total_calories).length; i++){
		   		ave += parseInt(filteredData.map(data => data.total_calories)[i]);
		   	}
		   	if(ave > 0) {
		   		document.getElementById("ave").textContent = ave / (filteredData.map(data => data.total_calories).length);
		   	}else {
		   		document.getElementById("ave").textContent = 0;
		   	}

		    //データ挿入
		    return graphData = {
		    	labels: labels/* filteredData.map(data => data.date) */,
		    	datasets: [{
		    		label: '合計摂取カロリー',
		    		data: filteredData.map(data => data.total_calories),
		    		borderColor: "rgba(255,0,0,1)",
		    		backgroundColor: "rgba(0,0,0,0)"
		    	}],
		    };
	    }

		function showGraph(year, month){
			let config = {
					type: 'line',
					data: graphData,
					options: {
						scales: {
							y: {
								// 最小値・最大値
								suggestedMin: 0,
       							suggestedMax: 2500,
							},
							x: {
								// 最小値・最大値
								min: new Date(year, month, 1),
								max: new Date(year, (month+1), 0),
								type: 'time',
								time: {
									parser: 'D',
									unit: 'day',
									unitstepSize: 1,
									displayFormats: {
										'day': 'D'
									}
								},
							},
						},
					},
				};
			return config;
		}

		function onInput() {
	        //カレンダーの月日を取得
	        let display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
	        let display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
	        let display_first = new Date(display_year, display_month, 1).getDate();
	        let display_last = new Date(display_year, display_month + 1, 0).getDate();
	        myLineChart.destroy();
	        define(display_year, display_month, display_first, display_last);
	        myLineChart = new Chart(context, showGraph(display_year, display_month));
	    }

		function beforeMonth() {
		    //カレンダーの月日を取得
		    let display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
		    let display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
		    let display_first = new Date(display_year, display_month , 1).getDay();
		    let display_last = new Date(display_year, display_month + 1 , 0).getDate();

		    if(display_month == 0){
		        display_year -= 1;
		        display_month = 11;
		        display_first = new Date(display_year, display_month , 1).getDay();
		        display_last = new Date(display_year, display_month + 1 , 0).getDate();

		        cal_date.value = display_year + "-" + "12";
		    }else{
		        display_month -= 1;
		        display_first = new Date(display_year, display_month , 1).getDay();
		        display_last = new Date(display_year, display_month + 1 , 0).getDate();

		        cal_date.value = display_year + "-" + ('00' + (display_month + 1)).slice( -2 );
		    }
		    myLineChart.destroy();
		    define(display_year, display_month, display_first, display_last);
			myLineChart = new Chart(context, showGraph(display_year, display_month));
		}

		function afterMonth(){
		    let display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
		    let display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
		    let display_first = new Date(display_year, display_month , 1).getDay();
		    let display_last = new Date(display_year, display_month + 1 , 0).getDate();

		    if(display_month == 11){
		        display_year += 1;
		        display_month = 0;
		        display_first = new Date(display_year, display_month , 1).getDay();
		        display_last = new Date(display_year, display_month + 1 , 0).getDate();

		        cal_date.value = display_year + "-" + "01";
		    }else{
		        display_month += 1;
		        display_first = new Date(display_year, display_month , 1).getDay();
		        display_last = new Date(display_year, display_month + 1 , 0).getDate();

		        cal_date.value = display_year + "-" + ('00' + (display_month + 1)).slice( -2 );		        console.log("変更後" + display_year + "+" + (display_month) + "+" + display_first + "+" + display_last);
		    }
		    myLineChart.destroy();
		    define(display_year, display_month, display_first, display_last);
			myLineChart = new Chart(context, showGraph(display_year, display_month));

		}


    </script>
</body>
</html>
