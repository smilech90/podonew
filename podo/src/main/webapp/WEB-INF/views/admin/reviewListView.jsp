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
	
	<h1 align="center">리뷰리스트</h1>
	
	<h3 align="center">
		총 게시글 갯수 : ${ pi.listCount } 페이지 : ${ pi.currentPage } / ${ pi.maxPage } 
	</h3>
	
	

	
	<table border="1" style="width:700px;margin:0 auto;">
		<tr>
			<th>No</th>
			<th>영화제목</th>
			<th>작성자</th>
			<th>좋아요</th>
			<th>스포일러</th>
			<th>신고</th>
			<th>상태</th>
		</tr>
		<c:forEach items="${ list }" var="r">	
			<tr>
				<td>${ r.id }</td>
				<td>${ r. } ${r. }</td>
				<td>${ r. }</td>
				<td>${ r. }</td>
				<td>${ r. }</td>
				<td>${ r. }</td>
				<td>${ r. }</td>

			</tr>
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td colspan="7">
				<!-- [이전] -->
				<c:if test="${ pi.currentPage eq 1 }">
					[이전] 
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url value="adRlist.do" var="before">
						<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
					</c:url>
					<a href="${ before }">[이전] </a>	
				</c:if>
				
				<!-- [페이지] -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"> [${ p }] </font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url value="adRlist.do" var="page">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ page }"> ${ p } </a>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					 [다음]
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url value="adRlist.do" var="after">
						<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
					</c:url>
					<a href="${ after }"> [다음]</a>
				</c:if>
			</td>
		</tr>
	</table>

</body>
</html>