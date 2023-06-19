'use strict'
//今日の日付および月末までを判定
//month は　- 1 で表示される
const year = new Date().getYear() + 1900;
const month = new Date().getMonth() ;
const first = new Date(year, month, 1).getDay();
const last = new Date(year, month + 1, 0).getDate();

console.log(new Date(year, 11).getMonth());
//カレンダーに表示している月を表示する
let cal_date = document.getElementById("cal");
cal_date.value = year + "-" + ('00' + (month+1)).slice( -2 );

//表示
show_cal(year, month, first, last);

//カレンダーの月日を変えた時に更新
function onInput() {
    //カレンダーの月日を取得
    const display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
    const display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
    const display_first = new Date(display_year, display_month, 1).getDay();
    const display_last = new Date(display_year, display_month + 1, 0).getDate();

    //表示
    show_cal(display_year, display_month, display_first, display_last);
}


function beforeMonth(){
    //カレンダーの月日を取得
    const display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
    const display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
    let display_first = new Date(display_year, display_month -1, 1).getDay();
    const display_last = new Date(display_year, display_month, 0).getDate();

    const judge = new Date(display_year, 1).getMonth();

    if((display_month+1) > judge){
        show_cal(display_year, display_month, display_first, display_last);
        cal_date.value = display_year + "-" + ('00' + (display_month)).slice( -2 );
    }else {
        display_first = new Date(display_year-1, 12, 1).getDay();
        show_cal(display_year-1, 12, display_first, display_last);
        cal_date.value = display_year-1 + "-" + "12";
    }

}

function afterMonth(){
    const display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
    const display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
    let display_first = new Date(display_year, display_month + 1, 1).getDay();
    const display_last = new Date(display_year, display_month + 2 , 0).getDate();

    const judge = new Date(display_year, 11).getMonth();

    if((display_month+1) < judge){
        show_cal(display_year, display_month, display_first, display_last);
        cal_date.value = display_year + "-" + ('00' + (display_month+2)).slice( -2 );
    }else {
        display_first = new Date(display_year+1, 1, 1).getDay();
        show_cal(display_year+1, 1, display_first, display_last);
        cal_date.value = display_year +1  + "-" + "01";
    }
}


function show_cal(year, month, first, last){
    //曜日を子要素のdivに対応
    const sun = 1;
    const mon = 3;
    const tue = 5;
    const wed = 7;
    const thu = 9;
    const fri = 11;
    const sat = 13;
    const list = [sun, mon, tue, wed, thu, fri, sat];

    //htmlから週を取得
    let one = document.getElementById("Weekone");
    let two = document.getElementById("Weektwo");
    let thr = document.getElementById("Weekthree");
    let fou = document.getElementById("Weekfour");
    let fiv = document.getElementById("Weekfive");

    //中央の曜日を判定
    //1 = 月 …　7 = 日
    let center = 0;
    switch (first) {
        case 1:
            center = mon;
            break;

        case 2:
            center = tue;
            break;

        case 3:
            center = wed;
            break;

        case 4:
            center = thu;
            break;

        case 5:
            center = fri;
            break;

        case 6:
            center = sat;
            break;

        case 7:
            center = sun;
            break;
    }

    //中央の曜日の差分で日付を判定する
    //翌月や先月にも対応
    for (const l of list){
        if((1 + (l - center)/2) > 0 && last >= (1 + (l - center)/2)){
            one.childNodes[l].childNodes[1].innerHTML = (1 + (l - center)/2);
        }else{
            one.childNodes[l].childNodes[1].innerHTML = new Date(year, month, (29 + (l - center)/2)).getDate();
        }

        if((8 + (l - center)/2) > 0 && last >= (8 + (l - center)/2)){
            two.childNodes[l].childNodes[1].innerHTML = (8 + (l - center)/2);
        }else{
            two.childNodes[l].childNodes[1].innerHTML = new Date(year, month, (8 + (l - center)/2)).getDate();
        }

        if((15 + (l - center)/2) > 0 && last >= (15 + (l - center)/2)){
            thr.childNodes[l].childNodes[1].innerHTML = (15 + (l - center)/2);
        }else{
            thr.childNodes[l].childNodes[1].innerHTML = new Date(year, month, (15 + (l - center)/2)).getDate();
        }

        if((22 + (l - center)/2) > 0 && last >= (22 + (l - center)/2)){
            fou.childNodes[l].childNodes[1].innerHTML = (22 + (l - center)/2);
        }else{
            fou.childNodes[l].childNodes[1].innerHTML = new Date(year, month, (22 + (l - center)/2)).getDate();
        }

        if((29 + (l - center)/2) > 0 && last >= (29 + (l - center)/2)){
            fiv.childNodes[l].childNodes[1].innerHTML = (29 + (l - center)/2);
        }else{
            fiv.childNodes[l].childNodes[1].innerHTML = new Date(year, month, (29 + (l - center)/2)).getDate();
        }
    }
}

const elements = document.getElementsByClassName("Day");
Array.prototype.forEach.call(elements, function(item){
  // itemを利用した処理
  item.onclick = function() {
    location.href = "/mippy/src/servlet/Food_registerServlet";
  }
}
)