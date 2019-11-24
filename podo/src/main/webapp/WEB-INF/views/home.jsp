<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>포도포도</title>
		<style>
			
			@media (min-width: 1000px) {
				.main-banner {
					height: 550px;
				}
			}
			
			.main-banner {
				position: relative;
		    background: url(resources/bootstrap/img/banner/main-banner.png) left center no-repeat;
		    background-size: cover;
		    opacity: 0.85;
		    height: 400px;
		    z-index: 1;
			}
			
			.owl-carousel .owl-item img {
				height: 360px;
				object-fit: contain;
			}
			#homePoster{
				width: 200px;
				height: 200px;
				margin-left: 80px;
			}
			
		</style>
	</head>
	<body>
		<jsp:include page="common/header.jsp"/>
    <!--================Hero Banner start =================-->
    <section class="mb-30px">
      <div class="container">
        <div class="main-banner">
          <div class="hero-banner__content">
            <h3>Film & Review</h3>
            <h1>Great, Grape!</h1>
            <h4>December 5, 2019</h4>
          </div>
        </div>
      </div>
    </section>
    <!--================Hero Banner end =================-->
		
    <!--================ Blog slider start =================-->
    <!-- 창수가 구현한 위페이지 -->
    <section class="blog-post-area section-margin">
			<div class="container">
			
        <div class="owl-carousel owl-theme blog-slider">
      		<c:forEach items="${ list }" var="film">
	      	<!--================ Blog slider start =================-->
	        	
	          <div class="card blog__slide text-center">
	            <div class="blog__slide__img">
	            	<c:choose>
	            		<c:when test="${ not empty film.poster }">
			              <img class="card-img rounded-0" src="resources/detailFilmImage/${ film.poster }" alt="">
	            		</c:when>
	            		<c:otherwise>
			              <img class="card-img rounded-0" src="resources/detailFilmImage/podoposter.jpg" alt="">
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            <div class="blog__slide__content">
	              <a class="blog__slide__label" href="#">${ film.avgStarRating }</a>
	              <h3><a href="#">${ film.titleKor }</a></h3>
	              <p>${ film.releaseYear }</p>
	            </div>
	            
	          </div>
     			</c:forEach>
    			</div>
	      
			</div>
		</section>
		<!-- 영화리뷰쪽 -->
		<section class="blog-post-area section-margin">
			<div class="container">
			
	        	<p align="center">리뷰 리스트</p>
        <div class="owl-carousel owl-theme blog-slider">
      		<c:forEach items="${ reviewList }" var="rs">
	      	<!--================ Blog slider start =================-->
	          <div class="card blog__slide text-center">
	            <div class="blog__slide__img">
	            	<c:choose>
	            		<c:when test="${ not empty rs.posterImage }">
			              <img class="card-img rounded-0" src="resources/detailFilmImage/${ rs.posterImage }" alt="" id="homePoster">
	            		</c:when>
	            		<c:otherwise>
			              <img class="card-img rounded-0" src="resources/detailFilmImage/podoposter.jpg" alt="" id="homePoster">
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            <div class="blog__slide__content">
	              <h3><a href="#">${ rs.content }</a></h3>
	              <p>${ rs.nickName }님 작성</p>
	              <p>${rs.modifyDate }에 작성</p>
	            </div>
	            
	          </div>
     			</c:forEach>
    			</div>
	      
			</div>
		</section>
		
		<!-- 자유게시판 -->
		<section class="blog-post-area section-margin">
			<div class="container">
			
	    <p align="center">자유게시판 리스트</p>
        <div class="owl-carousel owl-theme blog-slider">
      		<c:forEach items="${ boardList }" var="bs">
	      	<!--================ Blog slider start =================-->
	          <div class="card blog__slide text-center">
	            <div class="blog__slide__img">
	            	<c:choose>
	            		<c:when test="${ not empty bs.id }">
			              <p>bs.title</p>
	            		</c:when>
	            		<c:otherwise>
			             <p>없으면 이거 뜨는게..?</p>
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            <div class="blog__slide__content">
	              <h3><a href="#">${ bs.content }</a></h3>
	              <p>${ bs.memberId }님 작성</p>
	              <p>${bs.modifyDate }에 작성</p>
	            </div>
	            
	          </div>
     			</c:forEach>
    			</div>
	      
			</div>
		</section>
		
    <!--================ Blog slider end =================-->  
    
    <div class="row">
    	<div style="height:800px;"></div>
    </div>
    
	  <jsp:include page="common/footer.jsp"/>
	  
	</body>
</html>
