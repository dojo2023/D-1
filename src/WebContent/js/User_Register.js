// パスワードの確認
function validateForm() {
	var password = document.getElementById("password").value;
	var confirmpassword = document.getElementById("confirmpassword").value;

	if (password !== confirmpassword) {
		document.getElementById("errorText").innerText = "パスワードが一致しません";
		return false; // フォームの送信をキャンセル
	}

	// パスワードが一致した場合はフォームを送信
	return true;
}

/*
//パスワードを半角英数字のみ受け付ける
function validatePassword(input) {
  var regex = /^[A-Za-z0-9]*$/;
  var value = input.value;

  if (!regex.test(value)) {
    input.setCustomValidity("パスワードは半角英数字のみで入力してください");
  } else {
    input.setCustomValidity("");
  }
}*/

document.getElementById("resetbutton").addEventListener("click",function() {
var errorText = document.getElementById("errorText");
errorText.innerText = "";
});