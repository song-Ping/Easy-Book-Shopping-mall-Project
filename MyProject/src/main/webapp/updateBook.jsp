<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 수정</title>
</head>
<body>
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
				String bookId = request.getParameter("id");
			
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			
				String sql = "select * from book where p_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookId);
				rs = pstmt.executeQuery();
				if(rs.next()){
			%>
			<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./Resources/images/<%=rs.getString("p_fileName")%>" alt="image"
					style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newBook" action="./processUpdateBook.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-3">상품 코드</label>
						<div class="col-sm-3">
							<input type="text" id="bookId" name="bookId"
								class="form-control" value="<%=rs.getString("p_id")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">분류</label>
						<div class="col-sm-3">
								<input type="text" name="category" class="form-control"
								value="<%=rs.getString("p_category")%>">
						</div>
						<div class="col-sm-2">
						<select name="category" multiple>
									<optgroup label="도서">
										<option value="외국도서">외국 도서</option>
										<option value="국내도서">국내 도서</option>
									</optgroup>
									<optgroup label="분야">
										<option value="인문">인문</option>
										<option value="철학">철학</option>
										<option value="문학">문학</option>
										<option value="교양">교양</option>
										<option value="소설">소설</option>
										<option value="역사">역사</option>
										<option value="예술">예술</option>
										<option value="종교">종교</option>
										<option value="사회정치">사회정치</option>
										<option value="자연과학">자연과학</option>
										<option value="경제경영">경제경영</option>
										<option value="유아">유아</option>
										<option value="육아">육아</option>
										<option value="만화">만화</option>
										<option value="여행">여행</option>
										<option value="요리">요리</option>
										<option value="잡지">잡지</option>
										<option value="건강취미">건강취미</option>
										<option value="참고서">참고서</option>
									</optgroup>
										<option value="CD">CD</option>
										<option value="DVD">DVD</option>
								</select> 
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control"
								value="<%=rs.getString("p_name")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">출판일</label>
						<div class="col-sm-3">
						<input type="text" id = "releaseDate" name="releaseDate" class="form-control"
								value="<%=rs.getString("p_releaseDate")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">저자/가수/감독</label>
						<div class="col-sm-3">
							<input type="text" id="author" name="author" class="form-control"
								value="<%=rs.getString("p_author")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">제조사</label>
						<div class="col-sm-3">
							<input type="text" id="publisher" name="publisher" class="form-control"
								value="<%=rs.getString("p_publisher")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">상세 설명</label>
						<div class="col-sm-5">
							<textarea name="description" id = "description" cols="50" rows="20"
								class="form-control"><%=rs.getString("p_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">가격</label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice"
								class="form-control" value="<%=rs.getInt("p_unitPrice")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">상태</label>
						<div class="col-sm-2">
							<input type="radio" name="condition" value="New" autofocus> 신규 제품
							 <input type="radio" name="condition" value="Old"> 중고 제품 
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">재고 수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock"
								class="form-control" value="<%=rs.getInt("p_unitsInStock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">이미지</label>
						<div class="col-sm-5">
							<input type="file" id="productImage" name="productImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
 </div>
	<%
		}
		if (rs != null)
			rs.close();
 		if (pstmt != null)
 			pstmt.close();
 		if (conn != null)
			conn.close();
 	%>
</body>
</html>