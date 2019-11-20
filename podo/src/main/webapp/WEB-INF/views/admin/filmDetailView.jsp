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
	
	
		<h1 align="center">게시글 상세보기</h1>
	<br>
	
	<table align="center">
		<tr>
			<td colspan="2" align="center">${ b.id }번 글 상세보기</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${ b.title }</td>		
		</tr>
		<tr>
			<td>작성자</td>
			<td>${ b.writer }</td>		
		</tr>
		<tr>
			<td>내용</td>
			<td>${ b.content }</td>		
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<c:if test="${ !empty b.originalFileName }">
					<a href="${ pageContext.servletContext.contextPath }/resources/buploadFiles/${b.renameFileName}" download="${ b.originalFileName }">${ b.originalFileName }</a>
				</c:if>
			</td>		
		</tr>
		<tr>
			<td colspan="2" align="center">
				<c:if test="${ loginUser.id eq b.writer }">
					<a href="bupdateView.do?id=${ b.id }">수정하기</a>
					<a href="bdelete.do?id=${ b.id }">삭제하기</a>
				</c:if>
			</td>
		</tr>
	</table>
	
	
</body>
</html>