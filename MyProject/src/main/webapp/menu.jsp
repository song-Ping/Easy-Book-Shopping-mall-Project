<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Book store - Easy Book</title>
<link rel="icon" type="image/x-icon"
	href="./Resources/assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="./Resources/css/styles.css" rel="stylesheet" />

</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="<c:url value="/main.html"/>">Easy Book</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">도서</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="<c:url value="/books.jsp"/>">모든 도서</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="<c:url value="/domesticBooks.jsp"/>">국내 도서</a></li>
							<li><a class="dropdown-item" href="<c:url value="/ForeignBooks.jsp"/>">외국 도서</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">CD/DVD</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="<c:url value="/cd_dvds.jsp"/>">모든 CD/DVD</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="<c:url value="/Cds.jsp"/>">CD</a></li>
							<li><a class="dropdown-item" href="<c:url value="/Dvds.jsp"/>">DVD</a></li>
						</ul></li>
				</ul>
			</div>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/bmember/loginbMember.jsp"/>">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/bmember/addbMember.jsp"/>">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"href="<c:url value="/BoardListAction.do?pageNum=1"/>">문의 게시판</a></li>
						<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a class="dropdown-item" href="./addBook.jsp">상품 등록</a></li>
										<li><a class="dropdown-item" href="<c:url value="/editBook.jsp?edit=update"/>">상품 수정</a></li>
										<li><a class="dropdown-item" href="<c:url value="/editBook.jsp?edit=delete"/>">상품 삭제</a></li>
										<li><a class="dropdown-item" href="./logout.jsp">로그아웃</a></li>
									</ul></li>
					</ul>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: black">[<%=sessionId%>님]
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/bmember/logoutbMember.jsp"/>">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/bmember/updatebMember.jsp"/>">회원 수정</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a></li>
						 <a href="<c:url value="/cart.jsp"/>" class="btn btn-outline-dark"> 	
					<i class="bi-cart-fill me-1"></i> 북카트 &raquo;</a>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./Resources/js/scripts.js"></script>
</body>
</html>