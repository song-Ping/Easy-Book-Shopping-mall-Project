<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="./Resources/css/styles.css" rel="stylesheet" /> 
<title>주문 취소</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">주문 취소</h1>
			</div>
		</div>
	</header>
	<br>
	<div class="container">
		<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
	</div>
	<div class="container">
		<p> <a href="./books.jsp" class="btn btn-secondary"> &raquo; 상품 목록</a>
	</div>
</body>
</html>