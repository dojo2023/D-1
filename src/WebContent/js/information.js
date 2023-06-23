function validateForm() {
	var password = document.getElementById("new_pw").value;
	var confirmpassword = document.getElementById("co_pw").value;

	if (password !== confirmpassword) {
		document.getElementById("errorText").innerText = "パスワードが一致しません";
		return false; // フォームの送信をキャンセル
	}

	// パスワードが一致した場合はフォームを送信
	return true;
}