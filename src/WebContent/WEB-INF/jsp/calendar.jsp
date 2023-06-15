<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <!-- 共通css -->
        <link rel = "stylesheet" href = "css/common.css">
        <!-- ページcss -->
        <link rel = "stylesheet" href = "css/calender.css">
    </head>
    <body>
        <header>
        	<div id = "head">
                <a id = "logo" href = "カレンダーサーブレット">
                    <img class = "img" src = "img/logo.png" alt = "ロゴ">
                </a>
                <div id = "menu" onclick="menu()">
                    <ul id = "menu_bar">
                        <li class = "bar"></li>
                        <li class = "bar"></li>
                        <li class = "bar"></li>
                    </ul>
                </div>
                <div id = "box"></div>
            </div>
        </header>
        <main>
        	<div id = "calender">
        		<div id = "selecter">
        		</div>
        		<div id = "Weekone">
        			<div class = "1stDay Day">
        			</div>
        			<div class = "2stDay Day">
        			</div>
        			<div class = "3stDay Day">
        			</div>
        			<div class = "4stDay Day">
        			</div>
        			<div class = "5stDay Day">
        			</div>
        			<div class = "6stDay Day">
        			</div>
        			<div class = "7stDay Day">
        			</div>
        		</div>

        		<div id = "Weektwo">
        			<div class = "1stDay Day">
        			</div>
        			<div class = "2stDay Day">
        			</div>
        			<div class = "3stDay Day">
        			</div>
        			<div class = "4stDay Day">
        			</div>
        			<div class = "5stDay Day">
        			</div>
        			<div class = "6stDay Day">
        			</div>
        			<div class = "7stDay Day">
        			</div>
        		</div>

        		<div id = "Weekthree">
         			<div class = "1stDay Day">
        			</div>
        			<div class = "2stDay Day">
        			</div>
        			<div class = "3stDay Day">
        			</div>
        			<div class = "4stDay Day">
        			</div>
        			<div class = "5stDay Day">
        			</div>
        			<div class = "6stDay Day">
        			</div>
        			<div class = "7stDay Day">
        			</div>
        		</div>

        		<div id = "Weekfour">
        			<div class = "1stDay Day">
        			</div>
        			<div class = "2stDay Day">
        			</div>
        			<div class = "3stDay Day">
        			</div>
        			<div class = "4stDay Day">
        			</div>
        			<div class = "5stDay Day">
        			</div>
        			<div class = "6stDay Day">
        			</div>
        			<div class = "7stDay Day">
        			</div>
        		</div>
        	</div>

        </main>
        <!-- 共通js -->
        <script src = "js/common.js"></script>
        <!-- ページjs -->
        <script src = ""></script>
    </body>
</html>