<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	Connection conn = null;
	
	try{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:study";
	String user = "system";
	String password = "12345";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, password);
	
	}
	catch(SQLException ex){
		out.println("데이터베이스 연결이 실패했습니다.");
		out.println("SQLException: " + ex.getMessage());
		
	}
%>