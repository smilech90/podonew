<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	div{
		box-sizing: border-box;
	}
	#footer-wrapper{width: 100%;}
	.footer-1>a{
		color: navy;
		text-decoration: none;
		font-weight: 700;
		margin: 10px;
		line-height: 25px;
	}
	.footer-2>p{
		margin: 0;
		text-align: center;
		font-weight: 500;
	}
</style>
	
	<script src="resources/bootstrap/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="resources/bootstrap/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="resources/bootstrap/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/bootstrap/js/mail-script.js"></script>
	<script src="resources/bootstrap/js/main.js"></script>
	
</head>
<body>

	<br><br>
	
	<hr>
	
	<!--================ Start Footer Area =================-->
	<div id="footer-wrapper">
		<div class="footer-1" align="center">
			<a href="termsofuse.do">이용약관 </a> | 
			<a href="privacyPolicy.do">개인정보취급방침</a> | 
			<a href="faq.do">이용가이드</a> | 
			<a href="#" id="footer-inquiry-modal">이용문의 및 DB제보</a>
		</div>
		
		
		<!-- 이용문의 및 DB제보 modal -->
	<hr style="margin: 0;">
	<div class="modal fade" id="inquiryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 align="center" class="modal-title" id="exampleModalLabel">이용문의 및 DB제보</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<form class="" action="" method="post">
						<div class="form-group">
							<label for="inquiry-title">제목</label>
							<input type="text" class="form-control" name="inquiry-title" id="inquiry-title" placeholder="제목을 입력해주세요.">
						</div>
						<div class="form-group">
							<label for="inquiry-cate">분류</label>
							<select class="form-control" name="inquiry-cate" id="inquiry-cate">
							</select>
						</div>
						<div class="form-group">
							<div class="inquiry-content-area">
								<label for="inquiry-cate">내용</label>
								<textarea class="form-control" name="inquiry-content" id="inquiry-content" cols="10" rows="20">
								</textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="submit" id="btn-sign-in" class="btn" style="background:purple; color:white;">보내기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
		
		<br>
		<div class="footer-2">
			<p>업무 제휴 문의 : kh@podo.com</p>
			<p>
			PODO | 서울 강남 제2014-01호 | 대표자 : 최봉운 | 책임자 : 김철환, 임창수, 최유정, 한혜경, 홍윤진
			</p>
			<p>Copyright &copy; 2019 PODO ALL RIGHTS RESERVED.</p>
			<br>
		</div>
	</div>
	
	
	<script>
		$(function(){
			$("#footer-inquiry-modal").on("click", function(){
				$('#inquiryModal').modal('toggle');
			});
		});
	</script>
	
	
	
</body>
</html>