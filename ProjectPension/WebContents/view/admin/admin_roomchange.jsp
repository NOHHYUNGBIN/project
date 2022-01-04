<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="DBConnection.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
<style>
table, tr, td {
	text-align: center;
	border: 1px solid black;
}
a{
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="main" style="text-align: center;">
		<div class="nav" style="text-align: center;">
			<nav class="navbar navbar-light bg-light" style="text-align: center;">
				<form class="container-fluid justify-content-start">
					<button class="btn btn-sm btn-outline-secondary" type="button">
						<a href="./admin_reswait.jsp" style="color: black;">예약대기목록</a>
					</button>
					<button class="btn btn-sm btn-outline-secondary" type="button">
						<a href="./admin_resagree.jsp" style="color: black;">예약확정목록</a>
					</button>
					<button class="btn btn-sm btn-outline-secondary" type="button">
						<a href="./admin_rescancel.jsp" style="color: black;">예약취소목록</a>
					</button>
					<button class="btn btn-sm btn-outline-secondary" type="button">
						<a href="./admin_roomchange.jsp" style="color: black;">객실수정</a>
					</button>
					<button class="btn btn-sm btn-outline-secondary" type="button">
						<a href="/main.jsp" style="color: black;">펜션메인</a>
					</button>
				</form>
			</nav>
		</div>
	</div>

	<div class="container">
		<div class="content">
			<h2>객실리스트</h2>
			<h3 style="text-align: center">수정하려는 객실코드를 클릭하세요~~!</h3>
			<table>
				<thead>
					<tr>
						<th>객실코드</th>
						<th>객실이름</th>
						<th>객실호수</th>
						<th>객실타입</th>
						<th>기준인원수</th>
						<th>최대인원수</th>
						<th>주중가격</th>
						<th>주말가격</th>
				</thead>
				<tbody>
				<% // 객실 list 가져오기
					sql = "select * from room";
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()) { 
					
				%>
					<tr> 
						<td>
							<a href="./updateroom.jsp?room_code=<%=rs.getInt("room_code") %>">
							<%=rs.getInt("room_code")%>
							</a>
						</td>
						<td><%=rs.getString("room_name") %></td>
							<td><%=rs.getInt("room_num") %></td>
						<td><%=rs.getString("room_type") %></td>
						<td><%=rs.getInt("room_person") %></td>
						<td><%=rs.getInt("room_maxperson") %></td>
						<td><%=rs.getInt("room_week_cost") %></td>
						<td><%=rs.getInt("room_weekend_cost") %></td>
					</tr>
					<%  }
						rs.close();
						pstmt.close();
						conn.close();
					 %>

				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
