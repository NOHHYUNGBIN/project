<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
window.onload = function() {
	var adminLogin = document.getElementById("adminLogin");
	adminLogin.onclick = function() {
		let html = 'view/admin/login.jsp';
		let name = 'adminLogin';
		let  features  = 'height=550,width=700,top=100,left=100';
		window.open(html,name,features);
	}
}
</script>
<div>
	<nav class="reserve">
		<input type ="button" id ="adminLogin" value="관리자전용">
	</nav>
</div>
