<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
		<header>
			<div class="d-flex justify-content-between">
				<div id="logo" >
					<a href="/user/signin_view">
						<img src="/static/images/logo.png" class="mb-4 ml-3" width="50px" alt="logo">
						<label class="display-4">instagram</label>
					</a>					
				</div>

				<div class="button p-3 d-flex">
					<div>
						<c:choose>
							<c:when test="${not empty userId }">
								<div class="d-flex">
									<div>
										<div>
											${userLoginId }님
										</div>
										<div id="onlineCircle">
											<img src="/static/images/online_circle.png" width="10px" alt="online"> <label>접속중</label>
										</div>							
									</div>
									<div class="profileImage">
										<img src="/static/images/user.png" class="ml-2 mr-4" width="50px" alt="profileImage" >
									</div>
									<div id="online">
										<button type="button" class="btn btn-primary mt-2 ml-4 mr-2" id="editBtn" onclick="location.href='/user/edit_view'">edit</button>
										<button type="button" class="btn btn-primary mt-2" id="logoutBtn" onclick="location.href='/user/sign_out'">logout</button>
									</div>
								</div>								
							</c:when>
							<c:otherwise>
								<div id="offline">
									<button type="button" class="btn btn-primary mx-2 mt-2" id="loginBtn" onclick="location.href='/user/signin_view'">로그인</button>
									<button type="button" class="btn btn-primary mt-2" id="signupBtn" onclick="location.href='/user/signup_view'">회원가입</button>			
								</div>								
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
			</div>
		</header>
	