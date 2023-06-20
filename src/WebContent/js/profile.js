// 現在の日付を取得
var today = new Date();

// 日付を表示する要素を取得
var dateElement = document.getElementById("date");

// 月、日を取得
var month = today.getMonth() + 1; // 月は0から始まるため、+1する
var day = today.getDate();

// 日付を要素に挿入
dateElement.innerHTML = month + "/" + day;