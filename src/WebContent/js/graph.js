document.addEventListener("DOMContentLoaded", function() {
    let context = document.querySelector("#graph").getContext('2d')
    new Chart(context, {
		type: 'line',
		data: {
			labels: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
			datasets: [{
				label: '最高気温(度）',
		        data: [35, 34, 37, 35, 34, 35, 34, 25],
		        borderColor: "rgba(255,0,0,1)",
		        backgroundColor: "rgba(0,0,0,0)"
			}],
		},
		options: {
		    plugins: {
		      // グラフタイトル
		      	title: {
		        	display: true,
		        	text: '摂取カロリー',
		        	color: 'black',
		        	padding: {top: 5, bottom: 5},
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
						position: 'top-end',
		          		padding: {top: 20},
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
		        	min: 0,
		        	max: 60,
		        // 軸タイトル
		        	title: {
		          		display: true,
		          		text: '摂取カロリー',
		          		color: 'black',
		        	},
		        // 目盛ラベル
		        	ticks: {
		          		color: 'blue',
		          		stepSize: 20,
		          		showLabelBackdrop: true,
		          		backdropColor: '#ddf',
		          		backdropPadding: { x: 4, y: 2 },
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
			          	color: '#080',
			          	display: true,
			          // グリッド線
			          	borderDash: [3, 3],
			          	borderDashOffset: 0,
			          	// 目盛線
			          	drawTicks: true,
			          	tickColor: 'blue',
			          	tickLength: 10,
			          	tickWidth: 2,
			          	tickBorderDash: [2, 2],
			          	tickBorderDashOffset: 0,
		        	},
		      	},
		      	x: {
		        	grid: {
		          		borderColor: 'orange',
		          		borderWidth: 2,
		        	},
		      	},
		    },
		},
	})
})