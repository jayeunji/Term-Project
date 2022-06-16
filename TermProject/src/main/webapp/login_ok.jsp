<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �α���</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

    // DB���ῡ �ʿ��� ���� ����
	String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
	String uid = "DB201830327";
	String upw = "201830327";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from employees where employee_id = ? and passwd = ?";
	
	try{
		// ����̹� ȣ��
		Class.forName("oracle.jdbc.OracleDriver");
		
		// conn ����
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt ����
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		// sql����
		rs = pstmt.executeQuery();
		
		if(rs.next()){ // �α��� ����(������ ���� session)
			id = rs.getString("employee_id");
			String first = rs.getString("first_name");
			String last = rs.getString("last_name");
		
			session.setAttribute("employee_id", id);
			session.setAttribute("first_name", first);
			session.setAttribute("last_name", last);
			
			response.sendRedirect("OT_main.html"); // �������̵�
			
		} else{ // �α��� ����
			response.sendRedirect("login_fail.jsp"); // ���� ������
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login_ok.jsp"); // ������ �� ��쵵 �����̷�Ʈ
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
 %>

</body>
</html>