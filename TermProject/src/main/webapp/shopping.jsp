<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문 내역 조회</title>
</head>
<body>
<h1>주문 내역</h1>
<table border = 1>
		<tr>
			<th>주문 번호</th>
			<th>상품명</th>
			<th>수량</th>
		</tr>
		
		<%
		String id = (String)session.getAttribute("customer_id");

		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.95:1521:xe", "DB201830327", "201830327");
		
		String sql = "select * from customers natural join orders natural join order_items natural join products where customer_id = ? order by order_id";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, id);
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("order_id")%></td>
			<td><%=rs.getString("product_name")%></td>
			<td><%=rs.getString("quantity")%></td>
		</tr>
			<%
			}
			rs.close();
			pst.close();
			conn.close();
			%>


</table>
<a href="login_welcome.jsp">뒤로가기</a><br/>
</body>
</html>