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
        <main>
        	<div id = "calender">
        		<div id = "selecter">
                    <div id = "before" onclick = "beforeMonth()"></div>
                    <div id = "after" onclick = afterMonth()></div>
                    <input type = "month" id = "cal" value = "" oninput="onInput()">
        		</div>
        		<div id = "Weekone">
                    <div class = "1stDay Day">
                        <span></span>
                    </div>
        			<div class = "2stDay Day">
                        <span></span>
                    </div>
        			<div class = "3stDay Day">
                        <span></span>
                    </div>
        			<div class = "4stDay Day">
                        <span></span>
                    </div>
        			<div class = "5stDay Day">
                        <span></span>
                    </div>
        			<div class = "6stDay Day">
                        <span></span>
                    </div>
        			<div class = "7stDay Day">
                        <span></span>
                    </div>
        		</div>

        		<div id = "Weektwo">
                    <div class = "1stDay Day">
                        <span></span>
                    </div>
        			<div class = "2stDay Day">
                        <span></span>
                    </div>
        			<div class = "3stDay Day">
                        <span></span>
                    </div>
        			<div class = "4stDay Day">
                        <span></span>
                    </div>
        			<div class = "5stDay Day">
                        <span></span>
                    </div>
        			<div class = "6stDay Day">
                        <span></span>
                    </div>
        			<div class = "7stDay Day">
                        <span></span>
                    </div>
        		</div>

        		<div id = "Weekthree">
                    <div class = "1stDay Day">
                        <span></span>
                    </div>
        			<div class = "2stDay Day">
                        <span></span>
                    </div>
        			<div class = "3stDay Day">
                        <span></span>
                    </div>
        			<div class = "4stDay Day">
                        <span></span>
                    </div>
        			<div class = "5stDay Day">
                        <span></span>
                    </div>
        			<div class = "6stDay Day">
                        <span></span>
                    </div>
        			<div class = "7stDay Day">
                        <span></span>
                    </div>
        		</div>

        		<div id = "Weekfour">
                    <div class = "1stDay Day">
                        <span></span>
                    </div>
        			<div class = "2stDay Day">
                        <span></span>
                    </div>
        			<div class = "3stDay Day">
                        <span></span>
                    </div>
        			<div class = "4stDay Day">
                        <span></span>
                    </div>
        			<div class = "5stDay Day">
                        <span></span>
                    </div>
        			<div class = "6stDay Day">
                        <span></span>
                    </div>
        			<div class = "7stDay Day">
                        <span></span>
                    </div>
        		</div>
                <div id = "Weekfive">
                    <div class = "1stDay Day">
                        <span></span>
                    </div>
                    <div class = "2stDay Day">
                        <span></span>
                    </div>
                    <div class = "3stDay Day">
                        <span></span>
                    </div>
                    <div class = "4stDay Day">
                        <span></span>
                    </div>
                    <div class = "5stDay Day">
                        <span></span>
                    </div>
                    <div class = "6stDay Day">
                        <span></span>
                    </div>
                    <div class = "7stDay Day">
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
