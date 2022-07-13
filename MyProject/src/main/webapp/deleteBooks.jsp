<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String bookId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from book";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		sql = "delete from book where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		pstmt.executeUpdate();
	}else{
		out.println("일치하는 상품이 없습니다.");
	}
	
	if(rs != null){
		rs.close();
	}
	if(conn != null){
		conn.close();
	}
	if(conn != null){
		conn.close();
	}
	
	response.sendRedirect("editBook.jsp?edit=delete");
%>