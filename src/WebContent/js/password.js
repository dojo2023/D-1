 function resetForm() {
    document.getElementById("new_pw").value = ""; // 新規パスワードのテキストボックスをクリア
    document.getElementById("co_pw").value = ""; // パスワード確認のテキストボックスをクリア
  }

const newPassword = document.getElementById('new_pw');
const confirmPassword = document.getElementById('co_pw');
const errorText = document.getElementById('errorText');
const updateButton = document.getElementById('updateButton');

function validatePassword() {
  if (newPassword.value === '' || confirmPassword.value === '') {
    errorText.innerText = '';
    updateButton.disabled = false;
  } else if (newPassword.value !== confirmPassword.value) {
    errorText.innerText = 'パスワードが一致しません';
    updateButton.disabled = true;
  } else {
    errorText.innerText = '';
    updateButton.disabled = false;
  }
}

newPassword.addEventListener('input', validatePassword);
confirmPassword.addEventListener('input', validatePassword);
