<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./Resources/js/validation.js"></script>
<title>상품 등록 page</title>
</head>
<jsp:include page="menu.jsp" />
<div class="jumbotron">
	<div class="container">
		<div class="text-right">
			<a href="logout.jsp" class="btn btn-outline-warning">logout</a>
		</div>
		<h1 class="display-3">상품 등록</h1>
	</div>
</div>
<div class="container">
	<form name="newBook" action="./processAddBook.jsp"
		class="form-horizontal" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2">상품 코드</label>
			<div class="col-sm-3">
				<input type="text" id="bookId" name="bookId" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">분류</label>
			<div class="col-sm-3">
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
				<label class="col-sm-2">상품명</label>
			<div class="col-sm-3">
				<input type="text" id="name" name="name" class="form-control">
			</div>
		</div>
		<div class="form-group row">
				<label class="col-sm-2">출판일</label>
			<div class="col-sm-3">
				<select name="releaseDate1">
					<option>-- 선택하세요 --</option>
					<option value="2001">2000</option>
					<option value="2001">2001</option>
					<option value="2001">2002</option>
					<option value="2001">2003</option>
					<option value="2001">2004</option>
					<option value="2001">2005</option>
					<option value="2001">2006</option>
					<option value="2001">2007</option>
					<option value="2001">2008</option>
					<option value="2001">2009</option>	
					<option value="2001">2010</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
					<option value="2025">2025</option>
					<option value="2026">2026</option>
					<option value="2027">2027</option>
					<option value="2028">2028</option>
					<option value="2029">2029</option>
					<option value="2030">2030</option>
				</select>년 
				<select name="releaseDate2">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>월 
				<select name="releaseDate3">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>일
			</div>
		</div>
		<div class="form-group row">
				<label class="col-sm-2">저자/가수/감독</label>
			<div class="col-sm-3">
				<input type="text" name="author" class="form-control">
			</div>
		</div>
		<div class="form-group row">
				<label class="col-sm-2">출판사</label>
			<div class="col-sm-3">
				<input type="text" name="publisher" class="form-control">
			</div>
		</div>
		<div class="form-group row">
				<label class="col-sm-2">소개글</label>
			<div class="col-sm-5">
				<textarea name="description" cols="50" rows="20" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group row">
				<label class="col-sm-2">가격</label>
			<div class="col-sm-3">
				<input type="text" style="width:200px" id ="unitPrice" name="unitPrice" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상태</label>
			<div class="col-sm-5">
				<input type="radio" name="condition" value="New" autofocus> 신규 제품
				 <input type="radio" name="condition" value="Old"> 중고 제품
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재고 수</label>
			<div class="col-sm-3">
				<input type="text" style="width:200px" id="unitsInStock"
					name="unitsInStock" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이미지</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10 ">
				<input type="button" class="btn btn-outline-primary" value="등록"
					onclick="CheckAddProduct()">
				 <input type="reset" 	
					class="btn btn-outline-primary" value="초기화">
			</div>
		</div>
	</form>
</div>
</body>
</html>