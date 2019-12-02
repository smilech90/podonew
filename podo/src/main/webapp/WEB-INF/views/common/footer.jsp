<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
<<<<<<< HEAD
	#footer-wrapper{width: 100%;}
	.footer-1>a{
		color: #b5b5b5;
		margin: 10px;
	}
	.footer-2>p{
		margin: 0;
		text-align: center;
	}
	
	.db-inquiry-btn{
		margin-right: 150px;
	}
	#caution{color:red}

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

			<c:if test="${!empty loginUser }">
			<a href="#" data-toggle="modal" data-target="#db-inquiry-modal">영화 DB 제보</a>
			</c:if>
			<c:if test="${empty loginUser }">
			<a  href="#" data-toggle="modal" data-target="#login2Modal">영화 DB 제보</a>
			</c:if>
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
	
	<!-- 문의 modal -->
	<div class="modal fade" id="db-inquiry-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">영화 DB 제보</h4>
					<button type="button" class="close" data-dismiss="modal" aria-lable="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
				<form class="" action="dbInquiryInsert.do" method="post">
					<div class="form-group">
						<label for="db-inquiry-cate">분류</label>
						<input type="text" class="form-control" value="DB제보" readonly>
					</div>
					<div class="form-group">
						<label for="db-inquiry-content">내용</label>
						<textarea rows="10" cols="15" class="form-control" id="content" name="content"></textarea>
					</div>
					
					<div class="modal-footer">
						<div class="db-inquiry-btn">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						&nbsp;
						<button type="submit" class="btn" id="db-submit-btn" style="background:purple; color:white;" onclick="return validate();">보내기</button>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>	
	</div>
	
	
	
	<!-- 로그인 모달 -->
		<hr style="margin: 0;">
		<div class="modal fade" id="login2Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Login</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div class="modal-body">
						<form class="" action="login.do" method="post">
							<div class="form-group">
								<h3 class="modal-title" id="caution">*로그인 후 DB 제보가 가능합니다.</h3>
								<label for="email">Email address</label>
								<input type="email" class="form-control" name="email" id="email" placeholder="email@address.com">
							</div>
							<div class="form-group">
								<label for="pwd">Password</label>
								<input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
							</div>
							<div class="form-group">
								<div class="form-check">
									<input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
									<label class="form-check-label" for="rememberMe">
								  		Remember me
									</label>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="submit" id="btn-sign-in" class="btn" style="background:purple; color:white;">Sign in</button>
								<button type="button" class="btn btn-default" id="myBtn"  style="background:pink; color:white; width:60px;" onclick="location.href='insertFormMember.do';">Join</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		function validate(){
			var content = $("#content").val();
			var loginUser = "${loginUser.id}";
			
			// 미입력
			if($("#content").val().length == 0){	
				alert("내용을 입력해주세요.")
				$("#content").focus();
				return false;
			}else{	
				
				
				$.ajax({
					url:"dbInquiryInsert.do",
					data:{content:content,
						  loginUser:loginUser},
					type:"post",
					success:function(data){
						if(data==1){
							alert("DB제보 완료");
						}else{
							alert("DB제보 실패");
						}
					},error:function(){
						console.log("DB제보 ajax실패");
					}
					
				});
			}
		}
		
		$(function(){
			$("#login-modal, #rec-login-modal").on("click",function(){
				$('#loginModal').modal('toggle');
			});
		});
	
		$(function(){
		    if (getCookie("email")) {
		       var email = getCookie("email").split(";")
		       $("#email").val(email[0]);
			}
		    
		    if (getCookie("pwd")) {
		    	var pwd = getCookie("pwd").split(";")
				$("#pwd").val(pwd[0]);
			}  
		    
		    if ($("#email").val() != "" && $("#pwd").val() != ""){
		        $("#rememberMe").attr("checked", true);
		    }
		});
	 	
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>
</body>
</html>