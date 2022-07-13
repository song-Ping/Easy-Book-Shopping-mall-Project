<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="java.util.ArrayList"%>


<%
		String id = request.getParameter("id");	
		if (id == null || id.trim().equals("")) {
			response.sendRedirect("book.jsp"); 
			return;
		}
		
		BookRepository dao = BookRepository.getNewBooks();
		
		Book book = dao.getbookById(id);
		if (book == null) {
			response.sendRedirect("exceptionNoProductId.jsp");
			return;
		}
		
		ArrayList<Book> goodsList = dao.getAllProducts();//arrayList에 모든 제품 찿기
		Book goods = new Book();
		for (int i = 0; i < goodsList.size(); i++) {
			goods = goodsList.get(i);	//Book 객체에 담기
			if (goods.getBookId().equals(id)) {//중복되는게 있다면 빠져나오기
				break;
			}
		}

		ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");
		if (list == null) {
			list = new ArrayList<Book>();
			session.setAttribute("cartlist", list);
		} 
		
		int cnt = 0;
		Book goodsQnt = new Book();
		for (int i = 0; i < list.size(); i++) {
			goodsQnt = list.get(i);
			if (goodsQnt.getBookId().equals(id)) {
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
			} //Quantity :  장바구니에 담은 개수
		}
		
		if (cnt == 0) {
			goods.setQuantity(1);
			list.add(goods);
		}
		
		response.sendRedirect("book.jsp?id=" + id);

%>
