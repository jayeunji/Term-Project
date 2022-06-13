<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����</title>
</head>
<body>
	<%
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String web = request.getParameter("web");
	String limit = request.getParameter("limit");
	
	// 1.��������
	String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
	String uid = "DB201830327";
	String upw = "201830327";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into customers values(?, ?, ?, ?, ?)";
	
	try{
		// 1. ����̹� �ε�
		Class.forName("oracle.jdbc.OracleDriver");
		
		// 2. conn ����
		conn = DriverManager.getConnection(url, uid, upw);
		
		// 3. pstmt ����
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, address);
		pstmt.setString(4, web);
		pstmt.setString(5, limit);
		
		// 4. sql�� ����
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // ����
			response.sendRedirect("join_success.jsp");
		} else{ // ����
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