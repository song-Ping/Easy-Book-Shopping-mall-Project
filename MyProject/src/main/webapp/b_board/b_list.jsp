<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.BoardDTO"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="./Resources/css/styles.css" rel="stylesheet" />
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=<%=sessionId%>" // 글 등록 페이지 출력
	}
</script>
</head>
<body>
<jsp:include page="/menu.jsp" />
	<header class="bg-grey py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-start text-white">
				<h1 class="display-4 fw-bolder">게시판</h1>
			</div>
		</div>
	</header><br>
	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=total_record%>건	</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th></th>
						<th>작성자</th>
						<th>조회</th>
						<th>작성일</th>
					</tr>
					<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					<tr>
						<td><%=notice.getNum()%></td>
						<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td></td>
						<td><%=notice.getName()%></td>
						<td><%=notice.getHit()%></td>
						<td><%=notice.getRegist_day()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='4C5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'> [${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp; 
						<select name="items" class="txt">
								<option value="b_Subject">제목</option>
								<option value="b_Content">본문</option>
								<option value="b_Name">작성자</option>
								<option value="b_Num">글번호</option>
						</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-outline-primary " value="검색 " />
						</td>
						<td width="100%" align="right">
							<a href="#" onclick="checkForm(); return false;" class="btn btn-outline-info">&laquo; 글쓰기</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>





