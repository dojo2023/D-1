function check(){
    //IE対応の為変更
    //var mail = new_pw.value; //メールフォームの値を取得
    //var mailConfirm = co_pw.value; //メール確認用フォームの値を取得
    var mail = document.getElementById("new_pw").value; //メールフォームの値を取得
    var mailConfirm = document.getElementById("co_pw").value; //メール確認用フォームの値を取得
    // パスワードの一致確認
    if (mail != mailConfirm){
      form.value = '';
    document.getElementById('errorText').innerHTML = '同じパスワードを入力してください。';
      }
    };

 function koushin1(){
  location.reload();
}
function koushin2(){
  location.reload();
}
