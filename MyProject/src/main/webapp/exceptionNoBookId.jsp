<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link href="./Resources/css/styles.css" rel="stylesheet" />
<title>상품 아이디 오류</title>
</head>
<body>
		<jsp:include page="menu.jsp" />
	<header class="bg-white py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="alert alert-danger">해당 상품이 존재하지 않습니다</h1>
			</div>
		</div>
	</header>
	<div class="container">
		<p><%=request.getRequestURI()%>?<%=request.getQueryString()%>
		<p><a href="books.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
	</div>
</body>
</html>