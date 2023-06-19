'use strict';

            //初期値の設定
            let count = 0;
            let id = 1;

            //1回目のクリック（メニューを表示させる)
            function menu(){
                if (count == 0){
                    id = 1;

                    //メニューの背景を表示する
                    const box = document.getElementById("box");
                    const css ="width: 200px;" +
                               "height: 280px;"+
                               "background-color: #f5deb3;"+
                               "position: absolute;"+
                               "top: 2.8%;"+
                               "right: 4%;"+
                               "border-radius: 7px 19px 7px 7px;";
                    box.style.cssText = css;

                    const ul = `<ul id = "menu_text" > </ul>`;
                    box.insertAdjacentHTML("beforeend", ul);

                    //メニューの文字を表示する
                    const menu = document.getElementById("menu_text");
                    const text = [
                    "カレンダー",
                    "食事記録",
                    "グラフ表示",
                    "プロフィール設定",
                    "ログアウト"
                    ]

                    //※作成したサーブレットを追加予定
                    const url = [
                        "CalenderServlet",
                        "Log_Servlet",
                        "GraphServlet",
                        "Profile_Servlet",
                        "TopServlet"
                    ]

                    //ulの中に追加する
                    for(let t of text){
                        const li = `<li id = "` +id+ `" class = "m_text"><a href = "`+ url[id]+`">${t}</a></li>`;
                        menu.insertAdjacentHTML("beforeend", li);
                        id++;
                    }
                    count++;

                //2回目のクリックの時(メニューを消す)
                }else if (count == 1){
                    count = 0;
                    box.style.cssText = "";
            		document.getElementById("menu_text").remove();
                    for(let s = 1; s < 6 ; s++){
                        let remove = document.getElementById(s);
                        remove.remove();
                    }
                }
            }