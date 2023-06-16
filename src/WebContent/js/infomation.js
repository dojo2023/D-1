'use strict'
const btn = document.getElementById('btn');

        function SheckPassword(password_confirmation) {
            var now_pass =password.value;
            var new_pass = password_comfirmation.value;
            formObj.onreset = function() {
                errorMessageObj.textContent = null;
            };
            if( now_pass!= new_pass ){
                password_confirmation.setCustomValidity("入力値が一致しません。");
            }else{
                password_confirmation.setCustomValidity('');
            }

let addr = document.getElementById("u_addr");

function check() {
	if ( form.user_addr.value.length === 0 && form.user_pw.value.length === 0 ) {
		document.getElementById('output').textContent="入力してください";
	}
	else if ( form.u_pw.value.length === 0) {
		document.getElementById('output').textContent="パスワードを入力してください";
	}
	else if ( form.u_addr.value.length === 0) {
		document.getElementById('output').textContent="メールアドレスを入力してください";
	}
	else {
		form.action = "/mippy/InfomationServlet";
		form.submit();
	}
}