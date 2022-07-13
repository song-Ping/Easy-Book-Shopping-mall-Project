<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="./Resources/css/styles.css" rel="stylesheet" />
<title>Easy book</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">상품 목록</h1>
			</div>
		</div>
	</header>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from book WHERE p_category like '%국내%' ";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()){
			%>
			<div class="col-md-3">
			<br>
			<a href="./book.jsp?id=<%=rs.getString("p_id")%>">
				<img src ="./Resources/images/<%=rs.getString("p_fileName")%>"
				style= "width: auto; height: 200px; object-fit: cover;"></a>
				<div class = "width:300px">
				<a style = "text-decoration-line:none; color:black;font-size:25px;" href="./book.jsp?id=<%=rs.getString("p_id")%>"><%=rs.getString("p_name") %></a>
				<p style="color:gray"><%=rs.getString("p_author")%> | <%=rs.getString("p_publisher")%>
				<p style="font-weight:bold"><%=rs.getString("p_unitPrice")%> 원
				</div>
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
		</div>
		<hr>
	</div>
</body>
</html>