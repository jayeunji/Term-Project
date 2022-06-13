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
	/*
	1. 폼에서 넘어온 데이터를 각각 처리합니다.
	2. SQL문을 이용해서 DB에 업데이트 작업.
	3. executeUpdate() 성공시 1을 반환, 실패시 0을 반환
	4. 업데이트가 성공하면 세션에 저장된 이름을 변경한 후에
		update_success.jsp로 리다이렉트
		
	      업데이트에 실패하면, update_fail.jsp로 리다이렉트
	*/

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String web = request.getParameter("web");
	String limit = request.getParameter("limit");
	
    //DB연결에 필요한 변수 선언
	String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
	String uid = "DB201830327";
	String upw = "201830327";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "update customers set name = ?, address = ?, website = ?, credit_limit = ?" + "where customer_id = ?";
	
	try{
		// 드라이버 호출
		Class.forName("oracle.jdbc.OracleDriver");
		
		// conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, address);
		pstmt.setString(3, web);
		pstmt.setString(4, limit);
		pstmt.setString(5, id);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			session.setAttribute("name", name);
			response.sendRedirect("update_success.jsp");
		} else{
			response.sendRedirect("update_fail.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("update_fail.jsp");
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
