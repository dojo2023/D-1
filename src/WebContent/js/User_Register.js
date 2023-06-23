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
