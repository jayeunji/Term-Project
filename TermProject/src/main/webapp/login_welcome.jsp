<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("employee_id");
	String first = (String)session.getAttribute("first_name");
	String last = (String)session.getAttribute("last_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%=id %>(<%=first %> <%=last %>)�� �ȳ��ϼ���!
	<a href="logout.jsp">�α׾ƿ�</a><br/>
	<a href="getInfo.jsp">���� ����</a><br/>
	<a href="shopping.jsp">�ֹ� ���� Ȯ��</a><br/>
	<a href="delete_ok.jsp">ȸ��Ż��</a><br/>

</body>
</html>