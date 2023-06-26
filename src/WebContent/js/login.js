'use strict'
const form = document.getElementById("login");
let addr = document.getElementById("user_addr");
function check() {
	if ( form.user_addr.value.length === 0 && form.user_pw.value.length === 0 ) {
		document.getElementById('output').textContent="入力してください";
		return false;
	}
	else if ( form.user_pw.value.length === 0) {
		document.getElementById('output').textContent="パスワードを入力してください";
		return false;
	}
	else if ( form.user_addr.value.length === 0) {
		document.getElementById('output').textContent="メールアドレスを入力してください";
		return false;
	}
	else {
		return true;
	}
}

//リセットボタンをクリックした時の処理
document.getElementById("resetbutton").addEventListener("click",function() {
//エラーメッセージの要素を取得
var output = document.getElementById("output");
//エラーメッセージをクリアする
output.textContent = "";
});

// エンターキーでログイン
function checkLogin() {
/*  // Enterキーが押された場合にログイン処理を実行
  document.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
      // ログイン処理を実行するためのコードを記述
      // ここでは、check() 関数を呼び出す例としています
      return check();
    }
  });*/
  // フォームが送信される前に false を返すことで、デフォルトのフォーム送信をキャンセルします
  return false;
}









