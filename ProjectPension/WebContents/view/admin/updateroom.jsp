<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "DBConnection.jsp"%>
	
<% // 회원번호 가져오기
	request.setCharacterEncoding("UTF-8");
	int room_code = Integer.parseInt(request.getParameter("room_code"));
	
	sql = "select * from room where room_code = ? ";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,room_code);
	
	String room_name = "";
	int room_num = 0;
	String room_type = "";
	int room_person = 0;
	int room_maxperson = 0;
	int room_week_cost = 0;
	int room_weekend_cost = 0;

	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		room_name = rs.getString("room_name");
		room_num = rs.getInt("room_num");
		room_type = rs.getString("room_type");
		room_person = rs.getInt("room_person");
		room_maxperson = rs.getInt("room_maxperson");
		room_week_cost = rs.getInt("room_week_cost");
		room_weekend_cost = rs.getInt("room_weekend_cost");
		
	}
	rs.close();
	pstmt.close();
	conn.close();
%>
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
			<form action = "./UpdateAction.jsp" method = "POST">
				<h2>객실수정화면</h2>
				<table>
					<colgroup>
						<col width="40%">
						<col width="60%">
					</colgroup>
					<tbody>
						<tr>
							<th>객실코드</th>
							<td><input type = "text" name = "room_code" value = "<%=room_code %>"readonly /></td>
						</tr>
						<tr>
							<th>객실이름</th>
							<td><input type = "text" name = "room_name" value = "<%=room_name %>" /></td>
						</tr>
						<tr>
							<th>객실호수</th>
							<td><input type = "number" name = "room_num" value = "<%=room_num %>" /></td>
						</tr>
						<tr>
							<th>객실타입</th>
							<td><input type = "text" name ="room_type" value = "<%=room_type %>"/></td>
						</tr>
						<tr>
							<th>기준인원</th>
							<td><input type = "number" name ="room_person" value = "<%=room_person %>"/></td>
						</tr>
						<tr>
							<th>최대인원</th>
							<td><input type = "number" name ="room_maxperson" value = "<%=room_maxperson %>"/></td>
						</tr>
						<tr>
							<th>주중가격</th>
							<td><input type = "number" name ="room_week_cost" value = "<%=room_week_cost %>"/></td>
						</tr>
						<tr>
							<th>주말가격</th>
							<td><input type = "number" name ="room_weekend_cost" value = "<%=room_weekend_cost %>"/></td>
						</tr>
							
					</tbody>
				</table>
				<div class = "btn_group" style="text-align: center">
					<button type = "submit">수정</button>
					<button type = "button" onclick = "history.back()">취소</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>












