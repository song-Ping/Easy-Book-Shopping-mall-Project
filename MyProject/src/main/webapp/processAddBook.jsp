<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dao.BookRepository" %>
<%@ page import = "dto.Book" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	PreparedStatement pstmt = null;
	
	String filename = "";
	String realFolder = "C:/Tomcat/workspacejsp1/MyProject/src/main/webapp/Resources/images/";//서버파일 저장경로
	int maxSize = 5 * 1024 * 1024;//파일 최대크기
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String id = multi.getParameter("bookId");
	String[] category = multi.getParameterValues("category");
	String pname = multi.getParameter("name");
	String releaseDate1 = multi.getParameter("releaseDate1");
	String releaseDate2 = multi.getParameter("releaseDate2");
	String releaseDate3 = multi.getParameter("releaseDate3");
	String releaseDate = releaseDate1 + "/" + releaseDate2 + "/" + releaseDate3;
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String description = multi.getParameter("description");
	String unitPrice = multi.getParameter("unitPrice");
	String condition = multi.getParameter("condition");
	String unitsInStock = multi.getParameter("unitsInStock");

	String savedCate = "";
	if(category != null){
		savedCate = String.join("/", category);
	}
	
	Integer price;
	
	if(unitPrice.isEmpty()){
		price = 0;
	}else{
		price = Integer.valueOf(unitPrice);
	}
	
	Integer stock;
	if (unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Integer.valueOf(unitsInStock);
	}

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
		String sql = "insert into book values(?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, savedCate);
		pstmt.setString(3, pname);
		pstmt.setString(4, releaseDate);
		pstmt.setString(5, author);
		pstmt.setString(6, publisher);
		pstmt.setString(7, description);
		pstmt.setInt(8, price);
		pstmt.setString(9, condition);
		pstmt.setInt(10, stock);
		pstmt.setString(11, fileName);
		pstmt.executeUpdate();
		
		BookRepository dao = new BookRepository();
		
		Book book = new Book();
		book.setCategory(savedCate);
		book.setReleaseDate(releaseDate);
		book.setAuthor(author);
		book.setPublisher(publisher);
		book.setDescription(description);
		book.setCondition(condition);
		book.setUnitsInStock(stock);
		book.setFilename(filename);
		
		dao.addBook(book);
		
		
	if(pstmt != null){
		pstmt.close();
	}
	if(conn != null){
		conn.close();
	}
	
		response.sendRedirect("books.jsp");
		return;
%>