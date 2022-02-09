<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<meta charset="UTF-8">
<title>피드</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<div class="container-lg">
			<c:import url="/WEB-INF/jsp/include/nav.jsp"/>	
				
			<section class="content">
				<div class="container post">
					<div class="post-header pt-3">
						<div class="d-flex">
							<img src="/static/images/user.png" width="50px" alt="profileImage">
							<div class="ml-3">
								<div>user</div>
								<div>createdAt</div>
							</div>
						</div>
					</div>
					
					<div class="post-section mt-2">
						<img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FAFzsZ%2FbtqI088tZW3%2FHCqq10x0OG9SoMdG2Bo3YK%2Fimg.jpg" alt="content-img">
					</div>
					
					<div class="post-footer mt-2">
						<img src="/static/images/heart_unselected.png" width="45px" class="mr-2">
						<img src="/static/images/reply.png" width="45px" role="button">
						<div class="mt-1">user님 외 3명이 좋아합니다</div>
					</div>
					<div class="post-reply mt-1">
						<input type="text" class="form-control" placeholder="댓글 내용을 입력하세요">
						<div class="d-flex">
							<div class="mr-3"><b>user</b></div>
							<div>댓글내용</div>
						</div>
					</div>
				</div>
			</section>	
			
			
		</div>	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
</html>