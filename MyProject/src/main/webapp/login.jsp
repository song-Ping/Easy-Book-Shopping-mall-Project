<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./Resources/css/styles.css" rel="stylesheet" />
<title>login page</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">로그인</h1>
			</div>
		</div>
	</header><br>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label> 
					<input	type="text" class="form-control" placeholder="ID"	name='j_username' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> 
					<input 	type="password" class="form-control" placeholder="Password" name='j_password' required>
				</div><br>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form><br>
			<div class="alert alert-warning" role="alert">
			 	※ 일반 회원분들은 메뉴의 로그인을 클릭하셔서 로그인해주세요!
			</div>
		</div>
	</div>
</body>
</html>