<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>영화 찾기</title>
		<style>
			
			#search-film-result {
				border-collapse: collapse;
			}
			
			#search-film-result td,
			#search-film-result tr {
				text-align: center;
				border: 1px solid;
			}
			
		</style>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	</head>
  <body>
		<jsp:include page="../common/header.jsp"/>
		
		<div class="container">
			<h3>
				작품찾기에서는 원하는 영화를 어디에서 볼 수 있는지, 내가 이용하는 서비스가 어떤 영화들을 제공하고 있는지를 확인할 수 있습니다. <br>
				다양한 필터를 적용해 오늘 감상할 영화를 찾아보세요!
			</h3>
			
			<select name="releaseYear">
				<option value="">연도별</option>
				<c:forEach begin="2010" end="2019" step="1" var="yyyy">
					<option value="${ yyyy }">${ yyyy }</option>
				</c:forEach>
			</select>
			<select name="productionCountry">
				<option value="">국가별</option>
				<option value="한국">한국</option>
				<option value="미국">미국</option>
				<option value="일본">일본</option>
			</select>
			<select name="genre">
				<option value="">장르별</option>
				<c:forEach items="${ genre }" var="g">
					<option value="${ g.id }">${ g.name }</option>
				</c:forEach>
			</select>
			
			<table id="search-film-result">
				<thead>
					<tr>
						<th colspan="9"><b id="film-count"></b></th>
					</tr>
					<tr>
						<th colspan="2">제목</th>
						<th>감독</th>
						<th>개봉연도</th>
						<th>국가</th>
						<th>장르</th>	
						<th>포스터</th>
						<th>좋아요</th>
						<th>별점</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		
		</div>
		
		
		<script>
			
			/* 영화 검색목록 불러오기 AJAX */
			$("select[name=releaseYear], select[name=productionCountry], select[name=genre]").on("change", function(){
				
				var releaseYear = $("select[name=releaseYear]").val();
				var productionCountry = $("select[name=productionCountry]").val();
				var genre = $("select[name=genre]").val();
				// console.log(releaseYear);
				// console.log(productionCountry);
				// console.log(genre);
				
				$.ajax({
					url:"sfFilm.do",
					data:{ releaseYear : releaseYear,
							   productionCountry : productionCountry,
							   genre : genre },
					success:function(data){
						console.log("ajax 통신 성공");
						console.log(data);
						
						$tbody = $("#search-film-result tbody");
						$tbody.html("");
						
						$("#film-count").text("검색결과(" + data.film.length + ")");

						if (data.film.length > 0){
							
							var like = data.like;
							
							$.each(data.film, function(index, value){
								$tr = $("<tr></tr>");
								
								$korTd = $("<td width='100'></td>").text(value.titleKor);
								$idTd = $("<td id='film-id-td' style='display: none;'></td>").text(value.id);
								$engTd = $("<td></td>").text(value.titleEng);
								$directorTd = $("<td></td>").text(value.director);
								$releaseTd = $("<td></td>").text(value.releaseYear);
								$countryTd = $("<td></td>").text(value.productionCountry);
								$genreTd = $("<td></td>").text(value.genre);
								$posterTd = $("<td></td>").html("<img src='http://placehold.it/107x152'>");
								
								// 좋아요한 영화인지 검사
								if (like[value.id] != null) {
									$likeTd = $("<td></td>").html("<button class='btn btn-danger btn-liked-film'>LIKED</button>");
								} else {
									$likeTd = $("<td></td>").html("<button class='btn btn-secondary btn-like-film'>LIKE</button>");
								}
								
								$tr.append($korTd);
								$tr.append($idTd);
								$tr.append($engTd);
								$tr.append($directorTd);
								$tr.append($releaseTd);
								$tr.append($countryTd);
								$tr.append($genreTd);
								$tr.append($posterTd);
								$tr.append($likeTd);
								
								$tbody.append($tr);
							
							});
							
						} else {
							
							$tr = $("<tr></tr>");
							
							$contentTd = $("<td colspan='9'></td>").text("검색된 결과가 없습니다.");
							$tr.append($contentTd);
							
							$tbody.append($tr);
						}
						
					},
					error:function(){
						console.log("ajax 통신 실패");
					}
				});
				
			});
			
			/* 좋아요 AJAX */
			$(document).on("click", ".btn-like-film, .btn-liked-film", function(){
				// 영화 ID 찾기
				var fid = $(this).closest("tr").find("td").eq(1).text();
				var $this = $(this)[0];
				
				// flag
				if ($($this).hasClass("btn-like-film")) {
					var likeFlag = 1;
				} else {
					var likeFlag = 0;
				}
				
				$.ajax({
					url:"filmLike.do",
					data:{"fid":fid, "flag":likeFlag},
					type:"post",
					dataType:"json",
					success:function(data){
						// 이미 'LIKE'라면 'LIKED' 버튼이 보여짐
						if (data > 0 && $($this).hasClass("btn-like-film")) {
							$($this).closest("td").find("button")
							 				.removeClass("btn-secondary")
										 	.removeClass("btn-like-film")
										  .addClass("btn-danger")
										  .addClass("btn-liked-film")
										  .text("LIKED");
						} else {
							$($this).closest("td").find("button")
											.removeClass("btn-danger")
											.removeClass("btn-liked-film")
											.addClass("btn-secondary")
											.addClass("btn-like-film")
											.text("LIKE");
						}
					},
					error:function(){
						console.log("서버와의 통신 실패");
					}
				});
			});
			
		</script>
	
		<jsp:include page="../common/footer.jsp"/>
	</body>
</html>