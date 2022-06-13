<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고객등록</title>
</head>
<body>
	<%
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String web = request.getParameter("web");
	String limit = request.getParameter("limit");
	
	// 1.변수선언
	String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
	String uid = "DB201830327";
	String upw = "201830327";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into customers values(?, ?, ?, ?, ?)";
	
	try{
		// 1. 드라이버 로드
		Class.forName("oracle.jdbc.OracleDriver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, address);
		pstmt.setString(4, web);
		pstmt.setString(5, limit);
		
		// 4. sql문 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect("join_success.jsp");
		} else{ // 실패
			response.sendRedirect("join_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>


</body>
</html>