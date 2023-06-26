'use strict';
const btn = document.getElementById('btn');

  var target = document.querySelectorAll('.btn_open');
  var targetID;

  // openpopup
  for(var i = 0; i < target.length; i++){
    target[i].addEventListener('click', function(){
      targetID = this.getAttribute('href');
      document.querySelector(targetID).style.display = 'block';
    });
  }

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


