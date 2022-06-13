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
	// 정보수정 화면으로 가기전에
	// 아이디 기준으로 회원정보를 조회해서 다음 화면으로 전달
	
	//<a href="shopping.jsp">주문 내역 확인</a><br/>
	
	String id = (String)session.getAttribute("customer_id");
	String find = request.getParameter("find");

    //DB연결에 필요한 변수 선언
	String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
	String uid = "DB201830327";
	String upw = "201830327";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from customers where customer_id = ?";
	
	try{
		// 드라이버 호출
		Class.forName("oracle.jdbc.OracleDriver");
		
		// conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, find);
		
		// sql실행
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			id = rs.getString("customer_id");
			String name = rs.getString("name");
			String address = rs.getString("address");
			String web = rs.getString("website");
			String limit = rs.getString("credit_limit");
			
			// 포워드로 전달하기 위해
			request.setAttribute("customer_id", id);
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("website", web);
			request.setAttribute("credit_limit", limit);
			
			// 포워드 이동
			request.getRequestDispatcher("update.jsp").forward(request, response);
			
		} else{ // 세션이 만료된 경우
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
