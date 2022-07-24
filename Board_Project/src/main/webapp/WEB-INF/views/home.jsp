<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css"/>"rel='stylesheet' />
<style>
	#menuNav {
		padding-left:30px;
		padding-right:30px;
	    margin-left:30px;
  		margin-right:30px;
	}
	.menu {
		text-decoration: none;
		color: white;
	}
	a:hover {
		color: orange;
	}
</style>
<title>Home</title>

</head>
<body>
	<div class="container">
	<h1 style="text-align: center; background-color: black; color: white;">지역별 낚시 조과 공유 커뮤니티</h1>
	<div id="container" style="margin: 100px; text-align: center;" >	
		<a href="/board/list?menu_id=0&menu_name=전체">전체게시판</a>
		<br>
	<c:choose>
		<c:when test="${sessionScope.login.userid != null}">
			${ sessionScope.login.nickname }(${sessionScope.login.username})님 환영합니다.<br />
			<a href="/logout">로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href="/login">로그인</a><br/>
		</c:otherwise>
	</c:choose>	
	</div>
	</div>
</body>
</html>
