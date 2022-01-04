<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Green Stay</title>
<style>
figure.snip1384 {
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	overflow: hidden;
	width: 100%;
	color: #ffffff;
	text-align: left;
	font-size: 16px;
	background-color: #000000;
}

figure.snip1384 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

figure.snip1384 img {
	max-width: 100%;
	backface-visibility: hidden;
	vertical-align: top;
}

figure.snip1384:after, figure.snip1384 figcaption {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

figure.snip1384:after {
	content: '';
	background-color: rgba(0, 0, 0, 0.65);
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
	opacity: 0;
}

figure.snip1384 figcaption {
	z-index: 1;
	padding: 40px;
}

figure.snip1384 h3, figure.snip1384 .links {
	width: 100%;
	margin: 5px 0;
	padding: 0;
}

figure.snip1384 h3 {
	line-height: 1.1em;
	font-weight: 700;
	font-size: 1.4em;
	text-transform: uppercase;
	opacity: 0;
}

figure.snip1384 p {
	font-size: 0.8em;
	font-weight: 300;
	letter-spacing: 1px;
	opacity: 0;
	top: 50%;
	-webkit-transform: translateY(40px);
	transform: translateY(40px);
}

figure.snip1384 i {
	position: absolute;
	bottom: 10px;
	right: 10px;
	padding: 20px 25px;
	font-size: 34px;
	opacity: 0;
	-webkit-transform: translateX(-10px);
	transform: translateX(-10px);
}

figure.snip1384 a {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 1;
}

figure.snip1384:hover img, figure.snip1384.hover img {
	zoom: 1;
	filter: alpha(opacity = 50);
	-webkit-opacity: 0.5;
	opacity: 0.5;
}

figure.snip1384:hover:after, figure.snip1384.hover:after {
	opacity: 1;
	position: absolute;
	top: 10px;
	bottom: 10px;
	left: 10px;
	right: 10px;
}

figure.snip1384:hover h3, figure.snip1384.hover h3, figure.snip1384:hover p,
	figure.snip1384.hover p, figure.snip1384:hover i, figure.snip1384.hover i
	{
	-webkit-transform: translate(0px, 0px);
	transform: translate(0px, 0px);
	opacity: 1;
}
</style>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$.ajax({
			url : '/getroomlist',
			success : function(xml){
				var rooms = "";
				$(xml).find('room').each(function(index,room){
					var name = $(room).find('room_name').text();
					var num = $(room).find('room_num').text();
					var type = $(room).find('room_type').text();
					var person = $(room).find('room_person').text();
					var maxPerson = $(room).find('room_maxperson').text();
					var weekCost = $(room).find('room_week_cost').text();
					var weekendCost = $(room).find('room_weekend_cost').text();
					rooms += "<div class=\"col-lg-6 mb-5\">";
					rooms+="<div class=\"card\">";
					rooms+="<figure class=\"snip1384\">";
					rooms+="<img src=\"image/"+num+"/05.jpg\" />";
					rooms+="<figcaption>";
					rooms+="<h3 id=\"roomname1\">"+name+" "+num+"호</h3>";
					rooms+="<p>";
					rooms+="<br><br>";
					rooms+="객실옵션 : 침대,욕실1,거실1,객실1,주방,야외테라스,야외스파<br>";
					rooms+="객실시설 : TV,무료와이파이,주방시설 및 요리기구,냉장고,전자레인지,헤어드라이기,개별냉난방<br><br>";
					rooms+="※ 객실에 대한 상세정보 및 예약안내는 클릭해주세요​";
					rooms+="</p>";
					rooms+="<i class=\"ion-ios-arrow-right\"></i>";
					rooms+="</figcaption>";
					rooms+="<a href=\"pension?cmd=ROOMINFO&roomnum="+num+"\"></a>";
					rooms+="</figure>";
					rooms+="<div class=\"card-body\">";
					rooms+="<h5 class=\"card-title\">"+name+"</h5>";
					rooms+="<p class=\"card-text\" id=\"roominfo1\">"+num+"호 "+type+"<br />	</p>";
					rooms+="<p class=\"card-text\">";
					rooms+="<small class=\"text-muted\" id=\"headcount1\">기준 "+person+"명, 최대 "+maxPerson+"명</small>";
					rooms+="</p>";
					rooms+="</div>";
					rooms+="</div>";
					rooms+="</div>";
					$('#div1').html(rooms)
				})
			},
			error : function(xhr){
				alert(xhr.status + " : " + xhr.statusText)
			}
		});
	});
</script>	
</head>
<body>

	<%@ include file="/view/header.jsp"%>
	<h1 style = "text-align: center;font-family: 'Last Ninja', Impact, fantasy;">ROOM</h1>
	<h3 style = "text-align: center;font-family: 'Last Ninja', Impact, fantasy;">Busan Emotional Stay</h3>
	<div class="container margin-for-nav py-5" id="rooms">
		<div class="row room-list">
			<div class="row row-cols-1 row-cols-md-3 g-4" id="div1">


			</div>
		</div>
	</div>


	<%@ include file="/view/bottom.jsp"%>

</html>