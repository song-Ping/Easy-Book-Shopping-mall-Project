<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String cartId = session.getId();
	String memberId = (String) session.getAttribute("sessionId");
	
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";

	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
			{
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="./Resources/css/styles.css" rel="stylesheet" />
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">주문 정보</h1>
			</div>
		</div>
	</header>
	<br>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>주문서</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<h3>
					<strong>배송 주소</strong>
				</h3>
				<br>
				<b> 이름 : </b>
				<%=shipping_name%>
				<br>
				<b>우편번호 : </b>
				<%=shipping_zipCode%>
				<br>
				<b>주소 : </b>
				<%=shipping_addressName%>(<%=shipping_country%>)<br>
			</div>
			<div class="col-4" align="right">
				<p>
					<em>주문일 : <%=shipping_shippingDate%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover"><br>
				<tr>
					<th class="text-center">상품</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">total</th>
				</tr>
				<%
				int num = 0;
				int sum = 0;
				@SuppressWarnings("unchecked")
				ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
				if (cartList == null) {
					cartList = new ArrayList<Book>();
				}
				for (int i = 0; i < cartList.size(); i++) {
					Book book = cartList.get(i);
					num += book.getQuantity();
					int total = book.getUnitPrice() * book.getQuantity();
					sum += total;
					BookRepository dao = new BookRepository(); 
					dao.getStockInfo(book.getBookId(), book.getQuantity());
				%>
				<tr>
					<td class="text-center"><em><%=book.getPname()%></em></td>
					<td class="text-center"><%=book.getQuantity()%></td>
					<td class="text-center"><%=book.getUnitPrice()%>원</td>
					<td class="text-center"><%=total%>원</td>
				</tr>
				<%
				}
				%>
				<tr>
					<th>합계</th>
					<th class="text-center"><%=num%></th>
					<th class="text-center"></th>
					<td class="text-center text-danger"><strong><%=sum%>
							원</strong></td>
				</tr>
			</table>
			<div align="right">
			
					<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>&id=<%=memberId%>" class="btn btn-outline-secondary" role="button"> 이전 </a>
					<a href="./thankCustomer.jsp"  class="btn btn-outline-info" role="button">
					주문 완료 </a>
					<a href="./checkOutCancelled.jsp" class="btn btn-outline-warning" role="button"> 취소</a>
			</div>
			
			
		</div>
	</div>
					
</body>
</html>