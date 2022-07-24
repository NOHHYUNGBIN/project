<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8" />

<!-- 메뉴 목록 -->
<nav class="navbar navbar-dark bg-dark" id="menuNav">
   <button class="btn btn-outline-success me-2" type="button">
		<a class="menu" href="/board/list?menu_id=0&menu_name=전체">전체</a> 
	</button>
		<c:forEach var="menu" items="${ menuList }">
		<button class="btn btn-sm btn-outline-secondary" type="button">
			<a class="menu" href="/board/list?menu_id=${ menu.menu_id }&menu_name=${ menu.menu_name }"> 
			${ menu.menu_name }
			</a>
			</button>
		</c:forEach>
</nav>