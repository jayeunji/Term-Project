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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�� ����</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="OT_main.html">OT��</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="OT_main.html">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="All_order_list.jsp"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> �Ǹ� / ��� ���� </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="canceled_list.jsp">
									��ҵ� ��ǰ ��� </a></li>
							<li><a class="dropdown-item" href="pending_list.jsp">
									�������� ��ǰ ��� </a></li>
							<li><a class="dropdown-item" href="shipped_list.jsp">
									��۵� ��ǰ ��� </a></li>

							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="total_sales.jsp"> �Ǹŵ�
									��ǰ ���� ��� </a></li>
							<li><a class="dropdown-item" href="take.jsp"> �� �Ǹ� �ݾ�
									(����)</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> �� ���� </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="find.html">�� �˻�</a></li>
							<li><a class="dropdown-item" href="join.jsp">�� ���</a></li>
						</ul></li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div class="text-end">
					<button type="button" class="btn btn-light"
						onclick="location.href='login.jsp'">Login</button>
				</div>
			</div>
		</div>
	</nav>
	
<form  action="update_ok.jsp" method="post">
	<div class="d-flex flex-column">
	<div class="p-2">
	<br/><h2>���� ����</h2>
	</div>
	
	<div class="p-2">
		ID
  		<input type="text" name="id" value="<%=id %>" style="width:300px" class="form-control" aria-describedby="basic-addon1" readonly>
	</div>
		<div class="p-2">
		name
  		<input type="text" name="name" value="<%=name %>" style="width:300px" class="form-control" placeholder="name"aria-describedby="basic-addon1">
	</div>
		<div class="p-2">
		address
  		<input type="text" name="address" value="<%=address %>" style="width:300px" class="form-control" placeholder="address" aria-describedby="basic-addon1">
	</div>
		<div class="p-2">
		website
  		<input type="text" name="web" value="<%=web %>" style="width:300px" class="form-control" placeholder="website" aria-describedby="basic-addon1">
	</div>
		<div class="p-2">
		credit limit
  		<input type="text" name="limit" value="<%=limit %>" style="width:300px" class="form-control" placeholder="credit limit" aria-describedby="basic-addon1">
	</div>
	<div class="p-2">
	<button type="submit" class="btn btn-primary">����</button>
	</div>
	</div>
</form>
	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>
