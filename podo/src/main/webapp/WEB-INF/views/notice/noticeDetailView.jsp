<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <jsp:useBean id="today" class="java.util.Date"/> --%>
<%-- <fmt:formatDate var="today" value="${ today }" pattern="yyyy-MM-dd"/> --%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../common/header.jsp"/>
		<style>
			
			#board-image {
				cursor: pointer;
			}
			
		</style>
	</head>
	<body>
		
		<div class="container">
			<div class="col-lg-12">
				<div class="main_blog_details">
					<c:if test="${ !empty notice.imageName }">
						<a href="${ pageContext.servletContext.contextPath }/resources/noticeUploadFiles/${ notice.imageName }" download="${ notice.imageName}"
							 id="download-image" style="display: none;">${ notice.imageName}</a>
						<div class="row">
							<img id="notice-image" class="mx-auto my-5" src="${ pageContext.servletContext.contextPath }/resources/noticeUploadFiles/${ notice.imageName }" style="width: 400px;">
						</div>
					</c:if>
					<a 	href="#"><h4>${ notice.title }</h4></a>
					<div class="user_details">
						<div class="float-left">
							<a href="#">Lifestyle</a> <a href="#">Gadget</a>
						</div>
						<div class="float-right mt-sm-0 mt-3">
							<div class="media">
								<div class="media-body">
									<h5>${ notice.nickName }</h5>
									<p>${ notice.modifyDate }</p>
								</div>
								<div class="d-flex">
									<!-- 프로필 이미지 -->
									<img width="42" height="42" src="img/blog/user-img.png" alt="">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<p>${ notice.content }</p>
					</div>

					
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
				
			</div>
		</div>
		
		<div class="form-group row">
			<div class="btn-group btn-group-lg mx-auto" role="group" aria-label="...">
				<c:if test="${ loginUser.id eq notice.adminId }">
					<button class="btn btn-secondary btn-lg" onclick="location.href='ndelete.do?id=${ notice.id }';">삭제하기</button>
					<button class="btn btn-lg btn-primary" onclick="location.href='nupdateView.do?id=${ notice.id }';">수정하기</button>
				</c:if>
			</div>
		</div>
	
		<br><br>
		<hr>
	
		
		<!-- <a class="comment-modal btn-reply text-uppercase" href="#" data-toggle="modal">댓글신고하기</a> -->
		
		
		<script>
			$("#notice-image").on("click", function(){
				console.log("asd");
				$("#download-image").get(0).click();
			});
		</script>
		
		<jsp:include page="../common/footer.jsp"/>
		
	</body>
</html>