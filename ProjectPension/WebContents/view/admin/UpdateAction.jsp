<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "DBConnection.jsp"%>

<% //넘어온 값 저장
	request.setCharacterEncoding("UTF-8");

	int room_code = Integer.parseInt(request.getParameter("room_code"));
	String room_name = request.getParameter("room_name");
	int room_num = Integer.parseInt(request.getParameter("room_num"));
	String room_type = request.getParameter("room_type");
	int room_person = Integer.parseInt(request.getParameter("room_person"));
	int room_maxperson = Integer.parseInt(request.getParameter("room_maxperson"));
	int room_week_cost = Integer.parseInt(request.getParameter("room_week_cost"));
	int room_weekend_cost = Integer.parseInt(request.getParameter("room_weekend_cost"));

	
	sql = "update room set room_name = ? , room_num = ? , room_type = ?, room_person = ?, room_maxperson = ?, room_week_cost = ?, room_weekend_cost = ? ";
	sql+= "where room_code = ? ";  
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, room_name);
	pstmt.setInt(2, room_num);
	pstmt.setString(3, room_type);
	pstmt.setInt(4, room_person);
	pstmt.setInt(5, room_maxperson);
	pstmt.setInt(6, room_week_cost);
	pstmt.setInt(7, room_weekend_cost);
	pstmt.setInt(8, room_code);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	String tourl = "./admin_roomchange.jsp";
	
	response.sendRedirect(tourl);

%>	












