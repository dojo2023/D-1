            'use strict'
            //今日の日付および月末までを判定
            //month は　- 1 で表示される
            const year = new Date().getYear() + 1900;
            const month = new Date().getMonth() ;
            const first = new Date(year, month, 1).getDay();
            const last = new Date(year, month + 1, 0).getDate();
            console.log(year + "+" + month+ "+" + first + "+" + last);
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
                let display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
                let display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
                let display_first = new Date(display_year, display_month , 1).getDay();
                let display_last = new Date(display_year, display_month + 1 , 0).getDate();

                console.log("現在は" + display_year + "+" + (display_month) + "+" + display_first + "+" + display_last);
                if(display_month == 0){
                    display_year -= 1;
                    display_month = 11;
                    display_first = new Date(display_year, display_month , 1).getDay();
                    display_last = new Date(display_year, display_month + 1 , 0).getDate();

                    show_cal(display_year, display_month, display_first, display_last);
                    cal_date.value = display_year + "-" + "12";
                    console.log("変更後" + display_year + "+" + (display_month) + "+" + display_first + "+" + display_last);
                }else{
                    display_month -= 1;
                    display_first = new Date(display_year, display_month , 1).getDay();
                    display_last = new Date(display_year, display_month + 1 , 0).getDate();

                    show_cal(display_year, display_month, display_first, display_last);
                    cal_date.value = display_year + "-" + ('00' + (display_month + 1)).slice( -2 );
                    console.log("変更後" + display_year + "+" + (display_month) + "+" + display_first + "+" + display_last);
                }

            }

            function afterMonth(){
                let display_year = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
                let display_month = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getMonth();
                let display_first = new Date(display_year, display_month , 1).getDay();
                let display_last = new Date(display_year, display_month + 1 , 0).getDate();

                console.log("現在は" + display_year + "+" + (display_month) + "+" + display_first + "+" + display_last);

                if(display_month == 11){
                    display_year += 1;
                    display_month = 0;
                    display_first = new Date(display_year, display_month , 1).getDay();
                    display_last = new Date(display_year, display_month + 1 , 0).getDate();

                    show_cal(display_year, display_month, display_first, display_last);
                    cal_date.value = display_year + "-" + "01";
                    console.log("変更後" + display_year + "+" + (display_month) + "+" + display_first + "+" + display_last);
                }else{
                    display_month += 1;
                    display_first = new Date(display_year, display_month , 1).getDay();
                    display_last = new Date(display_year, display_month + 1 , 0).getDate();

                    show_cal(display_year, display_month, display_first, display_last);
                    cal_date.value = display_year + "-" + ('00' + (display_month + 1)).slice( -2 );
                    console.log("変更後" + display_year + "+" + (display_month) + "+" + display_first + "+" + display_last);
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
                let six = document.getElementById("Weeksix");

                //中央の曜日を判定
                //1 = 月 …　7 = 日
                let center = 0;
                switch (first) {
                    case 0:
                        center = sun;
                        break;

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

                }

                //中央の曜日の差分で日付を判定する
                //翌月や先月にも対応
                for (const l of list){
                    if((1 + (l - center)/2) > 0 && last >= (1 + (l - center)/2)){
                        one.childNodes[l].childNodes[1].innerHTML = (1 + (l - center)/2);
                    }else{
                        one.childNodes[l].childNodes[1].innerHTML = new Date(year, month, (1 + (l - center)/2)).getDate();
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

                    if((36 + (l - center)/2) > 0 && last >= (36 + (l - center)/2)){
                        six.childNodes[l].childNodes[1].innerHTML = (36 + (l - center)/2);
                    }else{
                        six.childNodes[l].childNodes[1].innerHTML = new Date(year, month, (36 + (l - center)/2)).getDate();
                    }
                }
            }


            const firstDay = document.getElementsByClassName("FirstDay");
            const secondDay = document.getElementsByClassName("SecondDay");
            const thirdDay = document.getElementsByClassName("ThirdDay");
            const fourthtDay = document.getElementsByClassName("FourthDay");
            const fifthDay = document.getElementsByClassName("FifthtDay");
            const sixthDay = document.getElementsByClassName("SixthDay");
            const seventhDay = document.getElementsByClassName("SeventhDay");
            let c_day;
            let c_week = 0;

            for (let i = 0 ; i < 6; i++){
                firstDay[i].addEventListener('click',function(){
                    c_day = 1;
                    c_week = i + 1;
                });

                secondDay[i].addEventListener('click',function(){
                    c_day = 2;
                    c_week = i + 1;
                });

                thirdDay[i].addEventListener('click',function(){
                    c_day = 3;
                    c_week = i + 1;
                });

                fourthtDay[i].addEventListener('click',function(){
                    c_day = 4;
                    c_week = i + 1;
                });

                fifthDay[i].addEventListener('click',function(){
                    c_day = 5;
                    c_week = i + 1;
                });

                sixthDay[i].addEventListener('click',function(){
                    c_day = 6;
                    c_week = i + 1;
                });

                seventhDay[i].addEventListener('click',function(){
                    c_day = 7;
                    c_week = i + 1;
                });
            }

            //クリックされた時の処理
            const day = document.getElementsByClassName("Day");
            Array.prototype.forEach.call(day, function(items){
                // itemを利用した処理

                items.onclick = function() {
                    console.log(c_week);
                    console.log(c_day);
                    let result1 = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5) - 1), 1).getYear() + 1900;
                    let result2 = new Date(cal_date.value.slice(0,-3), (cal_date.value.slice(5)), 1).getMonth();
                    let one = document.getElementById("Weekone");
                    let two = document.getElementById("Weektwo");
                    let thr = document.getElementById("Weekthree");
                    let fou = document.getElementById("Weekfour");
                    let fiv = document.getElementById("Weekfive");
                    let six = document.getElementById("Weeksix");

                    let result;

                    switch (c_week) {
                        case 1:
                            result = search_date(one, c_day);
                            if(result > 10 && result2 == 1){
                                result1 -= 1;
                                result2 = 12;
                            }else if(result > 10 ){
                                result2 -= 1;
                            }
                            break;
                        case 2:
                            result = search_date(two, c_day);
                            break;
                        case 3:
                            result = search_date(thr, c_day);
                            break;
                        case 4:
                            result = search_date(fou, c_day);
                            break;
                        case 5:
                            result = search_date(fiv, c_day);
                            if(result < 10 && result2 == 12){
                                result1 += 1;
                                result2 = 1;
                            }else if(result < 10 ){
                                result2 += 1;
                            }
                            break;
                        case 6:
                            result = search_date(six, c_day);
                            if(result < 10 && result2 == 12){
                                result1 += 1;
                                result2 = 1;
                            }else if(result < 10 ){
                                result2 += 1;
                            }
                            break;

                    }

                    const elements = document.getElementsByClassName("Day");
                    const form =  `<form id = "javaGET" action = "Log_Servlet" method = "GET"> </form>`;
                    document.getElementById("selecter").insertAdjacentHTML("beforeend", form);
                    const textbox = `<input type = "hidden" value = "`+ result1 +`" name = "GETyear">`;
                    const textbox1 = `<input type = "hidden" value = "`+ result2 +`" name = "GETmonth">`;
                    const textbox2 = `<input type = "hidden" value = "`+ result +`" name = "GETdate">`;
                    document.getElementById("javaGET").insertAdjacentHTML("beforeend", textbox);
                    document.getElementById("javaGET").insertAdjacentHTML("beforeend", textbox1);
                    document.getElementById("javaGET").insertAdjacentHTML("beforeend", textbox2);

                    document.getElementById("javaGET").submit();

                }
            })

            function search_date(element, c_day){
                let c_date;
                switch(c_day){
                    case 1:
                        c_date = element.childNodes[1].childNodes[1].textContent;
                        break;
                    case 2:
                        c_date = element.childNodes[3].childNodes[1].textContent;
                        break;
                    case 3:
                        c_date = element.childNodes[5].childNodes[1].textContent;
                        break;
                    case 4:
                        c_date = element.childNodes[7].childNodes[1].textContent;
                        break;
                    case 5:
                        c_date = element.childNodes[9].childNodes[1].textContent;
                        break;
                    case 6:
                        c_date = element.childNodes[11].childNodes[1].textContent;
                        break;
                    case 7:
                        c_date = element.childNodes[13].childNodes[1].textContent;
                        break;
                }
                return c_date;
            }