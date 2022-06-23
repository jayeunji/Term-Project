<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title> ��۵� ��ǰ ��� </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="OT_main.jsp">OT��</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="OT_main.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="All_order_list.jsp" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           �Ǹ� / ��� ����
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="canceled_list.jsp"> ��ҵ� ��ǰ ��� </a></li>
            <li><a class="dropdown-item" href="pending_list.jsp"> �������� ��ǰ ��� </a></li>
            <li><a class="dropdown-item" href="shipped_list.jsp"> ��۵� ��ǰ ��� </a></li>
            
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="total_sales.jsp"> �Ǹŵ� ��ǰ ���� ��� </a></li>
            <li><a class="dropdown-item" href="take.jsp"> �� �Ǹ� �ݾ� (����)</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            �� ����
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="find.jsp">�� �˻�</a></li>
            <li><a class="dropdown-item" href="join.jsp">�� ���</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      <div class="text-end">
					<button type="button" class="btn btn-light"
						onclick="location.href='logout.jsp'">Logout</button>
				</div>
    </div>
  </div>
</nav>

<h1> ��۵� ��ǰ ��� </h1>
<br>
		
<a href="All_order_list.jsp"> ��� �ֹ� ���� �������� </a> <br> <br>

<table class="table table-bordered">

<tr><th> �ֹ� ��ȣ <th> �� ��ȣ <th> ǰ�� ��ȣ <th> �ֹ� ����</th></tr>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe","DB201813084","201813084");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from orders natural join order_items where status = 'Shipped'");
	
	while (rs.next()){
		%> <tr> <td> <%=rs.getInt("order_id") %>
		<td> <%=rs.getInt("customer_id") %>
		<td> <%=rs.getInt("product_id") %>
		<td> <%=rs.getInt("quantity") %>

<% 		
	}

	rs.close();
	st.close();
	conn.close();
		
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</body>
</html>