<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="./Resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<title>도서 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">상세 정보</h1>
			</div>
		</div>
	</header>
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String bookId = request.getParameter("id");
		String memberId = request.getParameter("sessionId");
	
		try {
		String sql = "select * from book where p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();
		if (rs.next()){
	%>
		<br>
	<div class="container">
	<div class="row">
	<div class="col-md-5">
			<p><span class="badge badge-danger"><%= rs.getString("p_id") %></span></p>
		<img class="card-img-top" src="./Resources/images/<%=rs.getString("p_fileName") %>"  style="max-width: 100%; height: auto;"/>
	</div>
		<div class="col-md-6">
			<h1><%=rs.getString("p_name")%></h1>
			<p style ="color:gray"> <%=rs.getString("p_category") %>
			<p><b>저자 : </b> <%=rs.getString("p_author") %>
			<p><b>출판사 : </b> <%=rs.getString("p_publisher") %>
			<h4><b>가격 : </b> <%=rs.getInt("p_unitPrice") %> 원</h4><br>
			<p><b>책 소개 : </b> <%=rs.getString("p_description") %></p>
			<p><form name="addForm" action="addCart.jsp?id=<%= rs.getString("p_id") %>" method="post">
			<br><br>
			
			<%
				int stock = Integer.parseInt(rs.getString("p_unitsInStock"));
				if(stock == 0  ||stock < 0){
					out.println("<script>");
					out.println("alert('일시품절되었습니다. 주문이 불가능합니다.');");
					out.println("history.back();");
					out.println("</script>");
			}
			 %>
			<a href="#" class="btn btn-outline-info" onclick="addToCart()"> 북카드 담기 &raquo;</a>
			<a href="./books.jsp"  class="btn btn-outline-light"> 상품 목록 &raquo;</a>
			</form>
		</div>
	<%
				}
			else{
				out.println("일치하는 아이디 없음");
			}
		}
		catch (SQLException ex){
		out.println("sqlexception : " + ex.getMessage());
	    }
		finally{
			if (rs != null){
				rs.close();				
			}
 			if (pstmt != null){
 				pstmt.close(); 				
 			}
 			if (conn != null){
				conn.close(); 				
 			}
		}
			%>
	</div>
	</div>
	<hr>
</body>
</html>