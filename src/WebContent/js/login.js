
'use strict'

const form = document.getElementById("login");
let addr = document.getElementById("user_addr");

function check() {
	if ( form.user_addr.value.length === 0 && form.user_pw.value.length === 0 ) {
		document.getElementById('output').textContent="入力してください";
	}
	else if ( form.user_pw.value.length === 0) {
		document.getElementById('output').textContent="パスワードを入力してください";
	}
	else if ( form.user_addr.value.length === 0) {
		document.getElementById('output').textContent="メールアドレスを入力してください";
	}
	else {
		form.action = "/mippy/LoginServlet";
		form.submit();
	}
}