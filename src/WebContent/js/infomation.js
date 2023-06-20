function check(){
var mail = document.getElementById("new_pw").value; //メールフォームの値を取得
    var mailConfirm = document.getElementById("co_pw").value; //メール確認用フォームの値を取得
    // パスワードの一致確認
    if (mail != mailConfirm){
      //input.setCustomValidity('メールアドレスが一致しません'); // エラーメッセージのセット
      document.getElementById("errorText").textContent = "メールアドレスが一致しません";
      return false;
    }else{
      document.getElementById("errorText").textContent = "";
       //document.getElementById("info2").submit();
       return true;
     }
};