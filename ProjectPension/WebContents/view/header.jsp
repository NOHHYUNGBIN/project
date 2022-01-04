<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
<style>
/*  
	nav {
		background-image: url('image/main/01.jpg');
		background-size: cover;
		text-shadow: black 0.2em 0.2em 0.2em;
		color: white;
		border: 1px solid;
	}
	*/
	
</style>
<script>
window.onload = function() {
	var checkresvform = document.getElementById("check");
	checkresvform.onclick = function() {
		let html = 'view/checkresvform.jsp';
		let name = '예약확인';
		let  features  = 'height=550,width=700,top=100,left=100';
		window.open(html,name,features);
	}
}
</script>
	<div class="header">
		<a class="gohome" href="main.jsp"> Green Stay </a>
		<nav>
			<a href="pension?cmd=MENU">숙소전경</a> 
			<a href="pension?cmd=ROOMS">객실안내</a> 
			<a href="pension?cmd=TRAVEL">추천여행지</a>
			<a href="pension?cmd=CALENDAR">실시간예약</a>
			<a href="" id="check">예약확인</a>
			<a href="pension?cmd=MAP">찾아오는길</a>
		</nav>
	</div>
</header>