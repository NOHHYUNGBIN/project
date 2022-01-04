<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp"%>

<%
// 예약번호 가져오기
request.setCharacterEncoding("UTF-8");
int res_num = Integer.parseInt(request.getParameter("res_num"));

sql = "select v.res_num,r.room_num,r.room_name,c.cust_name,";
sql += "c.tel,v.headcount,to_char(v.in_date,'yyyy-mm-dd')in_date,";
sql += "to_char(v.out_date,'yyyy-mm-dd')out_date,v.cost,v.checked ";
sql += "from reserve v left join room r ";
sql += "on v.room_code = r.room_code ";
sql += "left join customer c ";
sql += "on v.cust_num = c.cust_num ";
sql += "where v.res_num = ? ";

pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, res_num);

String room_name = "";
int room_num = 0;
String cust_name = "";
String tel = "";
int headcount = 0;
String in_date = "";
String out_date = "";
int cost = 0;
String check = "";

ResultSet rs = pstmt.executeQuery();

while (rs.next()) {
	room_name = rs.getString("room_name");
	room_num = rs.getInt("room_num");
	cust_name = rs.getString("cust_name");
	tel = rs.getString("tel");
	headcount = rs.getInt("headcount");
	in_date = rs.getString("in_date");
	out_date = rs.getString("out_date");
	cost = rs.getInt("cost");

	check = Integer.toString(rs.getInt("checked"));

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

a {
	text-decoration: none;
}
</style>
<script>
	window.onload = function() {
		var btnUpdate = document.getElementById('btnAgree');
		btnUpdate.onclick = function() {
			//예약확정실행	
			var url = './UpdateResAction.jsp?res_num=<%=res_num %>';
			location.href = url;
		}
		var btnCancel = document.getElementById('btnCancel');
		btnCancel.onclick = function() {
			//예약취소실행
			var url = './CancelResAction.jsp?res_num=<%=res_num %>';
			location.href = url;			
		}
	}
</script>
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
			<h2>예약상태 변경화면</h2>
			<table>
				<colgroup>
					<col width="40%">
					<col width="60%">
				</colgroup>
				<tbody>
					<tr>
						<th>예약번호</th>
						<td><input type="text" name="res_num" value="<%=res_num%>"
							readonly /></td>
					</tr>
					<tr>
						<th>예약객실호수</th>
						<td><input type="text" name="room_num" value="<%=room_num%>"
							readonly /></td>
					</tr>
					<tr>
						<th>예약객실명</th>
						<td><input type="text" name="room_name"
							value="<%=room_name%>" readonly /></td>
					</tr>
					<tr>
						<th>예약자이름</th>
						<td><input type="text" name="cust_name"
							value="<%=cust_name%>" readonly /></td>
					</tr>
					<tr>
						<th>폰번호</th>
						<td><input type="text" name="tel" value="<%=tel%>" readonly /></td>
					</tr>
					<tr>
						<th>추가인원수</th>
						<td><input type="text" name="headcount"
							value="<%=headcount%>" readonly /></td>
					</tr>
					<tr>
						<th>입실일</th>
						<td><input type="text" name="in_date" value="<%=in_date%>"
							readonly /></td>
					</tr>
					<tr>
						<th>퇴실일</th>
						<td><input type="text" name="out_date" value="<%=out_date%>"
							readonly /></td>
					</tr>
					<tr>
						<th>총결제금액</th>
						<td><input type="text" name="cost" value="<%=cost%>"
							readonly /></td>
					</tr>
					<tr>
						<th>상태</th>
						<td><input type="text" name="check" value="<%=check%>"
							readonly /></td>
					</tr>

				</tbody>
			</table>
			<div class="btn_group" style="text-align: center">
				<button id="btnAgree">예약확정</button>
				<button id="btnCancel">예약취소</button>
				<button type="button" onclick="history.back()">뒤로가기</button>
			</div>
		</div>
	</div>

</body>
</html>












