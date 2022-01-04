<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    
<%
	/* POST 방식 한글깨짐 방지목적 */
	request.setCharacterEncoding("UTF-8");	
	
	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@192.168.0.10:1521:xe";
	String user = "pension";
	String pwd = "project";
	String sql = "";
	
	Connection conn = DriverManager.getConnection(url,user,pwd);
	PreparedStatement pstmt = null;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>