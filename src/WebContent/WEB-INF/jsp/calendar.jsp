<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/calendar.css">
    </head>

    <body>
	<header>
		<div id = "head">
		<a id = "logo" href = "カレンダーサーブレット">
		<img class = "img" src = "logo.png" alt = "ロゴ">
		</a>
			<div id = "menu" onclick="menu()">
				<ul id = "menu_bar">
				<li class = "bar"></li>
				<li class = "bar"></li>
				<li class = "bar"></li>
				</ul>
			</div>
			<div id = "box">
			</div>
		</div>
	</header>
        <main>
        	<div id = "calendar">
        		<div id = "selecter">
        		<p id = "Month" ></p>
                    <div id = "before" onclick = "beforeMonth()"></div>
                    <div id = "after" onclick = "afterMonth()"></div>
                    <input type = "month" id = "cal" value = "" oninput="onInput()">
        		</div>
        		<div id = "Weekone">
                    <div class = "FirstDay Day">
                        <span></span>
                    </div>
        			<div class = "SecondDay Day">
                        <span></span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span></span>
                    </div>
        			<div class = "FourthDay Day">
                        <span></span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span></span>
                    </div>
        			<div class = "SixthDay Day">
                        <span></span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span></span>
                    </div>
        		</div>

        		<div id = "Weektwo">
                    <div class = "FirstDay Day">
                        <span></span>
                    </div>
        			<div class = "SecondDay Day">
                        <span></span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span></span>
                    </div>
        			<div class = "FourthDay Day">
                        <span></span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span></span>
                    </div>
        			<div class = "SixthDay Day">
                        <span></span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span></span>
                    </div>
        		</div>

        		<div id = "Weekthree">
                    <div class = "FirstDay Day">
                        <span></span>
                    </div>
        			<div class = "SecondDay Day">
                        <span></span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span></span>
                    </div>
        			<div class = "FourthDay Day">
                        <span></span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span></span>
                    </div>
        			<div class = "SixthDay Day">
                        <span></span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span></span>
                    </div>
        		</div>

        		<div id = "Weekfour">
                    <div class = "FirstDay Day">
                        <span></span>
                    </div>
        			<div class = "SecondDay Day">
                        <span></span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span></span>
                    </div>
        			<div class = "FourthDay Day">
                        <span></span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span></span>
                    </div>
        			<div class = "SixthDay Day">
                        <span></span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span></span>
                    </div>
        		</div>
                <div id = "Weekfive">
                    <div class = "FirstDay Day">
                        <span></span>
                    </div>
        			<div class = "SecondDay Day">
                        <span></span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span></span>
                    </div>
        			<div class = "FourthDay Day">
                        <span></span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span></span>
                    </div>
        			<div class = "SixthDay Day">
                        <span></span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span></span>
                    </div>
                </div>
                <div id = "Weeksix">
                    <div class = "FirstDay Day">
                        <span></span>
                    </div>
        			<div class = "SecondDay Day">
                        <span></span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span></span>
                    </div>
        			<div class = "FourthDay Day">
                        <span></span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span></span>
                    </div>
        			<div class = "SixthDay Day">
                        <span></span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span></span>
                    </div>
                </div>
        	</div>
        </main>
        <!-- 共通js -->
        <script src = "js/common.js"></script>
        <!-- ページjs -->
        <script src = "js/calendar.js"></script>
    </body>
</html>
