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
				background: linear-gradient(133deg, #7b08c8, #e67518, #554dc6, #f776e7);
				background-size: 800% 800%;
				
				-webkit-animation: AnimationName 10s ease infinite;
				-moz-animation: AnimationName 10s ease infinite;
				animation: AnimationName 10s ease infinite;

				height: 100px;
				overflow: hidden;
				cursor: pointer;
			}
			
			@-webkit-keyframes AnimationName {
			    0%{background-position:0% 50%}
			    50%{background-position:100% 50%}
			    100%{background-position:0% 50%}
			}
			@-moz-keyframes AnimationName {
			    0%{background-position:0% 50%}
			    50%{background-position:100% 50%}
			    100%{background-position:0% 50%}
			}
			@keyframes AnimationName {
			    0%{background-position:0% 50%}
			    50%{background-position:100% 50%}
			    100%{background-position:0% 50%}
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
				width: 1110px;
			}

			.leftImage{
				 background:rgba(49,58,102,0.75);
				/* border: 1px solid green; */
				width: 20%;
				height: 100%;
				margin-left:auto;
				margin-right:auto;
				float: left;

			}

			.userImageHome{
			    
				border-radius: 100%;
				height:60%;
				width:100%;
				/* border: 1px solid black; */
				border-radius:30;
				float:left;
				text-align:center;
			}
			.nickNameHome{
				font-size:10px;
				font-weight:bold;
				height:10%;
				width:100%;
				/* border: 1px solid purple; */
				float:left;
				text-align:center;
			}
			.countReview{
				height:15%;
				width:100%;
				float:left;
				text-align:center;
			}
			.starReview{
				height:15%;
				width:100%;
				float:left;
				text-align:center;
			}
			
			
			.rightContent{
				background:rgba(49,58,102,0.75);
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
				background:rgb(18,22,49);
				float: left;
				width:95%;
				height:65%;
				/* border: 1px solid orange; */
			}
			.btns{
			 	float:left;
				margin-left:440px;
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
			
			
		#reviewContentFont{
			margin-top: 20px; text-overflow: ellipsis; overflow: hidden;
		}
		.df_r_content{
    		display : none;
    	}
    	.df_r_spoContent{
    		cursor: pointer;
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
      		<c:forEach items="${ reviewList }" var="r">
      	<div class="homeReviewArea">
			        <div class="leftImage">
			              <img class="userImageHome"  src="resources/memberProfileImage/${ r.userImage }" height="100px">
			               <div class="nickNameHome">${ r.nickName }님</div>
			               <div class="starReview">★점:${ r.star }점</div>
			               <div class="countReview">추천수:${ r.likeCount }회</div>
					</div>
			   		<div class="rightContent">
			   			<div class="titleKorea">
			   				${ r.titleKor }
			   				<c:if test="${loginUser.id eq r.memberId }">
								<a href="reviewUpdateView.do?id=${r.id}" style="margin-left: 725px;">수정하기</a>
							</c:if>
							<c:if test="${ loginUser.id eq r.memberId }">
								<a href="reviewDelete.do?id=${r.id}" >삭제하기</a>
							</c:if>
			   			</div>
			   			
			   			<p id="reviewContentFont" class="title">
								<c:if test="${ r.spoilerCheck eq 'Y' }">
									<div class="contentKorea df_r_spoContent">
										<div class="df_r_spoilerCheck">해당 내용은 스포일러를 포함하고 있습니다.</div>
										<div class="df_r_content">${ r.content }</div>
									</div>
								</c:if>
								<c:if test="${ r.spoilerCheck eq 'N' }">
			            			<div class="contentKorea"> ${ r.content }</div>
									
								</c:if>

							</p>
	             		 <div class="btns">${r.modifyDate } 작성 &nbsp;
										<c:if test="${ r.like==loginUser.id }">
		                                	<button class='likeReviewBtn btn-danger'>LIKED</button>
		                                	<input type="hidden" class="likeInp" value="1"/>
		                                </c:if>
		                                <c:if test="${ r.like!=loginUser.id }">
		                                    <button class='likeReviewBtn btn-secondary'>LIKE</button>
		                                   <input type="hidden" class="likeInp" value="0"/>
		                                </c:if>
							<a class="declaration-modal btn-reply text-uppercase" href="#" data-toggle="modal">리뷰신고하기</a>
						<a class="declaration-modal" href="#" data-toggle="modal">신고하기</a>&nbsp;
						<a href="#">댓글 0개</a>
						</div>
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
						<input type="hidden" name="targetId" value="${ r.id }">
						<input type="hidden" name="reportedId" value="${ r.memberId }">
						
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
			
			
			// 스퍼일러 유무 체크 관련
			$(document).ready(function(){
				$(".df_r_spoContent").on("click",function(){
					  if (confirm("정말 확인하시겠습니까??") == true){    //확인
							$(this).children(".df_r_spoilerCheck").css("display","none");
				        	$(this).children(".df_r_content").css("display","block");
					  }else{   //취소
					      return;
					  }
				});
			});
			
			//좋아요
				$(function() {
		//var likeReivew = $(".likeInp").val();
		//console.log("값 : " + likeReivew);
		
		$(".likeReviewBtn").on("click", function(){
			var userId = "${loginUser.id}";
			var targetId = "${ r.id }"; /* 타겟넘버를 다른방법으로 3개 가져와야합니다. */
			var likeInp = $(".likeInp").val();
			var status = "";
			
			//console.log("버튼클릭시 : " + likeInp);
			
			if(likeInp == '0'){
				status = "like";
			}else if(likeInp == '1'){
				status = "nonlike";
			}
			//console.log(status);
			$.ajax({
					url:"likeReviewClick.do",
					data:{userId:userId,
						  targetId:targetId,
						  status:status},
					type:"post",
					success:function(data){
						//console.log(data);
						if(status == "like"){ // 좋아요클릭시
							if(data == 1){
								$(".likeReviewBtn").removeClass("btn-danger");
								$(".likeReviewBtn").removeClass("btn-secondary");
								$(".likeReviewBtn").addClass("btn-danger");
								$(".likeReviewBtn").text('LIKED');
								$(".likeInp").val('1');
							}else{
								alert("좋아요 실패");
							}
						}else if(status == "nonlike"){ // 좋아요 취소
							if(data >0){
								$(".likeReviewBtn").removeClass("btn-danger");
								$(".likeReviewBtn").removeClass("btn-secondary");
								$(".likeReviewBtn").addClass("btn-secondary");
								$(".likeReviewBtn").text('LIKE');
								$(".likeInp").val('0');
							}else{
								alert("좋아요 실패");
							}
						}
						//console.log("에이작스 후 : " + likeInp);
							
					},error:function(){
						console.log("라이크 ajax 통신 실패");
					}
				});  
			});
		
			});
		</script>
</html>