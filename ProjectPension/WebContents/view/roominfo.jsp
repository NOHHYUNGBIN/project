<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  int roomNum = Integer.parseInt(request.getParameter("roomnum")); %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green Stay</title>
<style>
img {
	size: 80px;
}
</style>
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

</head>
<script>
	$(function(){
		$.ajax({
			url : '/getroominfo',
			data : { roomnum : <%=roomNum%> },
			success : function(xml){
				$(xml).find('room').each(function(index,room){
					var name = $(room).find('room_name').text();
					var num = $(room).find('room_num').text();
					var type = $(room).find('room_type').text();
					var person = $(room).find('room_person').text();
					var maxPerson = $(room).find('room_maxperson').text();
					var weekCost = $(room).find('room_week_cost').text().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					var weekendCost = $(room).find('room_weekend_cost').text().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					$('#roomtitle').text(name+" "+num)
					var personText = "- 기준 "+person+"명 | 최대 "+maxPerson+"명<br />- 기준 인원 초과 시 추가요금이 발생합니다.<br />- 해당 요금은기본요금으로, 기간별 정확한 요금은 실시간 예약창을 확인해 주세요.";
					$('#person').html(personText)
					$('#week').text(weekCost)
					$('#weekend').text(weekendCost)
				})
			},
			error : function(xhr){
				alert(xhr.status + ' : ' + xhr.statusText);
			}
		})
	});
</script>
<body>
	<%@ include file="/view/header.jsp"%>
	<div class="container">
		<h1
			style="text-align: center; font-family: 'Last Ninja', Impact, fantasy;">ROOM</h1>
		<h3
			id="roomtitle" style="text-align: center; font-family: 'Last Ninja', Impact, fantasy;"></h3>

		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="4" aria-label="Slide 5"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="5" aria-label="Slide 6"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="6" aria-label="Slide 7"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="7" aria-label="Slide 8"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="8" aria-label="Slide 9"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="9" aria-label="Slide 10"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="10" aria-label="Slide 11"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="11" aria-label="Slide 12"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="12" aria-label="Slide 13"></button>

	

			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="image/<%=roomNum%>/01.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/02.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/03.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/04.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/05.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/06.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/07.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/08.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/09.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/10.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/11.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/12.jpg"  class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="image/<%=roomNum%>/13.jpg"  class="d-block w-100" alt="...">
				</div>
		
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<div class="container">
		<h4>인원 및 추가요금</h4>
		<p class="pb-4" id="person">		
		</p>

		<div class="table-responsive">
			<table class="table border text-center mb-5" id="room-price-table">
				<thead class="bg-light">
					<tr>
						<th colspan="2">객실 기본요금</th>
						<th class="border-left">추가인원 요금</th>
					</tr>
					<tr>
						<th style="width: 35%">주중</th>
						<th style="width: 35%">주말(공휴일전날)</th>
						<th class="border-left" style="width: 30%">성인</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="week"></td>
						<td id="weekend"></td>
						<td class="border-left">20,000</td>
					</tr>
				</tbody>
			</table>
		</div>
		<h4>객실 내 시설</h4>
		<p class="pb-4">냉장고, 드라이기, 에어컨, 욕실용품, 커피포트, 타월, TV, 화장실</p>

		<a class="btn btn-primary px-4 mr-3" href="pension?cmd=ROOMCALENDAR&roomnum=<%=roomNum %>">실시간예약</a>
		<a class="btn btn-light px-4" onclick = "history.back()"><i
			class="fa fa-arrow-left mr-2"></i>다른객실 보기</a>
	</div>
	<div class="py-5"></div>

	<%@ include file="/view/bottom.jsp"%>


</body>


</html>