<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="./Resources/css/styles.css" rel="stylesheet" />
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제합니다. 해당 상품을 삭제하는데 동의하십니까?") == true){
			location.href="./deleteBooks.jsp?id=" + id;
		}else{
			return;
		}
	}
</script>
</head>
<body>
<%
	String edit = request.getParameter("edit");
%>
<jsp:include page="menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">상품 수정</h1>
			</div>
		</div>
	</header>
	<br>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
			
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from book";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
			<div class="col-md-4">
				<img src="./Resources/images/<%=rs.getString("p_fileName") %>" style="width:70%">
				<h3>코드 : <%=rs.getString("p_id") %></h3>
				<p>분류 : <%=rs.getString("p_category") %>
				<p>제목 : <%=rs.getString("p_name") %>
				<p>출판일 : <%=rs.getString("p_releaseDate") %>
				<p>저자/가수/감독 : <%=rs.getString("p_author") %>
				<p>출판사/제작사 : <%=rs.getString("p_publisher") %>
				<p>	<%
						if (edit.equals("update")) {
					%>
					<a href="./updateBook.jsp?id=<%=rs.getString("p_id")%>"	class="btn btn-outline-info" role="button"> 수정 &raquo;></a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-outline-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>			
			</div>
			<%
				}
				if (rs != null){
					rs.close();					
				}
	 			if (pstmt != null){
	 				pstmt.close();	 				
	 			}
	 			if (conn != null){
	 				conn.close();
	 			}
	 			%>
		</div>
	</div>
</body>
</html>