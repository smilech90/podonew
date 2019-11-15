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
		<h1 align="center">레이팅리뷰상세페이지</h1>
		<br>
		<h3 align="center">
			<button onclick="location.href='reviewinsertForm.do';">글쓰기</button>
		</h3>
	
	<table align="center" border="2" cellspacing="0" width="700" style="text-align: center">
			<tr>
				<th>번호</th>
				<th>제목</th>
			</tr>
			
		<c:forEach items="${ list }" var="ratingReivew">
			<tr>
				<td>${ ratingReivew.id }</td>
				<td><a href="vdetail.do?id=${ratingReivew.id}">${ ratingReivew.titleKor }</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<h3>${ title }</h3>

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
               label: ["${ titleKor }"], 
            backgroundColor: "rgb(165,102,255)",
            pointBackground:"rgba(179,181,198,1)",
            pointBorderColor:"#fff",
            pointBorderBackgroundColor:"#fff",

               data: [
            	   ${v.m1},${v.m2},${v.m3},${v.m4},${v.m5},5	
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
	
</body>
</html>