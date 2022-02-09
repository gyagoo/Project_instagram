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
<title>upload post</title>
</head>
<body>
	<div id="wrap">
		<div class="container-lg">
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
			<section class="d-flex">
				<div class="content">
					<div class="post-box">
						<div class="image-div">
							<div class="image-preview bg-secondary mt-2">	</div>
							<div class="image-upload mt-2">
								<input type="file" id="imageInput" accept="image/jpeg, image/png">
							</div>
						</div>	
						<div id="text-div" class="mt-2">
							<textarea class="form-control" rows="5" cols="10" id="contentInput"></textarea>
						</div>
						<div class="my-2">
							<button type="button" id="saveBtn" class="btn btn-block btn-primary">post</button>
						</div>
					</div>	
				</div>
			</section>
			
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />			
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			$("#saveBtn").on("click", function() {
				let content = $("#contentInput").val();

				var formData = new formData();
				// 파라미터, 데이터 저장
				formData.append("content", content);
				formData.append("imagePath"), $("#imageImput")[0].files[0];
			
				if(!formData.endsWith(".png") || !formData.endsWith(".jpg")) {
					alert("이미지 파일만 업로드해주세요");
					return;
				}
				
				$.ajax({
					type: "post",
					url: "/post/create",
					data: formData,
					
					encType: "multipary/form-data", //파일 업로드 필수
					processData: false,
					contentType: flase,
					
					success: function(data) {
						if(data.result == "success") {
							location.href="/post/feed_view";	// list view로 이동하도록 수정
						} else {
							alert("post failed");
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