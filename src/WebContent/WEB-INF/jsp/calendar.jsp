<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a id = "logo" href = "/mippy/CalendarServlet">
		<img class = "img" src = "img/logo.png" alt = "ロゴ">
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
                    <p id = "show_month"></p>
                    <div id = "before" onclick = "beforeMonth()"></div>
                    <div id = "after" onclick = "afterMonth()"></div>
                    <input type = "month" id = "cal" value = "" oninput="onInput()">
                    <p id = "day_of_week">
        		</div>
        		<div id = "Weekone">
                    <div class = "FirstDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SecondDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FourthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SixthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        		</div>

        		<div id = "Weektwo">
                                        <div class = "FirstDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SecondDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FourthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SixthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        		</div>

        		<div id = "Weekthree">
                                        <div class = "FirstDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SecondDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FourthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SixthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        		</div>

        		<div id = "Weekfour">
                    <div class = "FirstDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SecondDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FourthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SixthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        		</div>
                <div id = "Weekfive">
                    <div class = "FirstDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SecondDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FourthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SixthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
                </div>
                <div id = "Weeksix">
                    <div class = "FirstDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SecondDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "ThirdDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FourthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "FifthtDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SixthDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
        			<div class = "SeventhDay Day">
                        <span class = "cal"></span>
                        <span>0kcal</span>
                    </div>
                </div>
        	</div>
        </main>
        <!-- 共通js -->
        <script src = "js/common.js"></script>
        <!-- ページjs -->
        <script src = "js/calendar.js"></script>
        <script>

				const count_start = document.getElementsByClassName("cal");
				for(let ex of count_start){
				    <c:forEach var = "e" items = "${list}">
				        if(ex.getAttribute("name") == '${e.record_date}'){
				            ex.parentNode.childNodes[3].innerHTML= ${e.totalcal} + "kcal";
				        }
				    </c:forEach>
				}
		</script>
    </body>
</html>
