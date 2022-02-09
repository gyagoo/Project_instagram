<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div id="wrap">
		<div class="container-lg">
			<header>
				<div class="d-flex justify-content-between">
					<div id="logo" >
						<img src="/static/images/logo.png" class="mb-4 ml-3" width="50px" alt="logo">
						<label class="display-4">instagram</label>				
					</div>
	
				</div>
			</header>
			
			<section class="d-flex">
				<div class="div-left w-50 d-flex justify-content-end">
					<img src="/static/images/cellphonewithpic.png" width="380px">
				</div>
				<%-- 로그인 상태일 경우 프로필 화면 --%>
				<c:choose>
					<c:when test="${not empty userId }">	<%-- 로그인 상태 --%>
						<div class="d-flex justify-content-center align-items-center bg-white div-right rounded">
							<div>
								<div class="d-flex justify-content-center">
									<div><img src="/static/images/user.png" width="150px" class="mt-5"></div>
								</div>
								<div class="display-5 d-flex justify-content-center mt-3">${userLoginId }님</div>
								<div class="d-flex justify-content-center mt-3">
									<a href="/user/sign_out">로그아웃</a>
								</div>
							</div>	
						</div>
					</c:when>
					<c:otherwise>
						<div class="div-right mt-5">
							<%-- login --%>
							<div id="div-login" class="login-box d-flex align-item-start justify-content-center mt-5 p-3 bg-white rounded">
								<form id="loginForm">
									<div class="display-4 text-center">로그인</div>
									<input type="text" class="form-control mt-3" placeholder="아이디" id="loginIdInput" name="loginId">
									<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput" name="password">				
									<div class="d-flex justify-content-center">
										<button type="submit" class="btn btn-primary my-3 btn-block">LogIn</button>
									</div>
								</form>
							</div>
							<div class="text-center bg-info mt-3 align-item-end bg-white p-3 rounded">
								계정이 없으신가요?<a href="/user/signup_view" class="text-primary"> 가입하기</a>
							</div>					
						</div>						
					</c:otherwise>
				</c:choose>
			</section>
	
			
			<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		</div>	
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#loginForm").on("submit", function(e) {
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type: "post",
					url: "/user/sign_in",
					data: {"loginId":loginId, "password":password},
					success: function(data) {
						if(data.result == "success") {
							location.href="/post/feed_view";
						} else {
							alert("아이디와 비밀번호를 확인하세요");
						}
					},
					error: function() {
						alert("error");
						
					}
				});
			});
			
		});
	</script>
</body>
</html>