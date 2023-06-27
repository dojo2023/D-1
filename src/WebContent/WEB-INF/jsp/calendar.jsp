<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
    <head>
    	<link rel="icon" href="img/favicon.png" type="image/x-icon">
    	<title>mippy</title>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/calendar.css">
    </head>

    <body>
	<header>
		<div id = "head">
		<a id = "logo" href = "/mippy/CalendarServlet">
		<img class = "img" src = "img/mippy_logo.png" alt = "ロゴ">
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
                    <div id = "before" onclick = "beforeMonth()">
                    	<div id ="left_tri"></div>
                    </div>
                    <p id = "show_month"></p>
                    <input type = "month" id = "cal" value = "" oninput="onInput()">
                    <div id = "after" onclick = "afterMonth()">
                    	<div id ="right_tri"></div>
                    </div>
        		</div>
        		<div id = "dayof">
                	<div class = "FirstDay Dayof"><p>日</p></div>
                	<div class = "Dayof"><p>月</p></div>
					<div class = "Dayof"><p>火</p></div>
					<div class = "Dayof"><p>水</p></div>
					<div class = "Dayof"><p>木</p></div>
					<div class = "Dayof"><p>金</p></div>
					<div class = "Dayof"><p>土</p></div>
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
               	<div id = "sq"></div>
        	</div>
        </main>
        <!-- 共通js -->
        <script src = "js/common.js"></script>
        <!-- ページjs -->
        <script src = "js/calendar.js"></script>
        <script>
        	food_cal();
			function food_cal(){
				const count_start = document.getElementsByClassName("cal");
				for(let ex of count_start){
				    <c:forEach var = "e" items = "${list}">
				        if(ex.getAttribute("name") == '${e.record_date}'){
				            ex.parentNode.childNodes[3].innerHTML= ${e.totalcal} + "kcal";
				        }
				    </c:forEach>
				}
			}
		</script>
    </body>
</html>
