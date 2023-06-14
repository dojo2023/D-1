
'use strict'

const form = document.getElementById("login");
let addr = document.getElementById("user_addr");

function check() {
	console.log(addr.value);
	console.log("aa");
	if ( addr === null ) {
		console.log("メールアドレスを入力してください");
	}
	else if ( form.user_pw.value.length === 0) {
		console.log("パスワードを入力してください");
	}
	else {
		form.action = "/mippy/LoginServlet";
		form.submit();
	}
}