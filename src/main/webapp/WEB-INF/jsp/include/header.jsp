<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
		<header>
			<div id="logo" class="d-flex justify-content-between">
				<div>
					<img src="/static/images/logo.png" class="mb-4 ml-3" width="50px" alt="logo">
					<label class="display-4">instagram</label>				
				</div>

				<div class="button p-3 d-flex">
					<div>
						<c:choose>
							<c:when test="${not empty userId }">
								<div>
									${userLoginId }님
								</div>
								<div id="onlineCircle">
									<img src="/static/images/online_circle.png" width="10" alt="online"> <label>접속중</label>
								</div>
							</c:when>
						</c:choose>							
					</div>
					<!-- 여기부터 -->
					<div id="offline">
						<button type="button" class="btn btn-primary mx-2 mt-2" id="loginBtn" onclick="location.href='/user/signin_view'">로그인</button>
						<button type="button" class="btn btn-primary mt-2" id="signupBtn" onclick="location.href='/user/signup_view'">회원가입</button>			
					</div>
					
					<div id="online" class="d-none">
						<button type="button" class="btn btn-primary" id="logoutBtn" onclick="location.href='/user/signin_view'">logout</button>
					</div>
				</div>
			</div>
		</header>