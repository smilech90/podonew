<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		width: 100%;
		height: 100%;
	}
	#body{
		width: 60%;
		height: 100%;
		margin-left:auto;
		margin-right:auto;
	}
	.reviewArea{

		width: 100%;
		height: 100%;
		
	}
	.leftImage{
		width: 20%;
		height:100%;
		
		float: left;
	}
	.rightContentArea{
		width: 80%;
		height:100%;
		
		float: right;
	}
	.img1{
	 	
		width:80%;
		height: 80%;
		float: left
	}
	.reviewTitle{
		width:100%;
		height:20%;
		float:right;
	}
	.reviewName{
		
		width:40%;
		height:20%;
		float:left;
	}
	.reviewRelsaseYear{
		width:60%;
		float:right;
	}
	.reviewNickname{
		
		height:20%;
		width:40%;
	
	}
	.insertDate{
		font-size: 10px;
		width: 60%;
		float:left;
	}
	.reviewContent{
		height: 40%;
		width: 100%;
		float:right;
	}

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	<div id="body">
	<h1 align="center">리뷰 리스트 <button onclick="location.href='ratingReview.do';">레이팅보기</button></h1>
	
	<c:forEach items="${ list }" var="review">
	<div class="reviewArea">
		<div class="leftImage">
				<img src="resources/bootstrap/img/logo.png" alt="" class="img1">
		</div>
		<div class="rightContentArea">
			<div class="reviewTitle">
				영화제목 : ${ review.titleKor }
			</div>
			<div class="reviewName">
				장르 : ${ review.name }
				<div class="reviewRelsaseYear">제작년도 : ${ review.releaseYear }</div>
			</div>
			<div class="reviewNickname">
				글쓴이 : ${ review.nickname }
				<div class="insertDate">
					글쓴시간 : 추가할예정
				</div>
			</div>
			<div class="reviewContent">
				내용 : ${ review.content }
			</div>
		<hr>
		</div>
	
	</div>
	</c:forEach>
	<br>

	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>