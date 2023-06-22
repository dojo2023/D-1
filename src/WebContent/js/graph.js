'use strict'

//guraphメソッド--------------------------------------------------------------------------------------------------
document.addEventListener("DOMContentLoaded", function() {
	let context = document.querySelector("#graph").getContext('2d')
	new Chart(context, {
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
					min: '1',
					max: '30',
					scaleLabel: {
						display: true,
					},
					type: 'time',
					time: {
						parser: 'D',
						unit: 'day',
						//stepSize: 1,
						displayFormats: {
							'day': 'D'
						}
					},
					ticks: {
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
	})
})
//graphメソッド--------------------------------------------------------------------------------------------------

/*体重か摂取カロリーの変更プルダウン
var dropDown = document.getElementById("");
dropDown.onchange = function() {
	var weight = $(this).val();
}
*/

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

/*コメントランダム表示
function message() {
	var msg = new Array();
	// 設定開始（メッセージの内容を設定してください）
	msg[0] = '<b>大吉！</b> … 今日はものすごく良いことがあるでしょう';
	msg[1] = '<b>吉！</b> … 今日はまあまあ良いことがあるでしょう';
	msg[2] = '<b>小吉！</b> … 今日は普通の日ですね';
	msg[3] = '<b>凶！</b> … 今日は凶。。。';
	msg[4] = '<b>大・激・凶！</b> … もう最悪っスね！！（ウソです）';
	// 設定終了
	var no = Math.floor(Math.random() * msg.length);
	// 表示開始
	document.getElementById("massage").innerHTML = msg[no];
}
*/