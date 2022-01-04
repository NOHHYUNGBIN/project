<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "DBConnection.jsp"%>

<% //넘어온 값 저장
	request.setCharacterEncoding("UTF-8");

	int res_num = Integer.parseInt(request.getParameter("res_num"));

	
	sql = "update reserve set checked = 1 ";
	sql+= "where res_num = ? ";  
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, res_num);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	String tourl = "./admin_resagree.jsp";
	
	response.sendRedirect(tourl);

%>	












