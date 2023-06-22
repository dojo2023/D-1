"use strict";

// 現在の日付を取得
var today = new Date();

// 曜日の配列
var daysOfWeek = ['日', '月', '火', '水', '木', '金', '土'];

// 月、日、曜日を取得
var month = today.getMonth() + 1; // 月は0から始まるため、+1する
var day = today.getDate();
var dayOfWeek = daysOfWeek[today.getDay()];

// 日付と曜日を表示する要素を取得
var dateElement = document.getElementById("date");

// 日付と曜日を要素に挿入
dateElement.innerHTML = month + "月" + day + "日（" + dayOfWeek + "）";

// アバターが選択された時に実行される関数
function showAvatarImage() {
	var selectElement = document.getElementById("avatar-select");
	var selectedValue = selectElement.value;

	// すべての画像を非表示にする
	var allImages = document.getElementsByClassName("avatar-image");
	for (var i = 0; i < allImages.length; i++) {
		allImages[i].style.display = "none";
	}

	// 選択されたアバターの画像を表示する
	var selectedImage = document.getElementById("avatar-image-" + selectedValue);
	selectedImage.style.display = "block";

	// ランダムなテキストを表示する
	showRandomMessage();
}

// ランダムなテキストを表示する関数
function showRandomMessage() {
	var messageIndex = Math.floor(Math.random() * messages.length);
	var message = messages[messageIndex];
	document.getElementById("avatar-message").textContent = message;
}

// アバターがしゃべるテキストのリスト
var messages = [
	"今日もがんばろう！！",
	"いい天気だね！",
	"頑張って運動しよう！",
	"美味しいごはんを食べよう！",
	"笑顔が素敵だよ！",
	"楽しいことを見つけてみよう！",
	"お疲れさま！一休みしよう",
	"明日は新しい挑戦だ！",
	"応援してるよ！",
	"毎日を大切に過ごそう！",
	"新しいことに挑戦する勇気を持とう！",
	"感謝の気持ちを忘れずに過ごそう！",
	"小さな一歩が大きな成果につながることもあるんだ！",
	"困難な時こそ、自分の力を信じて前進しよう！",
	"失敗は成功への道しるべだから、諦めずに頑張ろう！",
	"夢を持つことは素晴らしい！自分の夢を追いかけてみよう！",
	"人生は冒険だ！新たな冒険に出かける準備はできているかな？",
	"一つ一つの積み重ねが、未来を作っていくんだよ！",
	"心の中に光を灯し、前向きな気持ちで進もう！",
	"人々とのつながりを大切にし、思いやりのある行動を心掛けよう！"

];

// 初期表示時にアバターの画像を表示する
window.onload = function() {
	showAvatarImage();
};
