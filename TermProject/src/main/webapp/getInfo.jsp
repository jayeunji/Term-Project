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

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.95:1521:xe", "DB201830327", "201830327");

	PreparedStatement pst = conn.prepareStatement("select * from customers where customer_id = ?");
	pst.setString(1, id);
	ResultSet rs = pst.executeQuery();

	if (rs.next()) {
		id = rs.getString("customer_id");
		String name = rs.getString("name");
		String address = rs.getString("address");
		String web = rs.getString("website");
		String limit = rs.getString("credit_limit");

		request.setAttribute("customer_id", id);
		request.setAttribute("name", name);
		request.setAttribute("address", address);
		request.setAttribute("website", web);
		request.setAttribute("credit_limit", limit);

		// 포워드 이동
		request.getRequestDispatcher("update.jsp").forward(request, response);

	}
	rs.close();
	pst.close();
	conn.close();
	%>

</body>
</html>
