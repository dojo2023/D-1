
        function execute() {
            location.href = "/BlogApplication/secret"
        }


    btn.addEventListener('click', function() {
    var password = ('新しいパスワード');
    var pass = prompt('確認');
    formObj.onreset = function() {
  errorMessageObj.textContent = null;
  };
    if(password != pass){
        password_confirmation.setCustomValidity("入力値が一致しません。");
    }else{
        password_confirmation.setCustomValidity('');
    }
      });

 type="text/javascript"
        // サーブレットにリクエストを投げる
        function execute() {
            location.href = "/BlogApplication/secret"
        }


