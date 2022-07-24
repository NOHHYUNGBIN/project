<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel='stylesheet' />
<title>게시판 목록</title>
</head>
<style>
	td>a {
		text-decoration: none;
		color: black;
	}
	
	#menuNav {
		padding-left: 30px;
		padding-right: 30px;
		margin-left: 30px;
		margin-right: 30px;
	}
	
	.menu {
		text-decoration: none;
		color: white;
	}
	
	a:hover {
		color: orange;
	}
	
	.pagination {
		justify-content: center;
	}
	
	.pagination>a {
		color: orange;
	}
</style>

<body>
	<div class="container">
	
		<c:choose>
			<c:when test="${sessionScope.login.userid != null}">
				<p style="float: right;">
				<a href="/">홈으로</a> | <a href="/useredit?userid=${sessionScope.login.userid}">${ sessionScope.login.nickname }(${sessionScope.login.username})님</a> | <a href="/logout">로그아웃</a>
				</p>
				<br />
			</c:when>
			<c:otherwise>
				<p style="float: right;">
					<a href="/">홈으로</a> | <a href="/login">로그인</a> | <a href="/registerform">회원가입</a>
				</p>
				<br />
			</c:otherwise>
		</c:choose>
		<hr>
		<h1 style="text-align: center;">${ menu_name }게시판</h1>
		<hr>
	</div>
	<div class="container">
		<%@ include file="/WEB-INF/include/menulist.jsp"%>
		<table class="table table-hover" style="text-align: center;">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ viewAll }" var="board">
					<tr>
						<td>${board.idx }</td>
						<td><a href="view?idx=${board.idx }&menu_id=${menu_id}&menu_name=${menu_name}">${board.title }</a>
						<c:if test="${board.replycnt > 0}">
							<span style="color: red;">(${board.replycnt })</span>
						</c:if>
						</td>
						<td>${board.nickname }</td>
						<td><fmt:formatDate value="${board.regdate }" pattern="yyyy.MM.dd" /></td>
						<td>${board.readcount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="float: left;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
					보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
		<form name="form1" method="post" action="/board/list?menu_id=${menu_id}&menu_name=${menu_name}" style="float: right;">
			<select name="search_option">
		        <option value="nickname" <c:if test="${search_option == 'nickname'}">selected</c:if>>작성자</option>		
		        <option value="title" <c:if test="${search_option == 'title'}">selected</c:if>>제목</option>
		        <option value="cont" <c:if test="${search_option == 'cont'}">selected</c:if>>내용</option>
		        <option value="all" <c:if test="${search_option == 'all'}">selected</c:if>>작성자+내용+제목</option>
		    </select>
		    <input name="keyword" value="${keyword}">
		    <input type="submit" value="조회">
		</form><br><br>
		<input type="button" value="글쓰기" style="float: right;"
			onclick="location.href='writeForm?menu_id=${menu_id}&menu_name=${menu_name}'"><br><br>
		<!-- 옵션선택 끝 -->
		<!-- 페이지 -->
		<div class="page" style="text-align: center;">
			<nav aria-label="Page navigation example" class="page">
				<ul class="pagination">
					<c:if test="${paging.startPage != 1 }">
						<li class="page-item"><a class="page-link"
							href="/board/list?nowPage=1&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&search_option=${search_option}&keyword=${keyword}">처음</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="/board/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&search_option=${search_option}&keyword=${keyword}">이전</a>
						</li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<a class="page-link" href="#">${p }</a>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li class="page-item"><a class="page-link"
									href="/board/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&search_option=${search_option}&keyword=${keyword}">${p }</a>
								</li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li class="page-item"><a class="page-link"
							href="/board/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&search_option=${search_option}&keyword=${keyword}">다음</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="/board/list?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&search_option=${search_option}&keyword=${keyword}">마지막</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href = "list?nowPage=${paging.nowPage}&cntPerPage=" + sel
					+ "&menu_id=${menu_id}&menu_name=${menu_name}&search_option=${search_option}&keyword=${keyword}";
		}
	</script>
</body>
</html>