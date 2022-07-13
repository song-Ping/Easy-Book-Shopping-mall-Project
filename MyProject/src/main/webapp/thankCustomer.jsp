<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<!DOCTYPE html>
<html>
<head>
<link href="./Resources/css/styles.css" rel="stylesheet" /> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8");
	
	String shipping_cartId = "";
	String shipping_name ="";
	String shipping_shippingDate ="";
	String shipping_country ="";
	String shipping_zipCode ="";
	String shipping_addressName ="";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(int i = 0; i< cookies.length; i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId")){
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			if(n.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	}
%>
	<jsp:include page="menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">주문 완료</h1>
			</div>
		</div>
	</header>
		<br>
	<div class="container" align="center">
		<h2 class="alert alert-primary">주문 해주셔서 감사합니다.</h2>
		<p> 고객님께서 선택하신 <% out.println(shipping_shippingDate); %>에 배송 예정입니다.
		<p> 주문번호 : <% out.println(shipping_cartId); %> 입니다.
	</div>
	<div class="container" align="center">
		<p><a href = "./books.jsp" class="btn btn-light"> &raquo; 쇼핑 이어하기</a>
		<a href = "./main.html" class="btn btn-dark"> &raquo; 홈으로 가기</a>
	</div>
</body>
</html>
<%
	session.invalidate();

	for( int i = 0; i< cookies.length; i++){//배송정보 모두삭제
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Shipping_cartId")){
			thisCookie.setMaxAge(0);//유효기간0으로 설정
		}
		if(n.equals("shipping_name")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("shipping_shippingDate")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("shipping_country")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("shipping_zipCode")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("shipping_addressName")){
			thisCookie.setMaxAge(0);
		}
		
		response.addCookie(thisCookie);
	}
%>
