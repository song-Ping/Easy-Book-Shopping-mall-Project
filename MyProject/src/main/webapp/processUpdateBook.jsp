<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String filename = "";
	String realFolder = "C:/Tomcat/workspacejsp1/MyProject/src/main/webapp/Resources/images/";//서버파일 저장경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	
	String bookId = multi.getParameter("bookId");
	String[] category = multi.getParameterValues("category");
	String name = multi.getParameter("name");
	String releaseDate = multi.getParameter("releaseDate");
	String year = multi.getParameter("releaseDate1");
	String month = multi.getParameter("releaseDate2");
	String day = multi.getParameter("releaseDate3");
	String u_releaseDate = year + "/" + month + "/" + day;
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String description = multi.getParameter("description");
	String unitPrice = multi.getParameter("unitPrice");
	String condition = multi.getParameter("condition");
	String unitsInStock = multi.getParameter("unitsInStock");
	
	String savedCate = "";
	if(category != null){
		for(int i=0; i< category.length; i++){
			savedCate = String.join("/", category);
		}
	}
	
	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	Integer stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Integer.valueOf(unitsInStock);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	


	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
	String sql = "select * from book where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE book SET p_category=?, p_name=?, p_releaseDate=?, p_author=?, p_publisher=?, p_description=?, p_unitPrice=?, p_condition=?, p_unitsInStock=?, p_fileName=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, savedCate);
				pstmt.setString(2, name);
				pstmt.setString(3, releaseDate);
				pstmt.setString(4, author);
				pstmt.setString(5, publisher);
				pstmt.setString(6, description);
				pstmt.setInt(7, price);
				pstmt.setString(8, condition);
				pstmt.setInt(9, stock);
				pstmt.setString(10, fileName);
				pstmt.setString(11, bookId);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE book SET p_category=?, p_name=?, p_releaseDate=?, p_author=?, p_publisher=?, p_description=?, p_unitPrice=?, p_condition=?, p_unitsInStock=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, savedCate);
				pstmt.setString(2, name);
				pstmt.setString(3, releaseDate);
				pstmt.setString(4, author);
				pstmt.setString(5, publisher);
				pstmt.setString(6, description);
				pstmt.setInt(7, price);
				pstmt.setString(8, condition);
				pstmt.setInt(9, stock);
				pstmt.setString(10, bookId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
	{
		rs.close();
	}
 	if (pstmt != null)
 	{
 		pstmt.close();
 	}
 	if (conn != null)
 	{
		conn.close();
 	}
	response.sendRedirect("editBook.jsp?edit=update");
%>

</body>
</html>