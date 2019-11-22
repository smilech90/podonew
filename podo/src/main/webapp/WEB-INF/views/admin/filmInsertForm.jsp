<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<h1 align="center">등록페이지</h1>
	<br>
	
	<form action="finsert.do" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td>장르</td>
				<td>
					<input type="checkbox" name="genre" value="드라마">드라마 
					<input type="checkbox" name="genre" value="액션">액션 
					<input type="checkbox" name="genre" value="다큐멘터리">다큐멘터리 
					<input type="checkbox" name="genre" value="스릴러">스릴러 
					<input type="checkbox" name="genre" value="미스터리">미스터리 
					<input type="checkbox" name="genre" value="범죄">범죄 
					<input type="checkbox" name="genre" value="공포">공포 
					<input type="checkbox" name="genre" value="뮤지컬">뮤지컬 
					<input type="checkbox" name="genre" value="로맨스">로맨스 
					<input type="checkbox" name="genre" value="SF">SF 
					<input type="checkbox" name="genre" value="판타지">판타지 
					<input type="checkbox" name="genre" value="모험">모험 
					<input type="checkbox" name="genre" value="코미디">코미디 
					<input type="checkbox" name="genre" value="가족">가족 
					<input type="checkbox" name="genre" value="서부극">서부극 
					<input type="checkbox" name="genre" value="애니메이션">애니메이션 
					<input type="checkbox" name="genre" value="전쟁">전쟁 
				</td>
			</tr>
			<tr>
				<td>제목(국문)</td>
				<td><input type="text" name="titleKor"></td>
			</tr>
			<tr>
				<td>제목(영문)</td>
				<td><input type="text" name="titleEng"></td>
			</tr>
			<tr>
				<td>감독</td>
				<td><input type="text" name="director"></td>
			</tr>
			<tr>
				<td>제작년도</td>
				<td><input type="month" name="releaseYear"></td>
			</tr>
			<tr>
				<td>제작국가</td>
				<td><input type="text" name="productionCountry"></td>
			</tr>
			<tr>
				<td>개봉상태</td>
				<td>
					<input type="radio" name="productionStatus" value="개봉">개봉 
					<input type="radio" name="productionStatus" value="개봉예정">개봉예정
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">등록하기</button> 
					<button type="button" onclick="location.href='flist.do';">목록으로</button>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>