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
	// �������� ȭ������ ��������
	// ���̵� �������� ȸ�������� ��ȸ�ؼ� ���� ȭ������ ����
	
	//<a href="shopping.jsp">�ֹ� ���� Ȯ��</a><br/>
	
	String id = (String)session.getAttribute("customer_id");
	String find = request.getParameter("find");

    //DB���ῡ �ʿ��� ���� ����
	String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
	String uid = "DB201830327";
	String upw = "201830327";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from customers where customer_id = ?";
	
	try{
		// ����̹� ȣ��
		Class.forName("oracle.jdbc.OracleDriver");
		
		// conn ����
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt ����
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, find);
		
		// sql����
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			id = rs.getString("customer_id");
			String name = rs.getString("name");
			String address = rs.getString("address");
			String web = rs.getString("website");
			String limit = rs.getString("credit_limit");
			
			// ������� �����ϱ� ����
			request.setAttribute("customer_id", id);
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("website", web);
			request.setAttribute("credit_limit", limit);
			
			// ������ �̵�
			request.getRequestDispatcher("update.jsp").forward(request, response);
			
		} else{ // ������ ����� ���
			response.sendRedirect("login.jsp");
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login.jsp");
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
