<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="icon" href="img/Fevicon.png" type="image/png">

  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="css/style.css">
  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="js/jquery.ajaxchimp.min.js"></script>
  <script src="js/mail-script.js"></script>
  <script src="js/main.js"></script>
<title>Insert title here</title>
<style>
	body{
		width: 100%;
		height: 100%;
	}
	#body{
		width: 60%;
		height: 100%;
		margin-left:auto;
		margin-right:auto;
	}
	#mychart2{
		margin-left:auto;
		margin-right:auto;
		width:300px;
		height:190px;
		display:inline-block;
	}
	#movieform{
		display:inline-block;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div id="body">
		<h1 align="center">레이팅리뷰상세페이지</h1>
		
		<br>
		
		<h3 align="center">
			<button onclick="location.href='reviewinsertForm.do';">글쓰기</button>
		</h3>
	  <section class="blog-post-area section-margin">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
            <div class="main_blog_details">
                <img class="img-fluid" src="resources/detailFilmImage/${ rr.fimage }" alt="">
               <h4 align="center">${rr.titleKor }</h4>
                <div class="user_details">
                    <div class="float-left">
                      <div class="media">
                      <div class="media-body">
                        <h5>${rr.nickName }</h5>
                        <p>12 Dec, 2017 11:21 am</p>
                      </div>
                      <div class="d-flex">
                        <img width="42" height="42" src="resources/memberProfileImage/${ rr.userImage }" alt="">
                      </div>
                    </div>
                  	</div>
                  <div class="float-right mt-sm-0 mt-3">
                    <div class="media">
                      <div class="media-body">
                        <h5>${rr.nickName }</h5>
                        <p>여기가 별점남기는곳입니다!!</p>
                      </div>
                      <div class="d-flex">
                        <img width="42" height="42" src="img/blog/user-img.png" alt="">
                      </div>
                    </div>
                  </div>
                </div>
                <br>
                <br>
                <div id="mychart2">
   <canvas id="myChart">캔버스</canvas>
   
   <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
   
   
   
   <script>
   var ctx = document.getElementById('myChart');
   var chart = new Chart(ctx, {
       // The type of chart we want to create
       type: 'radar',

       // The data for our dataset
       data: {
           labels: ["음악", "영상", "연기", "대중성", "각본","연출"],
           datasets: [{
               label: ["${ ratingReivew.titleKor }"], 
            backgroundColor: "rgb(165,102,255)",
            pointBackground:"rgba(179,181,198,1)",
            pointBorderColor:"#fff",
            pointBorderBackgroundColor:"#fff",

               data: [
            	   ${rr.ratingSound},${rr.ratingVisual},${rr.ratingActing},${rr.ratingPop},${rr.ratingScript},${rr.ratingDirect}
            	   ]
    
           }]
       },

       // Configuration options go here
             options: {
                 
                 scale: {
                      angleLines: {
                          display: false
                      },
                      ticks: {
                          suggestedMin: 0,
                          suggestedMax: 10,
                      }
                  },
                  tooltips:{
                     callbacks: {
                          label: function(tooltipItem, data) {
                              
                              return data.labels[tooltipItem.index]  + " : "+ Math.round(tooltipItem.yLabel * 100) / 100 +"점";
                          }
                      }
                  }
              }
    });
   </script>
   </div>
   
    <form action="vinsert.do" method="post" enctype="mutipart/form-data" id="movieform">
      <table align="center" id="vv">
         <tr>
            <td>영화제목</td>
            <td><input type="text" name="title" id="vtitle" value="${ rr.titleKor }" readonly></td>
         </tr>
         <tr>
            <td>음악</td>
            <td><input type="text" name="ratingSound" class="insertRating" id="ratingSound" value="${rr.ratingSound }" readonly></td>
         </tr>
         <tr>   
            <td>영상</td>
            <td><input type="text" name="ratingVisual" class="insertRating" id="ratingVisual" value="${rr.ratingVisual }" readonly></td>
         </tr>
         <tr>
            <td>연기</td>
            <td><input type="text" name="ratingActing" class="insertRating" id="ratingActing" value="${rr.ratingActing }" readonly></td>
         </tr>
         <tr>
            <td>대중성</td>
            <td><input type="text" name="ratingPop" class="insertRating" id="ratingPop" value="${rr.ratingPop }" readonly></td>
         </tr>
         <tr>
            <td>각본</td>
            <td><input type="text" name="ratingScript" class="insertRating" id="ratingScript" value="${rr.ratingScript }" readonly></td>
         </tr>
         <tr>
            <td>연출</td>
            <td><input type="text" name="ratingDirect" class="insertRating" id="ratingDirect" value="${rr.ratingDirect }" readonly></td>
         </tr>
         

      </table>
   </form>
   </div>
                <p>${rr.content }</p>
     

              </div>
        </div>
      </div>
  </section>

<%-- 				${ rr.id }
				${rr.titleKor}
			<br>
			
	<div id="mychart2">
   <canvas id="myChart">캔버스</canvas>
   
   <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
   
   
   
   <script>
   var ctx = document.getElementById('myChart');
   var chart = new Chart(ctx, {
       // The type of chart we want to create
       type: 'radar',

       // The data for our dataset
       data: {
           labels: ["음악", "영상", "연기", "대중성", "각본","연출"],
           datasets: [{
               label: ["${ ratingReivew.titleKor }"], 
            backgroundColor: "rgb(165,102,255)",
            pointBackground:"rgba(179,181,198,1)",
            pointBorderColor:"#fff",
            pointBorderBackgroundColor:"#fff",

               data: [
            	   ${rr.ratingSound},${rr.ratingVisual},${rr.ratingActing},${rr.ratingPop},${rr.ratingScript},${rr.ratingDirect}
            	   ]
    
           }]
       },

       // Configuration options go here
             options: {
                 
                 scale: {
                      angleLines: {
                          display: false
                      },
                      ticks: {
                          suggestedMin: 0,
                          suggestedMax: 10,
                      }
                  },
                  tooltips:{
                     callbacks: {
                          label: function(tooltipItem, data) {
                              
                              return data.labels[tooltipItem.index]  + " : "+ Math.round(tooltipItem.yLabel * 100) / 100 +"점";
                          }
                      }
                  }
              }
    });
   </script>
   </div> --%>
			
	
	<br>
	

	</div>
</body>
</html>