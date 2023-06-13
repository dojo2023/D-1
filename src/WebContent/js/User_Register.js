     /* [登録]ボタンをクリックしたときの処理 */
     function validateForm() {
    var userAddr = document.forms[0].USER_ADDR.value;
    var userPw = document.forms[0].USER_PW.value;
    var confirmPw = document.getElementById('pass').value;
    var userAnswer = document.forms[0].USER_ANSWER.value;
	console.log(userAddr);
    if (userAddr === '' || userPw === '' || confirmPw === '' || userAnswer === '') {
      alert('全てのフィールドを入力してください');
      return false;
    }

    if (userPw !== confirmPw) {
      alert('パスワードが一致しません');
      return false;
    }

    return true;
  }

