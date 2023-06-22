'use strict';
const btn = document.getElementById('btn');

function addrsecretcheck() {
    var question_js = "<%= userSecret %>";
    var answer_js = "<%= userAnswer %>";

      if (question_js !== question) {
        alert("質問が一致しません");
        return false;
    } else if (answer_js !== answer) {
        alert("答えが一致しません");
        return false;

    } else {
        openPopup();
        return true;
    }
}

function openPopup() {
    var popup = document.getElementById('popup');
    popup.style.display = 'block';
}

function closePopup() {
    popup.style.display = 'none';
}

function pwcheck(){
    var newPassword = document.getElementById('u_pw').value;
    var confirmPassword = document.getElementById('co_pw').value;

                if (newPassword != confirmPassword){
                    //条件に一致しない場合
                    alert("パスワードが一致しません。");//エラーメッセージを出力
                    return false;    //送信ボタン本来の動作をキャンセルします
                }else{
                    //条件に一致する場合
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


