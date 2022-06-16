<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
    
	String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
	String uid = "DB201830327";
	String upw = "201830327";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "delete from customers where customer_id = ?";
	
	try{
		// 드라이버 호출
		Class.forName("oracle.jdbc.OracleDriver");
		// conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		// sql 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			session.invalidate(); // 세션에 정보삭제
			response.sendRedirect("delete.html");			
		} else{ // 실패
			response.sendRedirect("login_welcome.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login_welcome.jsp");
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