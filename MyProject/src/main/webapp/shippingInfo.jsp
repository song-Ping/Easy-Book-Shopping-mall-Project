<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="./Resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script>
 $(function() {
  $("#shippingDate").datepicker();
 });

</script>
<title>배송 정보</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
				String memberId = request.getParameter("id");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from bmember where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				rs = pstmt.executeQuery();
				while (rs.next()){
%>
	<jsp:include page="menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">배송 정보</h1>
			</div>
		</div>
	</header>
	<br>
	<div class="container">
		<form method="post" class="form-horizontal" action="./processShippingInfo.jsp">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="name" value="<%=rs.getString("name") %>" class="form-contrl" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input type="text" id="shippingDate" name="shippingDate" class="form-contrl" />
				
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">국가명</label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="addressName" value="<%=rs.getString("address")%>" class="form-contrl" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-outline-dark">이전</a>
					<input type="submit" class="btn btn-info" value="등록" />
					<a href="./checkOutCancelled.jsp" class="btn btn-outline-danger" role="button">취소</a>
				</div>
			</div>
			
		</form>
	</div>
	<%
				}
				
			if (rs != null)
				rs.close();
 			if (pstmt != null)
 				pstmt.close();
 			if (conn != null)
				conn.close();
			%>
</body>
</html>