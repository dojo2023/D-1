//メッセージを表示させる
function setMessage(message) {
    var messageElement = document.getElementById("message");
    if (messageElement) {
        messageElement.textContent = message;
    }
}
