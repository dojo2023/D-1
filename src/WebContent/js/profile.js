window.onload = function() {
  // 現在の日付を取得
  var today = new Date();
}

 /* [更新]ボタンをクリックしたときの処理

function validateForm(event) {
  var userNickname = document.forms[0].USER_NICKNAME.value;
  var userHeight = document.forms[0].USER_HEIGHT.value;
  var userWeight = document.forms[0].USER_WEIGHT.value;
  var userGender = document.getElementById('USER_GENDER').value;
  var userBirth = document.forms[0].USER_BIRTH.value;
  var userGoalw = document.forms[0].USER_GOALW.value;
  var userLimit = document.forms[0].USER_LIMIT.value;

  if (userNickname === '' || userHeight === '' || userGender === '' || userGender === '' || userBirth === '' || userGoalw === '' || userLimit === '') {
    alert('全てのフィールドを入力してください');
    event.preventDefault(); // フォームの送信を中止
    window.location.href = '/mippy/Profile_Servlet'; // 同じページにリダイレクト
    return false; // フォームの送信を中止
  }

  return true; // フォームの送信
}
*/