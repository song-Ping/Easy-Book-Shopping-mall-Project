<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="dto.Book"%>

<%
	String id = request.getParameter("cartId");

	if (id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}
	
	session.invalidate();//장바구니에 등록된 모든 상품 삭제
	
	response.sendRedirect("cart.jsp");
%>