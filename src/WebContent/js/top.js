window.addEventListener('load', function() {
    var slideIndex = 0;
    showSlide(slideIndex);
    function showSlide(n) {
        var slides = document.getElementsByClassName("slide")[0].getElementsByTagName("img");
        if (n >= slides.length) {
            slideIndex = 0;
        } else if (n < 0) {
            slideIndex = slides.length - 1;
        }
        for (var i = 0; i < slides.length; i++) {
            slides[i].style.opacity = "0";
            slides[i].style.transform = "translateX(100%)";
        }
        slides[slideIndex].style.opacity = "1";
        slides[slideIndex].style.transform = "translateX(0)";
    }
    function nextSlide() {
        slideIndex++;
        showSlide(slideIndex);
    }
    function previousSlide() {
        slideIndex--;
        showSlide(slideIndex);
    }
    setInterval(nextSlide, 4000); // 4秒ごとに次のスライドに切り替える
});