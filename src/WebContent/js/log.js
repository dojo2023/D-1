'use strict';

const form = document.getElementById("form");


//日付が変更された時
function func() {
	form.submit();
}

function check() {
	const time = document.getElementById("record_category_time").value;
	const cat = document.getElementById("record_category").value;
	const item = document.getElementById("record_item").value;
	console.log(time + cat + item);
	if(time && cat && item ){
		form.action = "/mippy/Log_Servlet";
		form.submit();
	}else{
	document.getElementById("output").textContent= "未入力の項目があります";
	}

}