<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<meta charset="EUC-KR">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OT사</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
</head>
<body>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="OT_main.jsp">OT사</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="OT_main.jsp">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="All_order_list.jsp"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> 판매 / 재고 관리 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="canceled_list.jsp">
									취소된 상품 목록 </a></li>
							<li><a class="dropdown-item" href="pending_list.jsp">
									보류중인 상품 목록 </a></li>
							<li><a class="dropdown-item" href="shipped_list.jsp">
									배송된 상품 목록 </a></li>

							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="total_sales.jsp"> 판매된
									상품 가격 목록 </a></li>
							<li><a class="dropdown-item" href="take.jsp"> 총 판매 금액
									(매출)</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 고객 관리 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="find.jsp">고객 검색</a></li>
							<li><a class="dropdown-item" href="join.jsp">고객 등록</a></li>
						</ul></li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div class="text-end">
					<button type="button" class="btn btn-light"
						onclick="location.href='logout.jsp'">Logout</button>
				</div>
			</div>
		</div>
	</nav>
	<br/>
 	<h1> &emsp; &emsp; OT 대표 상품  </h1>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="card" style="width: 15">
					<img
						src="https://i.ibb.co/2vNQgRq/1.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Intel Xeon E5-2699 V3 (OEM/Tray)</h5>
						<p class="card-text">Speed:2.3GHz, Cores:18, TDP:145W</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 15">
					<img
						src="https://i.ibb.co/02PCtPv/2.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">EVGA 12G-P4-3992-KR</h5>
						<p class="card-text">Chipset:GeForce GTX Titan Z, Memory:12GBCore Clock:732MHz</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 15">
					<img
						src="https://i.ibb.co/X3t4SMd/3.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">PNY VCQP5000-PB</h5>
						<p class="card-text">Chipset:Quadro P5000, Memory:16GBCore Clock:1.61GHz</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 15">
					<img
						src="https://i.ibb.co/MNrQx5S/4.jpg"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Zotac ZT-P10810A-10P</h5>
						<p class="card-text">Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.48GHz</p>
					</div>
				</div>
			</div>
		</div> 
	</div>
	<br/>
	<h1>  &emsp;  &emsp;  주요 메뉴 </h1> <br/> 
                &emsp;  &emsp; &emsp; &emsp;  &emsp; <a href="All_order_list.jsp""><button class="custom-btn btn-16"> 모든 주문 내역 </button></a> 
                &emsp;  &emsp; <a href="take.jsp"><button class="custom-btn btn-16"> 총 매출액 </button></a>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>

</body>
</html>