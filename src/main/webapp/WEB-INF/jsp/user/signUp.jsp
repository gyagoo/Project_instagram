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
<title>회원가입</title>
</head>
<body>
	<div id="wrap" class="bg-info">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="content d-flex justify-content-center">
			<div class="join-box my-5">
				<form id="signupForm">
					<div class="display-4">회원가입</div>
					<div class="d-flex">
						<input type="text" class="form-control mt-3" placeholder="아이디" id="loginIdInput" name="loginId">
						<button type="button" id="isDuplicateBtn" class="form-control btn btn-primary col-3 ml-2 mt-3">중복</button>
					</div>
					<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput" name="password">
					<input type="password" class="form-control mt-3" placeholder="비밀번호 확인" id="passwordConfirmInput" name="passwordConfirm">
					<input type="text" class="form-control mt-3" placeholder="이름" id="nameInput" name="name">
					<input type="text" class="form-control mt-3" placeholder="이메일" id="emailInput" name="email">
					
					<button type="submit" class="btn btn-primary btn-block mt-3">Join</button> 
				</form>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			var isDuplicateCheck = false;
			
			$("#isDuplicateBtn").on("click", function() {
				var loginId = $("#loginIdInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				$.ajax({
					type: "post",
					url: "/user/is_duplicate_id",
					data: {"loginId":loginId},
					success: function(data) {
						if(data.result) {
							alert("사용 가능한 아이디입니다");
							isDuplicateCheck = true;
						} else {
							alert("중복된 아이디입니다");
							isDuplicateCheck = false;
						}
					},
					error: function() {
						alert("error\ntry again !")
					}
				});
			});
			
			// 아이디 수정을 시도하면 중복 체크가 초기화 되도록
			// $("#loginInput").
			
			$("#signupForm").on("submit", function(e) {
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm	= $("#passwordConfirmInput").val();
				var name = $("#nameInput").val();
				var email = $("#emailInput").val();
				
				if(isDuplicateCheck == false) {
					alert("아이디 중복체크를 하세요");
					return;
				}
				if(loginId == "") {
					alert("아이디를 입력하세요");
					return;
				}
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				if(passwordConfirm != password) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				if(name == "") {
					alert("이름을 입력하세요");
					return;
				}
				if(email == "") {						// 나중에 email@address 형태로 바꾸기
					alert("이메일을 입력하세요");
					return;
				}

				
				$.ajax({
					type: "post",
					url: "/user/sign_up",
					data: {"loginId":loginId, "password":password, "passwordConfirm":passwordConfirm, "name":name, "email":email},
					success: function(data) {
						if(data.result == "success") {
							alert("회원가입을 환영합니다*^^*");
							location.href="/user/signin_view";
						} else {
							alert("회원가입에 실패하셨습니다");
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