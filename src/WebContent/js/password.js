'use strict'

// クリアボタン
document.getElementById('resetbutton').addEventListener('click', function() {
    document.getElementById('new_pw').value = '';
    document.getElementById('co_pw').value = '';
});

function validateForm() {
    var newPassword = document.getElementById('new_pw').value;
    var confirmPassword = document.getElementById('co_pw').value;

    if (newPassword !== confirmPassword) {
        alert("パスワードが一致しません");
        return false; // フォームの送信をキャンセル
    }
    return true; // フォームの送信を許可
}
