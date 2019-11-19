<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
	
	function Hi() {
	     alert(${ msg });
	} 
	
	</script>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<c:if test="${ msg ne null }">
		body onload="Hi()"
	</c:if>	
	
  <section class="blog-post-area section-margin">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
            
                
                <div class="comments-area">
					<h4>마이페이지</h4>
					<div class="comment-list">
						<div class="single-comment justify-content-between d-flex">
							<div class="user justify-content-between d-flex">
								<div class="thumb">
									<img src="resources/memberProfileImage/${ loginUser.image }" width="70px" height="70px" alt="">
									
								</div>
								<div class="desc">
									<h2>${ loginUser.nickName }</h2>
									<a href="#"><i class="ti-heart"></i></a>
									<p class="date">작성리뷰 - 0개  </p>
									<p class="date">콜렉션 - 0개  </p>
								</div>
							</div>
							<div class="reply-btn">
								<a href="memberUpdateForm.do" class="btn-reply text-uppercase" style="background:purple; color:white;">정보수정</a> 
							</div>
						</div>
					</div>	
				</div>
	
                
                
                
                
        </div>


		<!-- 카테고리 -->
        <div class="col-lg-4 sidebar-widgets">
            <div class="widget-wrap">


              <div class="single-sidebar-widget post-category-widget">
                <h4 class="single-sidebar-widget__title">${ loginUser.nickName }의 CATEGORY</h4>
                <ul class="cat-list mt-20">
                  <li>
                    <a href="#" class="d-flex justify-content-between">
                      <p>리뷰</p>
                    </a>
                  </li>
                  <li>
                    <a href="#" class="d-flex justify-content-between">
                      <p>콜렉션</p>
                    </a>
                  </li>
                  <li>
                    <a href="#" class="d-flex justify-content-between">
                      <p>좋아요</p>
                    </a>
                  </li>
                  <li>
                    <a href="#" class="d-flex justify-content-between">
                      <p>문의</p>
                    </a>
                  </li>
                 
                </ul>
              </div>

              </div>
            </div>
          </div>
      </div>
  </section>
  
</body>
</html>