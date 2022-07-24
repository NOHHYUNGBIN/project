<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel='stylesheet' />

<style>
	#board .td1 {
		width: 180px;
		text-align: center;
	}
	
	#board .td2 {
		width: 620px;
		text-align: left;
	}
	
	#board [type=text] {
		width: 580px;
	}
	
	#board textarea {
		width: 580px;
		height: 300px;
	}
	
	body {
		box-sizing: border-box;
	}
	
	a {
		text-decoration: none;
		color: black;
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
		<h1 style="text-align: center;">${menu_name}게시판 게시물 등록</h1>
		<hr>
	</div>

	<form action="/board/write" method="POST" onsubmit="selChange()" enctype="multipart/form-data">
	<input type="hidden" name="userid" value="${sessionScope.login.userid }"  >
		<table id="board">
			<tr>
				<td class="td1">지역선택</td>
				<td class="td2">
			<select id="menu_id" name="menu_id">
				<c:forEach items="${menuList}" var="menu" >
					<option value="${menu.menu_id},${menu.menu_name}">
						${menu.menu_name}게시판</option>
				</c:forEach>
			</select>
				</td>
			</tr>
			
			<tr>
				<td class="td1">제목</td>
				<td class="td2"><input type="text" name="title" />
			</tr>
			<tr>
				<td class="td1">글쓴이</td>
				<td class="td2"><input type="text" value="${sessionScope.login.nickname }" readonly /></td>
			</tr>
			<tr>
				<td class="td1">내용</td>
				<td class="td2"><textarea name="cont"></textarea></td>
			</tr>
			<tr>
				<td class="td1">첨부파일</td>
				<td class="td2" id="tdfile">
					<input type="button" id="btnAddFile" value="Add File" />
					<input type="button" id="btnDelFile" value="Del File" /><br>
				<input type="file" name="upfile" id="upfile" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" id="submit" value="저장" /></td>
			</tr>
		</table>
	</form>	
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script>
	$( function() {
		  var num = 1;
		  $('#btnAddFile').on("click", function() {
			 if(num >= 5) {
				 alert('첨부파일은 5개까지만 등록 가능합니다.');
			 } else {
				 var  html   =  '<input type="file" ';
				 html       +=  ' name= "upfile' + num + '" ';
				 html       +=  ' id  = "upfile' + num + '" />';
				 $('#tdfile').append(html);
				 num++;
			 }
		  });
		  $('#btnDelFile').on("click", function() {
			if(num > 0) {
				if(num == 1) {
					return;
				} else {
					num = num - 1;
					$('#upfile'+num).remove();
				}
			} else {
				alert('기본 첨부파일은 삭제 할 수 없습니다.');
			}
		  });
	});
	
	//select에서 value값에 ","를 줬기때문에 메뉴아이디와 메뉴네임을 나누기 위해서..
	$("#submit").on("click", function() { 
		var titleCheck = $('[name=title]').val();
		var contCheck = $('[name=cont]').val();
		if(titleCheck == "") {
			event.preventDefault();
			alert("제목을 입력해주세요.");
			return false;
		} else if(contCheck == "") {
			event.preventDefault();
			alert("내용을 입력해주세요.");			
			return false;
		} else {
			event.preventDefault();
			var menulist = document.getElementById('menu_id').value;
			var menu = menulist.split(",");
			$('#menu_id').val("");
			var menu_id = menu[0];
			var menu_name = menu[1];
			var title = "("+menu_name+") " + $('[name=title]').val();
			var userid = $('[name=userid]').val();
			var cont = $('[name=cont]').val();
			location.href = "/board/write?menu_id="+menu_id+"&menu_name="+menu_name+"&title="+title+"&userid="+userid+"&cont="+cont;
		}
	})
</script>
</body>
</html>










