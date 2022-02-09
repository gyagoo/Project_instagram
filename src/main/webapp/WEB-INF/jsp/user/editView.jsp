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
<title>edit profile</title>
</head>
<body>
	<div id="wrap">
		<div class="container-lg">
			<c:import url="/WEB-INF/jsp/include/header.jsp"/>
			
			<section class="content d-flex justify-content-center">
				<div class="edit-box my-5">
					<form id="updateForm">
						<div class="display-4 text-center mt-5">프로필 수정</div>
						<div>
							<input type="text" class="form-control mt-3" placeholder="이름" id="nameInput" name="name">
							<input type="text" class="form-control mt-3" placeholder="이메일" id="emailInput" name="email">
							<input type="file" id="imageInput" class="mt-3" accept="image/jpeg, image/png">
							<button type="submit" id="saveBtn" class="btn btn-primary btn-block mt-3">Update</button>
						</div>
					</form>
				</div>	
			</section>
			
			<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			$('#saveBtn').on("click", function() {
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				var formData = new formData();
				
			});
		});
	</script>
</body>
</html>