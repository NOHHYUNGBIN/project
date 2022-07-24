<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel='stylesheet' />
<title>게시물 수정</title>
<style>
	.td1 {
		width: 200px;
		text-align: center;
	}
	
	.td2 {
		width: 200px;
		text-align: left;
	}
	
	.td3 {
		width: 200px;
		text-align: center;
	}
	
	.td4 {
		width: 200px;
		text-align: left;
	}
	
	.tdcol {
		width: 600px;
		text-align: left;
	}
	
	textarea {
		height: 300px;
		width: 600px;
	}
	
	.outer {
		text-align: center;
	}
	
	.inner {
		display: inline-block;
		text-align: left;
	}
   body      {  box-sizing: border-box; }
   a         {  text-decoration:none; color:black;  }
   a:hover   {  text-decoration:none; color:rec;  }
   
   table         {  width:800px; margin:0 auto; }
   table, th, td {  border:1px solid black;
            border-collapse: collapse;
   }
   th, td            { padding:10px; }
   
   #menulist td { text-align: center; }
   .left        { text-align : left;  }
   .center      { text-align : center;  }
   .right       { text-align : right;  }
   
   .green       { color: green;  }
   .red       { color: red; }

</style>

</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${sessionScope.login.userid != null}">
				<p style="float: right;">${ sessionScope.login.nickname }(${sessionScope.login.username})님
					| <a href="/logout">로그아웃</a>
				</p>
				<br />
			</c:when>
			<c:otherwise>
				<p style="float: right;">
					<a href="/login">로그인</a> | <a href="/registerform">회원가입</a>
				</p>
				<br />
			</c:otherwise>
		</c:choose>
		<hr>
		<h1 style="text-align: center;">게시물 수정</h1>
		<hr>
	</div>
	<form action="/board/update" method="POST">
		<input type="hidden" name="idx" value="${ update.idx }" />
		<input type="hidden" name="menu_id" value="${ menu_id }" />
		<input type="hidden" name="menu_name" value="${ menu_name }" />
		<table>
			<tr>
				<td class="td1">번호</td>
				<td class="td2">${ update.idx }</td>
				<td class="td3">날짜</td>
				<td class="td4"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
						value="${update.regdate}" /></td>
			</tr>
			<tr>
				<td class="td1">글쓴이</td>
				<td class="td2">${ update.nickname }</td>
				<td class="td3">조회수</td>
				<td class="td4">${ update.readcount }</td>
			</tr>
			<tr>
				<td class="td1">제목</td>
				<td class="tdcol" colspan="3">
				<input type="text" name="title" value="${ update.title }"/></td>
			</tr>
			<tr>
				<td class="td1">내용</td>
				<td class="tdcol" colspan="4" id="content">
				<textarea name="cont">${ update.cont }</textarea></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="수정" /> <input
					type="button" value="취소" id="btnCancel" /></td>
			</tr>
		</table>
	</form>
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('form').on('submit', function() {
				if ($('[name=title]').val().trim() == '') {
					alert("제목을 입력하세요.")
					return false;
				}
				if ($('[name=cont]').val().trim() == '') {
					alert("내용을 입력하세요.")
					return false;
				}
				return true;
			})
			$('#btnCancel').on('click', function() {
				location.href = 'javascript:history.back()';
			});
		})
	</script>
</body>
</html>










