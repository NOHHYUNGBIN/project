<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div style="text-align: center">
	<h1>로그인</h1>
	<hr>
	<p><a href="/">Home</a></p>
	<form action="/loginProcess" method="post">
		<p>
			<label for="userid">아이디</label>
			<input type="text" id="userid" name="userid" required="required"/>
		</P>
		<p>
			<label for="password">비밀번호</label>
			<input type="password" id="userpass" name="userpass" required="required"/>
		</P>
		
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
		
		<button type="submit" id="submit">로그인</button>
		<p><a href="/registerform">회원가입</a></p>
	</form>
	</div>
</body>
</html>