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

	<%=id %>(<%=first %> <%=last %>)님 안녕하세요!<br/>
	<a href="OT_main.html">메인</a><br/>
	<a href="logout.jsp">로그아웃</a><br/>
	
	<a href="delete_ok.jsp">회원탈퇴</a><br/>

</body>
</html>