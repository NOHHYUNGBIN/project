<%@page import="java.util.List"%>
<%@page import="res.vo.ResVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>실시간 예약</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>


<style type="text/css">
div>a{
	text-decoration: none;
}
.cal_top {
	text-align: center;
	font-size: 30px;
	text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
}

.cal {
	text-align: center;
}

table.calendar {
	border: 1px solid black;
	display: inline-table;
	text-align: left;
	background-color: white;
}

table.calendar td {
	vertical-align: top;
	border: 1px solid black;
	width: 100px;
}

.red {
	color: red;
}

.green {
	color: green;
}

body {
	background-image: url('image/main/05.jpg');
	background-size: cover;
}
</style>

</head>
<body>
	<%@include file="/view/header.jsp"%>
	<br>
	<hr>
	<h1
		style="text-align: center; font-family: 'Last Ninja', Impact, fantasy; text-shadow: black 0.2em 0.2em 0.2em; color: white;">Reserve</h1>
	<h3
		style="text-align: center; font-family: 'Last Ninja', Impact, fantasy; text-shadow: black 0.2em 0.2em 0.2em; color: white;">Busan
		Emotional Stay</h3>

	<div class="cal_top">
		<p style="color: green; font-size: 20px;">●예약가능</p>
		<p style="color: red; font-size: 20px;">●예약불가</p>

		<a href="#" id="movePrevMonth"> 
			<span id="prevMonth" class="cal_tit">&lt;</span>
		</a> 
			<span id="cal_top_year"></span> 
			<span id="cal_top_month"></span> 

		<a href="#" id="moveNextMonth"> 
			<span id="nextMonth" class="cal_tit">&gt;</span>
		</a>
	</div>
	<div id="cal_tab" class="cal"></div>

	<script type="text/javascript">
		var today = null;
		var year = null;
		var month = null;
		var firstDay = null;
		var lastDay = null;
		var $tdDay = null;
		var $tdSche = null;
		var resv = null;

		$(document).ready(function() {

			$.ajax({
				url : '/getreslist',
				dataType : 'json'
			}).done(function(json) {
				//resv = JSON.stringify(json);
				resv = json;
				console.log(resv);
				//alert(resv);

				drawCalendar();
				initDate();
				drawDays();

			}).fail(function(xhr) {
				alert(xhr.status + ':' + xhr.statusText);
			}).always(function() {

				$("#movePrevMonth").on("click", function() {
					movePrevMonth();
				});
				$("#moveNextMonth").on("click", function() {
					moveNextMonth();
				});
				$('body').on("click", ".calendar td", function() {
					console.log(this);
					var thisYear = $('#cal_top_year').html();
					var thisMonth = $('#cal_top_month').html();
					var thisDate = $('.cal-day', this).html();
					var weekday = getWeekDay(thisYear, thisMonth, thisDate);
					var msg = thisYear + '-' + thisMonth + '-' + thisDate;
					//alert(msg)
				});

			});

		});
		// 요일 구하기
		function getWeekDay(thisYear, thisMonth, thisDate) {
			var wkday = [ '일', '월', '화', '수', '목', '금', '토' ];
			var aday = new Date(thisYear, thisMonth - 1, thisDate);
			var weekday = wkday[aday.getDay()];
			return weekday;
		}

		//calendar 그리기
		function drawCalendar() {
			var setTableHTML = "";
			setTableHTML += '<table class="calendar">';
			setTableHTML += '<tr class="week"><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
			for (var i = 0; i < 6; i++) {
				setTableHTML += '<tr height="100">';
				for (var j = 0; j < 7; j++) {
					setTableHTML += '<td class="day" style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
					setTableHTML += '    <div class="cal-day"></div>';
					setTableHTML += '    <div class="cal-schedule"></div>';
					setTableHTML += '</td>';
				}
				setTableHTML += '</tr>';
			}
			setTableHTML += '</table>';
			$("#cal_tab").html(setTableHTML);
		}

		//날짜 초기화
		function initDate() {
			$tdDay = $("td div.cal-day")
			$tdSche = $("td div.cal-schedule")
			dayCount = 0;
			today = new Date();
			year = today.getFullYear();
			month = today.getMonth() + 1;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);
		}

		function getExistResv(rdate, room_name) {

			var result = false;

			for (var i = 0; i < resv.length; i++) {
				if (resv[i].res_date == rdate) {
					if (resv[i].room_name == room_name) {
						if(resv[i].checked<2)
							return true;
					}
				}
			}
			return result;
		}

		function numberPad(n, width) {
			n = n + '';
			return n.length >= width ? n : new Array(width - n.length + 1)
					.join('0')
					+ n;
		}

		//calendar 날짜표시
		function drawDays() {
			$("#cal_top_year").text(year + "년");
			$("#cal_top_month").text(month + "월");

			for (var i = firstDay.getDay(); i < firstDay.getDay()
					+ lastDay.getDate(); i++) { //var i=4;i<31;i++
				$tdDay.eq(i).text(++dayCount);

				var rdate = year + '-' + numberPad(month, 2) + '-'
						+ numberPad(dayCount, 2);
				var rdate2 = year + ' ' + numberPad(month, 2) + ' '
				+ numberPad(dayCount, 2);
				var room_names = [ 'rose', 'sunflower', 'narcissus', 'violet',
						'hyacinth', 'lavendar' ];
				var room_nums = [ '101', '102', '201', '202', '301', '302' ];

				var tag = '<ul>';

				for (var j = 0; j < room_names.length; j++) {
					if (getExistResv(rdate, room_names[j]))
						tag += '<li class="red">' + room_nums[j] + "호 " + room_names[j] + '</li>';
					else
						tag += '<li class="green"><a href ="pension?cmd=RESVFORM&date=' + rdate2 + '&room_num='+ room_nums[j]+ ' " style="text-decoration: none; color:green;">' + room_nums[j] + "호 " + room_names[j] + '</a></li>';
				}
				//a href = "servlet?date=2021-12-03&room_num=101"
				tag += '</ul>';
				$tdDay.eq(i).append(tag);
			}
			for (var i = 0; i < 42; i += 7) {
				$tdDay.eq(i).css("color", "red");
			}
			for (var i = 6; i < 42; i += 7) {
				$tdDay.eq(i).css("color", "blue");
			}

		}

		//calendar 월 이동
		function movePrevMonth() {
			month--;
			if (month <= 0) {
				month = 12;
				year--;
			}
			if (month < 10) {
				month = String("0" + month);
			}
			getNewInfo();
		}

		function moveNextMonth() {
			month++;
			if (month > 12) {
				month = 1;
				year++;
			}
			if (month < 10) {
				month = String("0" + month);
			}
			getNewInfo();
		}

		function getNewInfo() {
			for (var i = 0; i < 42; i++) {
				$tdDay.eq(i).text("");
			}
			dayCount = 0;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);
			drawDays();
		}
		/**
		 * @brief   날짜 선택
		 * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
		 */
		function calendarChoiceDay(column) {

			// @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
			if (document.getElementsByClassName("choiceDay")[0]) {
				document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
				document.getElementsByClassName("choiceDay")[0].classList
						.remove("choiceDay");
			}

			// @param 선택일 체크 표시
			column.style.backgroundColor = "#FF9999";

			// @param 선택일 클래스명 변경

			column.classList.add("choiceDay");
		}
	</script>
	<%@include file="/view/bottom.jsp"%>
</body>
</html>