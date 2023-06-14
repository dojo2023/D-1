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
		option: {
		    title: {
		        display: true,
		        text: '気温（8月1日~8月7日）'
		    },
		    scales: {
		        yAxes: [{
		        	ticks: {
		            	suggestedMax: 40,
		            	suggestedMin: 0,
		            	stepSize: 10,
		            	callback: function(value){
		            		return  value +  '度'
		            	}
		          	}
		       	}]
		    }
		}
	})
})