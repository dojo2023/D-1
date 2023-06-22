"use strict";
// 現在の日付を取得
var today = new Date();

// 日付を表示する要素を取得
var dateElement = document.getElementById("date");

// 月、日を取得
var month = today.getMonth() + 1; // 月は0から始まるため、+1する
var day = today.getDate();

// 日付を要素に挿入
dateElement.innerHTML = month + "/" + day;

//アバター表示js
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
}

// 初期表示時に選択されたアバターの画像を表示する
window.onload = showAvatarImage;

//背景色設定
function changeBackgroundColor() {
	var selectElement = document.getElementById("color-select");
	var selectedValue = selectElement.value;

	// ボディ要素のクラスを削除してから選択された背景色のクラスを追加する
	document.body.classList.remove("red-background", "green-background", "blue-background");

	switch (selectedValue) {
		case "1":
			document.body.classList.add("red-background");
			break;
		case "2":
			document.body.classList.add("green-background");
			break;
		case "3":
			document.body.classList.add("blue-background");
			break;
	}
}