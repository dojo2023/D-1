function CheckEmail_1() {
    //IE対応の為変更
    //var mail = new_pw.value; //メールフォームの値を取得
    //var mailConfirm = co_pw.value; //メール確認用フォームの値を取得
    var mail = document.getElementById("new_pw").value; //メールフォームの値を取得
    var mailConfirm = document.getElementById("co_pw").value; //メール確認用フォームの値を取得
    // パスワードの一致確認
    if (mail != mailConfirm){
      alert("パスワードと確認用パスワードが一致しません"); // 一致していなかったら、エラーメッセージを表示する
      return false;
    }else{
      return true;
    }
  };

 function koushin1(){
  location.reload();
}
function koushin2(){
  location.reload();
}

const addr_update = document.querySelector('#addr_update');
const headingA = document.querySelector('#heading_A');

buttonA.onclick = () => {
  const name = prompt('メールアドレすは？');
  alert(`こんにちは、${name}さん、はじめまして！`);
  headingA.textContent = `${name}さん、ようこそ`;
}