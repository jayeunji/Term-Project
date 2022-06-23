<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>직원용 로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
</head>
<body style="background-color:#E1E1E1">

	</br></br></br></br>
	<form action="j_security_check" method="post">
	<div class="d-flex flex-column">
	<div class="p-2">
	
	<center><h2>로그인</h2></center>
	</div>
		<div class="p-2">
		<center>
			<input type="text" id="id" name="j_username" style="width:300px" class="form-control"
				placeholder="ID"> </br>
		
		<input type="password" id="pw" name="j_password" style="width:300px" class="form-control"
				placeholder="password"></center>
		</div>
		<div class="p-2">
			<center> <button type="submit" class="btn btn-primary">로그인</button></center>
		</div>
		</div>

	</form>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>

</body>
</html>