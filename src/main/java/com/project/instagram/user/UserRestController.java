package com.project.instagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.instagram.user.bo.UserBO;
import com.project.instagram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String>	usermap = new HashMap<>();
		if (count == 1) {
			usermap.put("result", "success");		// 성공
		} else {
			usermap.put("result", "fail");
		}
		
		return usermap;
	}
	
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		Map<String, String>	loginmap = new HashMap<>();
		User user = userBO.getUser(loginId, password);
		if(user != null) {	// 성공
			loginmap.put("result", "success");
			// session
			HttpSession session = request.getSession();
			
			// id, loginId, password
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
		} else {
			loginmap.put("result", "fail");
		}
		
		return loginmap;		
	}
}
