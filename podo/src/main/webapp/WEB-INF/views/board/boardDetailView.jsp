<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <jsp:useBean id="today" class="java.util.Date"/> --%>
<%-- <fmt:formatDate var="today" value="${ today }" pattern="yyyy-MM-dd"/> --%>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
=======
	<head>
		<jsp:include page="../common/header.jsp"/>
		<style>
			
			#board-image {
				cursor: pointer;
			}
			
		</style>
	</head>
	<body>
		
		<!--================ Start Blog Post Area =================-->
		<div class="container">
			<div class="col-lg-12">
				<div class="main_blog_details">
					<c:if test="${ !empty board.imageName }">
						<a href="${ pageContext.servletContext.contextPath }/resources/boardUploadFiles/${ board.imageName }" download="${ board.imageName}"
							 id="download-image" style="display: none;">${ board.imageName}</a>
						<div class="row">
							<img id="board-image" class="mx-auto my-5" src="${ pageContext.servletContext.contextPath }/resources/boardUploadFiles/${ board.imageName }" style="width: 400px;">
						</div>
					</c:if>
					<a 	href="#"><h4>${ board.title }</h4></a>
					<div class="user_details">
						<div class="float-left">
							<a href="#">Lifestyle</a> <a href="#">Gadget</a>
						</div>
						<div class="float-right mt-sm-0 mt-3">
							<div class="media">
								<div class="media-body">
									<h5>${ board.nickName }</h5>
									<p>${ board.modifyDate }</p>
								</div>
								<div class="d-flex">
									<!-- 프로필 이미지 -->
									<img width="42" height="42" src="img/blog/user-img.png" alt="">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<p>${ board.content }</p>
					</div>
>>>>>>> changsu

					
					<div class="news_d_footer flex-column flex-sm-row">
						<a href="#"><span class="align-middle mr-2"><i
								class="ti-heart"></i></span>Lily and 4 people like this</a> <a
							class="justify-content-sm-center ml-sm-auto mt-sm-0 mt-2"
							href="#"><span class="align-middle mr-2"> <i
								class="ti-themify-favicon"></i></span>06 Comments</a>
						<div class="news_socail ml-sm-auto mt-sm-0 mt-2">
							<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
								class="fab fa-twitter"></i></a> <a href="#"><i
								class="fab fa-dribbble"></i></a> <a href="#"><i
								class="fab fa-behance"></i></a>
						</div>
					</div>
				</div>

				<div class="navigation-area">
					<div class="row">
						<div
							class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
							<div class="thumb">
								<a href="#"><img class="img-fluid" src="img/blog/prev.jpg"
									alt=""></a>
							</div>
							<div class="arrow">
								<a href="#"><span class="lnr text-white lnr-arrow-left"></span></a>
							</div>
							<div class="detials">
								<p>Prev Post</p>
								<a href="#"><h4>A Discount Toner</h4></a>
							</div>
						</div>
						<div
							class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
							<div class="detials">
								<p>Next Post</p>
								<a href="#"><h4>Cartridge Is Better</h4></a>
							</div>
							<div class="arrow">
								<a href="#"><span class="lnr text-white lnr-arrow-right"></span></a>
							</div>
							<div class="thumb">
								<a href="#"><img class="img-fluid" src="img/blog/next.jpg"
									alt=""></a>
							</div>
						</div>
					</div>
				</div>
				<div class="comments-area">
					<h4>05 Comments</h4>
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="img/blog/c1.jpg" alt="">
								</div>
								<div class="desc">
									<h5>
										<a href="#">Emilly Blunt</a>
									</h5>
									<p class="date">December 4, 2017 at 3:12 pm</p>
									<p class="comment">Never say goodbye till the end comes!</p>
								</div>
							</div>
							<div class="reply-btn">
								<a href="" class="btn-reply text-uppercase">reply</a>
							</div>
						</div>
					</div>
					<div class="comment-list left-padding">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="img/blog/c2.jpg" alt="">
								</div>
								<div class="desc">
									<h5>
										<a href="#">Elsie Cunningham</a>
									</h5>
									<p class="date">December 4, 2017 at 3:12 pm</p>
									<p class="comment">Never say goodbye till the end comes!</p>
								</div>
							</div>
							<div class="reply-btn">
								<a href="" class="btn-reply text-uppercase">reply</a>
							</div>
						</div>
					</div>
				</div>
				<div class="comment-form">
					<h4>Leave a Reply</h4>
					<form>
						<div class="form-group">
							<textarea class="form-control mb-10" rows="5" name="message"
								placeholder="Messege" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Messege'" required=""></textarea>
						</div>
						<a href="#" class="button submit_btn">Post Comment</a>
					</form>
				</div>
			</div>
		</div>
		<!--================ End Blog Post Area =================-->
		
		<div class="form-group row">
			<div class="btn-group btn-group-lg mx-auto" role="group" aria-label="...">
				<c:if test="${ loginUser.id eq board.memberId }">
					<button class="btn btn-secondary btn-lg" onclick="location.href='bdelete.do?id=${ board.id }';">삭제하기</button>
					<button class="btn btn-lg btn-primary" onclick="location.href='bupdateView.do?id=${ board.id }';">수정하기</button>
				</c:if>
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
				
				$("#board-image").on("click", function(){
					console.log("asd");
					$("#download-image").get(0).click();
				});
		</script>
		
		<jsp:include page="../common/footer.jsp"/>
	</body>
</html>