<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// ����ȭ�鿡�� ���޹��� �����͸� �޽��ϴ�.
	// ȭ�鿡 �̸� ���������� ó���� �ϼ���~

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

	<h2>���� ����������</h2>
	
	<form action="update_ok.jsp" method="post">
		���̵�:<input type="text" name="id" value="<%=id %>" readonly><br/>
		�̸�:<input type="text" name="name" value="<%=name %>"><br/>
		�ּ�:<input type="text" name="address" value="<%=address %>"><br/>
		������Ʈ:<input type="text" name="web" value="<%=web %>"><br/>
		�ŷ��ѵ�:<input type="text" name="limit" value="<%=limit %>"><br/>
		
		<input type="submit" value="����">
	</form>

</body>
</html>
