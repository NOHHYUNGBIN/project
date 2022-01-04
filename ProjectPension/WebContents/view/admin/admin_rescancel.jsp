<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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

a {
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
			<h2>예약취소목록</h2>
			<table>
				<thead>
					<tr>
						<th>예약번호</th>
						<th>예약객실호수</th>
						<th>예약객실명</th>
						<th>예약자이름</th>
						<th>폰번호</th>
						<th>추가인원수</th>
						<th>입실일</th>
						<th>퇴실일</th>
						<th>총결제금액</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<%
					// 예약대기 list 가져오기
					sql = "select v.res_num,r.room_num,r.room_name,c.cust_name,";
					sql += "c.tel,v.headcount,to_char(v.in_date,'yyyy-mm-dd')in_date,";
					sql += "to_char(v.out_date,'yyyy-mm-dd')out_date,v.cost,v.checked ";
					sql += "from reserve v left join room r ";
					sql += "on v.room_code = r.room_code ";
					sql += "left join customer c ";
					sql += "on v.cust_num = c.cust_num ";
					sql += "where v.checked in(2,3) ";
					sql += "order by in_date ";

					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();

					while (rs.next()) {
						String check = Integer.toString(rs.getInt("checked"));

						switch (check) {
						case "0":
							check = "입금대기";
							break;
						case "1":
							check = "예약확정";
							break;
						case "2":
							check = "입금전취소";
							break;
						case "3":
							check = "입금후취소";
							break;
						default:
							check = "알수없음";
							break;
						}
					%>
					<tr>
						<td><%=rs.getInt("res_num")%></td>
						<td><%=rs.getInt("room_num")%></td>
						<td><%=rs.getString("room_name")%></td>
						<td><%=rs.getString("cust_name")%></td>
						<td><%=rs.getString("tel")%></td>
						<td><%=rs.getInt("headcount")%></td>
						<td><%=rs.getString("in_date")%></td>
						<td><%=rs.getString("out_date")%></td>
						<td><%=rs.getInt("cost")%></td>
						<td><%=check%></td>
					</tr>
					<%
					}
					rs.close();
					pstmt.close();
					conn.close();
					%>

				</tbody>
			</table>
			<div class="btn_group" style="text-align: center">
				<button type="button" onclick="history.back()">뒤로가기</button>
			</div>
		</div>
	</div>
</body>
</html>












