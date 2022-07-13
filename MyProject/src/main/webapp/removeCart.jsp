<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>    
<%@ page import = "dao.BookRepository" %>    
<%@ page import = "dto.Book" %>

<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getNewBooks();
	
	Book book = dao.getbookById(id);
	if(book==null){
		response.sendRedirect("exceptionNoBookId.jsp");
	}
	
	@SuppressWarnings("unchecked")
	ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
	Book goodsQnt = new Book();
	for(int i = 0; i< cartList.size(); i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getBookId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
	return;
%>