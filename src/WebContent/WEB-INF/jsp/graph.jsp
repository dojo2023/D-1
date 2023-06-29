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
				平均カロリー： <span id = "ave"></span>
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
			            	<!--<input type="button" onclick="result(${e.getUser_gender()}, ${e.getUser_weight()}, ${e.getUser_height()}, ${e.getUser_age()})" value = "BMR">  :--><span id="result"></span><br>
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
				<div id = "side_con">
					<div id = "baloon">
						<p id = "ck">
					</div>
					<div class = "rand">
						<img class = "pct" id = "ava" src ="">
					</div>
					<div>
						<p>基礎代謝とは…人が生きていくために最低限必要なエネルギー</p>
						<p>基礎代謝 > 摂取カロリー　を維持していくと体重が落ちてきます</p>
					</div>
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

		calculate();
		avator();

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
		   		let ave1 = ave / (filteredData.map(data => data.total_calories).length);
		   		let aveFormatted = ave1.toFixed(2);
		   		document.getElementById("ave").textContent = aveFormatted + " kcal";
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
						plugins: {
							// グラフタイトル
							title: {
								display: true,
								text: '摂取カロリー',
								color: 'black',
								padding: { top: 5, bottom: 5 },
								font: {
									family: '"Arial", "Times New Roman"',
									size: 12,
								},
							},
							// 凡例
							legend: {
								position: 'bottom',
								align: 'end',
								// 凡例ラベル
								labels: {
									boxWidth: 20,
									boxHeight: 8,
								},
								// 凡例タイトル
								title: {
									display: true,
									text: '日付',
									padding: { top: 20 },
								},
							},
							// ツールチップ
							tooltip: {
								backgroundColor: '#933',
							},
						},
						scales: {
							y: {
								// 最小値・最大値
								suggestedMin: 0,
       							suggestedMax: 2500,
       							title: {
									display: true,
									text: '摂取カロリー',
									color: 'black',
								},
								// 目盛ラベル
								ticks: {
									//color: 'blue',
									stepSize: 20,
									showLabelBackdrop: true,
									/* backdropColor: '#ddf',
									backdropPadding: { x: 4, y: 2 }, */
									major: {
										enabled: true,
									},
									align: 'end',
									crossAlign: 'center',
									sampleSize: 4,
								},
								grid: {
									// 軸線
									borderColor: 'orange',
									borderWidth: 2,
									drawBorder: true,
									// 目盛線＆グリッド線
									//color: '#080',
									display: true,
									// グリッド線
									borderDash: [3, 3],
									borderDashOffset: 0,
									// 目盛線
									drawTicks: true,
									//tickColor: 'blue',
									tickLength: 10,
									tickWidth: 2,
									tickBorderDash: [2, 2],
									tickBorderDashOffset: 0,
								},
							},
							x: {
								// 最小値・最大値
								min: new Date(year, month, 1),
								max: new Date(year, (month+1), 0),
								scaleLabel: {
									display: true,
								},
								type: 'time',
								time: {
									parser: 'D',
									unit: 'day',
									unitstepSize: 1,
									displayFormats: {
										'day': 'D'
									}
								},
								ticks: {
									//color: 'blue',
									autoSkip: false,  // ラベルの自動スキップを無効化
									maxRotation: 0,   // ラベルの最大回転角度を0度に設定
									minRotation: 0
								},
								grid: {
									borderColor: 'orange',
									borderWidth: 2,
									sampleSize: 31
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

		        cal_date.value = display_year + "-" + ('00' + (display_month + 1)).slice( -2 );
		        console.log("変更後" + display_year + "+" + (display_month) + "+" + display_first + "+" + display_last);
		    }
		    myLineChart.destroy();
		    define(display_year, display_month, display_first, display_last);
			myLineChart = new Chart(context, showGraph(display_year, display_month));
		}

		function BMR() {
			let BMR = 0;
			const gender = parseInt('${userList.get(0).user_gender}');
			const weight = parseFloat('${userList.get(0).user_weight}');
			const height = parseFloat('${userList.get(0).user_height}');
			const age = parseInt('${userList.get(0).user_age}');
			if (gender == 1) {
				BMR =(0.0481 * weight + 0.0234 * height - 0.0138 * age - 0.4235) * 1000 / 4.186;
			}else {
				BMR =(0.0481 * weight + 0.0234 * height - 0.0138 * age - 0.9708) *1000 / 4.186;
			}
			document.getElementById("result").textContent = BMR.toFixed(1) + "kcal";
			return BMR;
		}

		function calculate(){
			let ave = document.getElementById("ave").textContent.replace("kcal", "");
			if(ave == 0){
				console.log("aa");
			}else if (ave > BMR()){
				document.getElementById("ck").textContent = '${userList.get(0).user_nickname}' + "さん！ この調子だと太ります";
			}else if (ave < BMR()){
				document.getElementById("ck").textContent = '${userList.get(0).user_nickname}' + "さん！ この調子だとやせます";
			}
		}

		function avator(){
			const img_a = [
		        "img/mippy_1.gif",
		        "img/mippy_2.gif",
		        "img/mippy_3.gif",
		        "img/mippy_4.gif",
		        "img/mippy_5.gif",
		        "img/mippy_6.gif",
		        "img/mippy_7.gif",
		        "img/mippy_8.gif",
		        "img/mippy_9.gif",
		        "img/mippy_10.gif"
		    ];
			let num = parseInt('${userList.get(0).user_avatar}') - 1;
			document.getElementById("ava").setAttribute("src" , img_a[num]);
		}
    </script>
</body>
</html>
