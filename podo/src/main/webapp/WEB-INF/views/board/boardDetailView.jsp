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
	
	<br>
	
	<h1>게시판</h1>
	
	
	<button onclick="location.href='/download.board.do?imageId=${ b.imageId }';">다운로드</button>
	
	<!-- 댓글 -->
	
	<table align="center">
		<tr>
			<td><textarea rows="60" cols="3" id="board-comment"></textarea></td>
			<td><button id="commentBtn">등록</button></td>
		</tr>
	</table>
	
	<br>
	
	<table>
		<thead>
			<tr>
				<td colspan="3"><b id="commentCount"></b></td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	<script>
		$(function(){
			getCommentList();
			
			setInterval(function(){
				getCommentList();
			}, 5000);
			
			$("#commentBtn").on("click", function(){
				var content = $("#board-comment").val();
				var id = ${b.id};
				var writer = "${loginUser.id}";
				
				$.ajax({
					url:"rinsert.do",
					data:{
						
					}
				});
			});
			
		});
	</script>
	
	
	
		
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>