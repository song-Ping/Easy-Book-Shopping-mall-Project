<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>    
<%@ page import = "dao.BookRepository" %>    
<%@ page import = "dto.Book" %>    
<!DOCTYPE html>
<html>
<head>
<link href="./Resources/css/styles.css" rel="stylesheet" /> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<%
	String cartId = session.getId();
	String bookId = request.getParameter("id");
	String memberId = (String) session.getAttribute("sessionId");
%>
<title>북카트</title>
</head>
<body>
		<jsp:include page="menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">장바구니</h1>
			</div>
		</div>
	</header><br>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./books.jsp"  class="btn btn-outline-light"> &raquo; 쇼핑 계속하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId%>&id=<%=memberId%>" class="btn btn-outline-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table ">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>total</th>
					<th></th>
				</tr>
				<%
					int sum = 0;
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if(cartList == null){
						cartList = new ArrayList<Book>();
					}
					
					for(int i = 0; i< cartList.size(); i++){
						Book book = cartList.get(i);
						int total = book.getUnitPrice() * book.getQuantity();
						sum = sum + total;
					
				%>
				<tr>
					<td><%=book.getBookId()%> - <%=book.getPname()%></td>
					<td><%=book.getUnitPrice() %></td>
					<td><%=book.getQuantity()%></td>
					<td><%=total %></td>
					<td><a href="./removeCart.jsp?id=<%=book.getBookId()%>" class="badge rounded-pill text-bg-warning">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-outline-danger">모두 삭제하기</a>
		</div>
		<hr>
	</div>
</body>
</html>