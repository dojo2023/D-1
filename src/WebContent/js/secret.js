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

function pwcheck(){
    var newPassword = document.getElementById('new_pw').value;
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




