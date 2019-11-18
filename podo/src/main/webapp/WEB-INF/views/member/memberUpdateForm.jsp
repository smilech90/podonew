<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PoDo_회원정보수정</title>

	<script>
	
	function Hi() {
	     alert(${ msg });
	}
	
	</script>

</head>
<body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<c:if test="${ msg ne null }">
		body onload="Hi()"
	</c:if>	
	
	<div>
		<form action="updateMember.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${ loginUser.id }" readonly>
			<input type="email" id="userId" name="email" value="${ loginUser.email }"><br>
			<input type="text" id="userNickName" name="nickName" value="${ loginUser.nickName }"><br>
			
			<input type="password" id="updatePwd" name="updatePwd" placeholder="변경 버튼을 눌러주세요."><button type="button">비밀번호 변경</button><br>
			<input type="hidden" id="sessionPwd" name="pwd" value="${ loginUser.pwd }">
			
			<img id="preview" src="resources/memberProfileImage/${ loginUser.image }" width="70px" height="70px"> 
			<input type="file" id="imgInp" name="uploadFile" ><br>
			<button type="button">기본이미지로 변경</button><br>
			<button type="submit" onclick="return validate();">Update</button>
			<button type="button" onclick="location.href='myPage.do';">Cancel</button>
		</form>
	</div>
	
	

	
	
	<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function() {
        readURL(this);
    });
	
	</script>
	




</body>
</html>