'use strict'
const btn = document.getElementById('btn');
//パスワード変更押して一致するか確認

 function check(){
                if (new_pw != co_pw){
                    //条件に一致する場合(メールアドレスが空の場合)
                    alert("パスワードが一致しません。");    //エラーメッセージを出力
                    return false;    //送信ボタン本来の動作をキャンセルします
                }else{
                    //条件に一致しない場合(メールアドレスが入力されている場合)
                    return true;    //送信ボタン本来の動作を実行します
                }
            }

let addr = document.getElementById("q_addr");

//送信押ししたらデータ参照する.
function execute() {
  location.href = "/BlogApplication/secret"
}



 type="text/javascript"
        // サーブレットにリクエストを投げる
        function execute() {
            location.href = "/BlogApplication/secret"
        }


