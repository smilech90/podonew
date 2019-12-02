<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

	<head>
	
		<jsp:include page="common/header.jsp"/>
		
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
			
			.podo-ad-banner {
				background-color: #6617cb;
				background-image: linear-gradient(315deg, #6617cb 0%, #cb218e 74%);
				height: 100px;
				overflow: hidden;
				cursor: pointer;
			}
			
			.podo-ad-banner>div {
				height: 100%;
				line-height: 100px;
				text-align: center;
				font-size: 20px;
				color: blanchedalmond;
			}
			
			.homeReviewArea{
				margin-left:auto;
				margin-right:auto;
				
				height: 150px;
				/* border: 1px solid blue; */
				width: 600px;
			}

			.leftImage{
				/* border: 1px solid green; */
				width: 20%;
				height: 100%;
				margin-left:auto;
				margin-right:auto;
				float: left;

			}

			.userImageHome{
				border-radius: 100px;
				height:80%;
				width:100%;
				/* border: 1px solid black; */
				border-radius:30;
				float:left;
				text-align:center;
			}
			.nickNameHome{
				height:20%;
				width:100%;
				/* border: 1px solid purple; */
				float:left;
				text-align:center;
			}
			
			.rightContent{
				/* border: 1px solid red; */
				height:100%;
				width: 80%;
				float: left;
			}
			
			.homeContent{
				width:100%;
				height:100%;
				float:left;
			}
			
			.titleKorea{
				width:100%;
				float: left;
				/* border: 1px solid yellow; */
				height: 20%;
			}
			.contentKorea{
				float: left;
				width:100%;
				height:65%;
				/* border: 1px solid orange; */
			}
			.btns{
				float: left;
				width:100%;
				height: 15%;
			}
			.table-responsive-xl{
			
				width: 800px;
				margin-left:auto;
				margin-right:auto;
			}
			tbody{
				background-color: rgb(131,36,255);
				font-size: 12px;
			}
			.bNo{
				border: 1px solid black;
				text-align: center;
			}
			.bTitle{
				text-align: center;
			}
			#boardMore{
				margin-left: 750px;
			}
			#ReviewMore{
				margin-left: 850px;
			}
			
		</style>
	</head>
	<body>
    <!--================Hero Banner start =================-->
    <section class="mb-30px">
      <div class="container">
        <div class="main-banner">
          <div class="hero-banner__content">
            <h3>Film &amp; Review</h3>
            <h1>Great, Grape!</h1>
            <h4>December 5, 2019</h4>
          </div>
        </div>
      </div>
    </section>
    <!--================Hero Banner end =================-->
    
    <!--================ Advertisement start =================-->
    <c:if test="${ (empty loginUser) or (loginUser.premium eq 'N')}">
	    <div class="container" style="background-color: black; background-clip: content-box; margin-bottom: 30px;">
	    	<div class="podo-ad-banner" onclick="location.href='premium.do'">
	    		<div>
		      	무료로 가입하시고 단돈 1,100원에 광고를 제거해보세요!
	    		</div>
	    	</div>
	    </div>
    </c:if>
    <!--================Advertisement end =================-->
		
    <!--================ Blog slider start =================-->
    <!-- 창수가 구현한 위페이지 -->
    <section class="blog-post-area section-margin">
			<div class="container">
			
        <div class="owl-carousel owl-theme blog-slider">
      		<c:forEach items="${ list }" var="film">
	      	<!--================ Blog slider start =================-->
	        	
	          <div class="card blog__slide text-center">
	            <div class="blog__slide__img" onclick="location.href='detailFilm.do?filmId=${ film.id }'">
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
	              <a class="blog__slide__label" href="detailFilm.do?filmId=${ film.id }">${ film.avgStarRating }</a>
	              <h3><a href="detailFilm.do?filmId=${ film.id }">${ film.titleKor }</a></h3>
	              <p>${ film.releaseYear }</p>
	            </div>
	            
	          </div>
     			</c:forEach>
    			</div>
	      
			</div>
		</section>
		<!-- 영화리뷰쪽 -->
		
			
			
	        	<p align="center">리뷰</p>
	        	
	         			<a href="reviewList.do" id="ReviewMore">리뷰 더보기</a>
      		<c:forEach items="${ reviewList }" var="rs">
      	<div class="homeReviewArea">
			        <div class="leftImage">
			              <img class="userImageHome"  src="resources/memberProfileImage/${ rs.userImage }1.jpg" height="100px">
			               <div class="nickNameHome">${ rs.nickName }님</div>
					</div>
			   		<div class="rightContent">
			   			<div class="titleKorea">${ rs.titleKor }</div>
			            <div class="contentKorea"> ${ rs.content }</div>
	             		 <div class="btns">${rs.modifyDate }에 작성 <button >추천</button><a class="declaration-modal btn-reply text-uppercase" href="#" data-toggle="modal">신고하기</a><button>댓글</button> </div>
			        </div>       
			        


	     </div>
	     	<hr style="width: 600px;">
     			</c:forEach> 
     			
    			
	      

		
		
		<!-- 자유게시판 -->	
			
	 <div class="row">
    	<div style="height:200px;"></div>
    </div>	
    <div class="table-responsive-xl">
	    <p align="center">자유게시판</p>
						<a href="blist.do" id="boardMore">더보기</a>
	<table class="table table-striped table-dark" align="center" cellspacing="0">
		<tr>
			<th></th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>좋아요</th>
		</tr>
		<c:forEach items="${ boardList }" var="b">
			<tr class="boardB">
		
				<td>${ b.id }</td>
			
				<td>${ b.title }</td>
				<td>${ b.nickName }</td>
				<td>${ b.createDate }</td>
				<td>${ b.viewCount}</td>
				<td>${ b.likeCount }</td>
			</tr>
		</c:forEach>
		
	</table>
	</div>
    <!--================ Blog slider end =================-->  
    
    <div class="row">
    	<div style="height:800px;"></div>
    </div>
    
	  <jsp:include page="common/footer.jsp"/>
	  
	  
	  <!-- 신고하기 모달 -->
	<div class="modal fade de_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					신고하기
					<form action="declarationModal.do" method="post">
						<input type="hidden" name="reportId" value="${ loginUser.id }">
						<input type="hidden" name="targetId" value="${ rs.id }">
						<input type="hidden" name="reportedId" value="${ rs.memberId }">
						
					<div class="eu">
						
						<p></p>
							<input class="reviewType" type="radio" value="1" name="content">부적절한내용
							<input class="reviewType" type="radio" value="2" name="content">스포일러
						<p></p>
					</div>
					<div class="modal-footer">
						<button  type="submit" class="btn btn-primary">신고보내기</button>
						<button  class="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	  
	</body>
		<script>
			$(function(){
				$(".boardB td").mouseenter(function(){
					$(this).parent().css({"cursor":"pointer"});
				}).mouseout(function(){
					$(this).parent().css(/* "background", "white" */);
				}).click(function(){
					
					var bId = $(this).parent().children().eq(0).text();
					

						location.href="bdetail.do?id="+bId;

					
				});
			});
			
			
			// 신고하기

			$(".declaration-modal").on("click", function() {
				$(".de_modal").modal();
				//console.log("${ loginUser.id }");
			});
		</script>
</html>
