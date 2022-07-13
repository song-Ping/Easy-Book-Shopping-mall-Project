<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@127.0.0.1:1521:study"
		driver="oracle.jdbc.driver.OracleDriver" user="system" password="12345"  />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM bmember WHERE id = ?
   <sql:param value="<%=sessionId%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:import var="url" url="logoutbMember.jsp" />
	<c:redirect url="resultbMember.jsp" />
</c:if>

