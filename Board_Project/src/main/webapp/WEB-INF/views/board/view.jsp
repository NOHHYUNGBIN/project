<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel='stylesheet' />
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
	
	#cont {
		height: 300px;
	}
	
	.outer {
		text-align: center;
	}
	
	.inner {
		display: inline-block;
		text-align: left;
	}
	
	body {
		box-sizing: border-box;
	}
	
	a:hover {
		text-decoration: none;
		color: rec;
	}
	
	table {
		width: 800px;
		margin: 0 auto;
	}
	
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th, td {
		padding: 10px;
	}
	
	#menulist td {
		text-align: center;
	}
	
	.left {
		text-align: left;
	}
	
	.center {
		text-align: center;
	}
	
	.right {
		text-align: right;
	}
	
	.green {
		color: green;
	}
	
	.red {
		color: red;
	}
	.pagination {
		justify-content: center;
	}
	
	.pagination>a {
		color: orange;
	}
</style>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${sessionScope.login.userid != null}">
				<p style="float: right;">${ sessionScope.login.nickname }(${sessionScope.login.username})님
					| <a href="/logout">로그아웃</a>
				</p>
				<br>
			</c:when>
			<c:otherwise>
				<p style="float: right;">
					<a href="/login">로그인</a> | <a href="/registerform">회원가입</a>
				</p>
				<br>
			</c:otherwise>
		</c:choose>
		<hr>
		<h1 style="text-align: center;">${menu_name }게시판 게시물 조회</h1>
		<hr>
	</div>
	<div class="container">
		<table id="board">
			<tr>
				<td class="td1">번호</td>
				<td class="td2">${ view.idx }</td>
				<td class="td3">날짜</td>
				<td class="td4"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
						value="${view.regdate}" /></td>
			</tr>
			<tr>
				<td class="td1">글쓴이</td>
				<td class="td2">${ view.nickname }</td>
				<td class="td3">조회수</td>
				<td class="td4">${ view.readcount }</td>
			</tr>
			<tr>
				<td class="td1">제목</td>
				<td class="tdcol" colspan="3">${ view.title }</td>
			</tr>
			<tr>
				<td class="td1">내용</td>
				<td class="tdcol" colspan="3" id="cont">${ view.cont }</td>
			</tr>
			<tr>
				<td colspan="4">
				<c:if test="${ view.userid eq sessionScope.login.userid }">
					<input type="button" value="새글쓰기" id="btnWrite" /> 
					<input type="button" value="글 수정" id="btnUpdate" /> 
					<input type="button" value="글 삭제" id="btnDelete" /> 
				</c:if>
					<input type="button" value="글 목록" id="btnList" /></td>
					

			</tr>
		</table>
		<div id="listReply">
			<table style="width:800px">
				<c:if test="${empty replyList }">
					<tr>
						<td>댓글이 없습니다. 첫번째 댓글을 작성해보세요!</td>
					</tr>
				</c:if>
				<c:forEach var ="re" items= "${replyList }">
					<tr>
						<td>
						${re.nickname }(<fmt:formatDate value="${re.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
						<br>
						${re.cont }
						<c:if test="${ re.userid == sessionScope.login.userid }">
							<a href="javascript:void(0)" onclick="replyUpdate(${re.rno})">수정</a> |
							<a href="javascript:void(0)" onclick="replyDelete(${re.rno})">삭제</a>
						</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 페이지 -->
		<div class="page" style="text-align: center;">
			<nav aria-label="Page navigation example" class="page">
				<ul class="pagination" id="pagination">
					<c:if test="${paging.startPage != 1 }">
						<li class="page-item"><a class="page-link"
							href="/board/view?nowPage=1&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&idx=${view.idx}">처음</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="/board/view?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&idx=${view.idx}">이전</a>
						</li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<a class="page-link" href="#">${p }</a>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li class="page-item"><a class="page-link"
									href="/board/view?nowPage=${p }&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&idx=${view.idx}">${p }</a>
								</li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li class="page-item"><a class="page-link"
							href="/board/view?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&idx=${view.idx}">다음</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="/board/view?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}&menu_id=${menu_id}&menu_name=${menu_name}&idx=${view.idx}">마지막</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
		<div id ="reply" style="text-align: center;">
			<br>
			<c:choose>
				<c:when test="${sessionScope.login.userid != null }">
					<input type="hidden" name="idx" value="${view.idx }">
					<input type="hidden" name="userid" value="${login.userid}">
					<textarea rows="5" cols="80" name="cont" placeholder="댓글을 작성해 주세요."></textarea>
					<br>
					<button type="button" id="btnReply">댓글 작성</button>
				</c:when>
				<c:otherwise>
					<textarea rows="5" cols="80" id="" placeholder="로그인 후 작성할 수 있습니다." readonly></textarea>
					<br>
					<button type="button" id="replyLogin">로그인</button>
				</c:otherwise>
			</c:choose>
		</div>		
	</div>
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		//새글쓰기로 이동
		$(document).on('click','#btnWrite',function(){
			location.href = '/board/writeForm?menu_id=${menu_id}&menu_name=${menu_name}';
		});
		// 게시글목록으로 이동
		$(document).on('click','#btnList',function(){
			location.href = '/board/list?menu_id=${menu_id}&menu_name=${menu_name}';
		});
		//게시글수정으로 이동
		$(document).on('click','#btnUpdate',function(){
			location.href = '/board/updateForm?idx=${view.idx}&menu_id=${menu_id }&menu_name=${menu_name}';
		});
		//게시글 삭제로 이동
		$(document).on('click','#btnDelete',function(){
			var checkDelete = confirm("삭제하시겠습니까?");
			if(checkDelete) {
				location.href = '/board/delete?idx=${view.idx}&menu_id=${menu_id}&menu_name=${menu_name}';
			}
		});
		//로그인으로 이동
		$(document).on('click','#replyLogin',function(){
			location.href = '/login';
		});
	});
				
	////////// 리플관련버튼 ///////////	
	//댓글 작성
	 $('#btnReply').on('click',function() {
			var cont = $('[name=cont]').val();
			if(cont == "") {
				alert("내용을 입력해 주세요");
			}
			else {
				
				var params = { 
					idx : $('[name=idx]').val(),
					userid : $('[name=userid]').val(),
					cont : $('[name=cont]').val()};
				
				$.ajax({
					url: '/reply/insertReply',
					data: params,
					success: function() {
						alert("댓글이 등록되었습니다.");
						$('[name=cont]').val("");
						getReply();
					}
				}) //ajax end
			} // else end 댓글작성 end			
	 }); // event end
	 
	 //댓글 수정 클릭한 댓글만 수정할수도록 수정폼오픈.
	function replyUpdate(rno) {
		var idx = $('[name=idx]').val();
		$.ajax({
			url: "/reply/getReply",
			data : {idx: idx},
			success: function(replyList) {
				var sessionId = '<%=(String)session.getAttribute("userid")%>';
				var output = "<table>";
				if(replyList.length == 0) {
					output += "<tr>";
					output += "<td>"+'댓글이 없습니다. 첫번째 댓글을 작성해보세요!'+"</td>";
					output += "</tr>";
				} else {
					for(var i in replyList) {
						output += "<tr>";
						output += "<td>"+replyList[i].nickname;
						output += "("+changeDate(replyList[i].regdate)+")<br>";
						//수정을 클릭한 댓글만 수정가능하도록..
						if(replyList[i].rno == rno) {
							output += '<textarea id="editreply" name="editreply" style="width:600px">'+replyList[i].cont+'</textarea>';
							output += '<a href="javascript:void(0)" onclick="fn_updateReply('+replyList[i].rno+')">저장</a> | ';
							output += '<a href="javascript:void(0)" onclick="getReply()">취소<a>';	
						} else {	
							output += replyList[i].cont;
						}
						//로그인 된 아이디와 댓글 작성한 아이디와 같은글만 수정,삭제 버튼이 보이도록함.
						//수정을 클릭한 댓글이라면, 수정,삭제버튼이 안보이도록..
						if(sessionId == replyList[i].userid && replyList[i].rno != rno ) {
							output += ' <a href="javascript:void(0)" onclick="replyUpdate('+replyList[i].rno+')">수정</a> | ';
							output += '<a href="javascript:void(0)" onclick="replyDelete('+replyList[i].rno+')">삭제</a>';
						}
						output += '</td>';
						output += "</tr>";
					}
				}
				output += "</table>";
				$("#listReply").html(output);
				$("#editreply").focus();
			}					

		})
	}
	 
	 function fn_updateReply(rno) {
		 var cont = $('#editreply').val();
		 if(cont=="") {
			 alert("수정할 내용을 입력해주세요");
		 }
		 else {
			 $.ajax({
				 url: "/reply/updateReply",
				 data: {rno: rno,
					 	cont: cont},
				 success: function() {
					 alert('수정이 완료됐습니다');
					 getReply()
				 }
			 })
		 }
	 }
	 
	 function replyDelete(rno) {
		 var checkDelete = confirm("삭제 하시겠습니까?");
		 if(checkDelete) {
			 $.ajax({
				 url: "/reply/deleteReply",
				 data: {rno: rno},
				 success: function() {
					 alert('삭제가 완료됐습니다');
					 getReply()
				 }
			 })
		 }
	 }
	 	
	//댓글 리스트 가져오는 함수. 댓글등록,수정,삭제 할때마다 새로고침없이 바로 보여주기 위함.
	function getReply() {
		var idx = $('[name=idx]').val();
		$.ajax({
			url: "/reply/getReply",
			data: {idx:idx},
			success: function(replyList) {
				var sessionId = '<%=(String)session.getAttribute("userid")%>';
				var output = "<table>";
				if(replyList.length == 0) {
					output += "<tr>";
					output += "<td>"+'댓글이 없습니다. 첫번째 댓글을 작성해보세요!'+"</td>";
					output += "</tr>";
				} else {
					for(var i in replyList) {
						output += "<tr>";
						output += "<td>"+replyList[i].nickname;
						output += "("+changeDate(replyList[i].regdate)+")<br>";
						output += replyList[i].cont;
						//로그인 된 아이디와 댓글 작성한 아이디와 같은글만 수정,삭제 버튼이 보이도록함.
						if(sessionId == replyList[i].userid ) {
							output += ' <a href="javascript:void(0)" onclick="replyUpdate('+replyList[i].rno+')">수정</a> | ';
							output += '<a href="javascript:void(0)" onclick="replyDelete('+replyList[i].rno+')">삭제</a>';
						}
						output += '</td>';
						output += "</tr>";
					}
				}
				output += "</table>";
				$("#listReply").html(output);
			}
		}) //ajax end
	} // 댓글리스트 end
	//changeDate 함수
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth()+1;
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2))+" "+hour+":"+(("00"+minute.toString()).slice(-2))+":"+(("00"+second.toString()).slice(-2));
		return strDate;
		
	} //changeDate end
		

		
	</script>
</body>
</html>










