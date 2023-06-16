document.addEventListener("DOMContentLoaded", function() {
	let context = document.querySelector("#graph").getContext('2d')
	new Chart(context, {
		type: 'line',
		data: {
			labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'],
			datasets: [{
				label: '合計摂取カロリー',
				data: [1639, 873, 536, 596, 1851, 1028, 1127, 1613, 1333, 1165, 1303, 752, 622, 1230, 1572, 1579, 617, 68, 1296, 1270, 1945, 1853, 1592, 864, 1106, 1667, 1332, 392, 1761, 336, 1024],
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
					min: 0,
					max: 2500,
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

//体重か摂取カロリーの変更プルダウン
var dropDown = document.getElementById("");
dropDown.onchange = function() {
	var weight = $(this).val();
}

//計算結果
function result(gender, weight, height, age) {
	var result = 0;
	if (gender === 1) {
		result = 13.397 * weight + 4.799 * height - 5.677 * age + 88.362;
	} else {
		result = 9.247 * weight + 3.098 * height - 4.33 * age + 447.593;
	}
    document.getElementById("result").textContent = result.toFixed(2);
	return result;
}