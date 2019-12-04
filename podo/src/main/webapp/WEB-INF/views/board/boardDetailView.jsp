<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate var="today" value="${ today }" pattern="yyyy-MM-dd"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>




<style>

	.board-detail-form{
		
		margin-top: 50px;
		margin-left:auto !important;
		margin-right:auto !important;
		text-align: center;
	}
	
	#b-detail-btn{
		margin-left: 150px;
	}
	
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
	
	<br>
	
	<h1 align="center">게시판</h1>
	
	<br>
	<div class="row"></div>
	<div class="col-md-7 board-detail-form">
		<div class="text-center">
			<div class="form-group row">
				<label for="" class="col-md-2 col-form-label">제목 </label>
		    	<div class="col-md-10">
					<input type="text" class="form-control" name="title" value="${ b.title }" readonly>
		    	</div>
		  	</div>
		  	<div class="form-group row">
				<label for="" class="col-md-2 col-form-label">작성자 </label>
		    	<div class="col-md-10">
					<input type="text" class="form-control" name="memberId" value="${ b.nickName }" readonly>
		    	</div>
		  	</div>
		  	<div class="form-group row">
				<label for="" class="col-md-2 col-form-label">작성일 </label>
		    	<div class="col-md-10">
					<input type="text" class="form-control" name="createDate" value="${ today }" readonly>
		    	</div>
		  	</div>
			<div class="form-group row">
				<label for="" class="col-md-2 col-form-label">내용</label>
				<div class="col-md-10">
					<textarea class="form-control" name="content" cols="20" rows="15" readonly>${ b.content }</textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="" class="col-md-2 col-form-label">첨부파일</label>
				<c:if test="${ !empty i.originalName }">
					<a href="${ pageContext.servletContext.contextPath }/resources/boardUploadFiles/${ i.changeName }" download="${ i.originalName }">${ i.originalName }</a>
				</c:if>
				<c:if test="${ empty i.originalName }">
					<div class="col-md-10">
						<input type="text" class="form-control" value="첨부파일이 없습니다." readonly>
		    		</div>
				</c:if>
				<div style="padding-left:30px;">
					<a class="declaration-modal btn-reply text-uppercase" href="#" data-toggle="modal" data-target="#boardReport">신고</a>
					&nbsp; &nbsp;
					<button class="btn btn-defatult">좋아요</button>
				</div>
			</div>
			
		</div>	
		<br>
		
		<div class="row"></div>
		<div class="container">
			<div class="form-group row">
				<div class="col-md-7" id="b-detail-btn">
					<c:if test="${ loginUser.id eq b.memberId }">
						<button class="btn btn-secondary btn-lg" onclick="location.href='bdelete.do?id=${ b.id }';">삭제하기</button>
						&nbsp; &nbsp;
						<button class="btn btn-lg btn-primary" onclick="location.href='bupdateView.do?id=${ b.id }';">수정하기</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<br><br>
	<hr>

	<!-- 댓글 -->
	
	<!-- 댓글 작성 div -->
	<div align="center" class="board-detail-comment">
		<div class="-detail-box">
			<h3>댓글</h3>
			<div class="inputTb">
				<table>
					<tr>
						<td><textarea cols="55" rows="5" id="c-content"></textarea></td>
						<td><button id="commentBtn">등록</button></td>
					</tr>
				</table>
			</div>
			
			<br>

			<!-- 댓글 리스트 -->
			<table cellspacing="0" id="c-list">
				<thead>
					<tr>
						<td colspan="4" style="height: 10px; font-size: 12px;"><b
							id="rCount"></b></td>
					</tr>
					<tr style="height: 10px; font-size: 12px;">
						<td>내용</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>a</td>
					</tr>
					<tr>
						<td>a</td>
						<td><button type="button">수정</button></td>
						<td><button type="button">삭제</button></td>
						<td>a</td>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>

	<!-- <a class="comment-modal btn-reply text-uppercase" href="#" data-toggle="modal">댓글신고하기</a> -->
	
	<script>
	
		$(function(){
			getCommentList();
			
			
		});
		
		function getCommentList(){
			$.ajax({
				url:"commentList.do",
				data:{id:${b.id}},
				dataType:"json",
				success:function(data){
					console.log(data);
					
					$tbody = $("#c-list tbody");
					$tbody.html("");
					
					$("#rCount").text("댓글 (" + data.length + ")");
					
					if(data.length > 0){
						$.each(data, function(index, value){
							$tr = $("<tr></tr>");
							
							$writerTd = $("<td width='100'></td>").text(value.writer);
							$contentTd = $("<td></td>").text(value.content);
							$dateTd = $("<td></td>").text(value.createDate);
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							
							$tbody.append($tr);
							
						});
					}else{
						$tr = $("<tr></tr>");
						
						$contentTd = $("<td colspan='3'></td>").text("등록된 댓글이 없습니다.");
						$tr.append($contentTd);
						
						$tbody.append($tr);
						
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
	/* 
		$(function(){
			getCommentList();
			
			$("#commentBtn").on("click", function(){
				var content = $("#c-content").val();
				var boardId = ${b.id};
				var writer = "${loginUser.id}";
				
				$.ajax({
					url:"commentInsert.do",
					data:{content:content,
						  boardId:boardId,
						  writer:writer},
					success:function(data){
						
						if(data == "success"){
							getCommentList();
							$("#c-content").val("");
						}else{
							alert("댓글 작성 실패했습니다.");
						}
					},error:function(){
						console.log("ajax 통신 실패");
					}
				});
			});
		});
		
		
		function getCommentList(){
			$.ajax({
				url:"commentList.do",
				data:{id:${b.id}},
				dataType:"json",
				successs:function(data){
					console.log(data);
					$tbody = $("#c-list tbody");
					$tbody.html("");
					
					$("#rCount").text("댓글 (" + data.length + ")");
					
					if(data.length > 0){
						$.each(data, function(index, value){
							$tr = $("<tr></tr>");
							
							$writerTd = $("<td width='100'></td>").text(value.writer);
							$contentTd = $("<td></td>").text(value.content);
							$dateTd = $("<td></td>").text(value.createDate);
							
							$tr.append($writerTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							
							$tbody.append($tr);
							
						});
					}else{
						$tr = $("<tr></tr>");
						
						$contentTd = $("<td colspan='3'></td>").text("등록된 댓글이 없습니다.");
						$tr.append($contentTd);
						
						$tbody.append($tr);
						
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		 */
	</script>
	
		
	<!-- 게시판 신고하기 모달 -->
	<div class="modal fade de_modal" id="boardReport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">게시글 신고</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="bReportModal.do" method="post">
						<input type="hidden" name="targetId" value="${ b.id }">
						<input type="hidden" name="reportId" value="${ loginUser.id }">
						<input type="hidden" name="reportedId" value="${ b.memberId }">
						
					<div class="form-group">
						<input class="commentType" type="radio" value="1" name="content">부적절한내용
						<input class="commentType" type="radio" value="2" name="content">스포일러
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">신고보내기</button>
						<button class="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>