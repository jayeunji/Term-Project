<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 보류중인 상품 목록 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="OT_main.html">OT사</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="OT_main.html">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="All_order_list.jsp" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           판매 / 재고 관리
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="canceled_list.jsp"> 취소된 상품 목록 </a></li>
            <li><a class="dropdown-item" href="pending_list.jsp"> 보류중인 상품 목록 </a></li>
            <li><a class="dropdown-item" href="shipped_list.jsp"> 배송된 상품 목록 </a></li>
            
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="total_sales.jsp"> 판매된 상품 가격 목록 </a></li>
            <li><a class="dropdown-item" href="take.jsp"> 총 판매 금액 (매출)</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            고객 관리
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="find.html">고객 검색</a></li>
            <li><a class="dropdown-item" href="join.jsp">고객 등록</a></li>
            <li><a class="dropdown-item" href="#">고객 수정</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<h1> 보류중인 상품 목록 & 재고 </h1>
		
<a href="All_order_list.jsp"> 모든 주문 내역 보러가기 </a> <br> <br>

<a href="stock.jsp"> 주문 가능 상품의 재고 창고 위치 파악 </a> <br> <br>

<table class="table table-bordered">

<tr><th> 주문 번호 <th> 고객 번호 <th> 품목 번호 <th> 주문 수량 <th> 재고 수량 <th> 주문 가능 여부 </th></tr>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.94:1521:xe","DB201813084","201813084");
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from orders natural join order_items natural join inventories where status = 'Pending' order by order_id");

	
	while (rs.next()){
		
	      int order_quantity = rs.getInt("quantity");
	      int stock_quantity = rs.getInt("i_quantity");

		%>
		<tr> <td> <%=rs.getInt("order_id") %>
		<td> <%=rs.getInt("customer_id") %>
		<td> <%=rs.getInt("product_id") %>
		<td> <%=order_quantity %>
		<td> <%=stock_quantity %>

		<td style="background-color:MediumSeaGreen;"> <%
		if (order_quantity < stock_quantity) {
			out.print("주문 가능");
		}
		else {
			
			out.print("* "+ "주문 불가" + " *");
		}
		%>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg>

<% 		
	}

	rs.close();
	st.close();
	conn.close();
		
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</body>
</html>