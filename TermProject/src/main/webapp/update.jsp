<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// 이전화면에서 전달받은 데이터를 받습니다.
	// 화면에 미리 보여지도록 처리를 하세요~

	String id = (String)request.getAttribute("customer_id");
	String name = (String)request.getAttribute("name");
	String address = (String)request.getAttribute("address");
	String web = (String)request.getAttribute("website");
	String limit = (String)request.getAttribute("credit_limit");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>정보 수정페이지</h2>
	
	<form action="update_ok.jsp" method="post">
		아이디:<input type="text" name="id" value="<%=id %>" readonly><br/>
		이름:<input type="text" name="name" value="<%=name %>"><br/>
		주소:<input type="text" name="address" value="<%=address %>"><br/>
		웹사이트:<input type="text" name="web" value="<%=web %>"><br/>
		거래한도:<input type="text" name="limit" value="<%=limit %>"><br/>
		
		<input type="submit" value="수정">
	</form>

</body>
</html>
