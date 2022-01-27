package com.project.instagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.instagram.common.EncryptUtils;
import com.project.instagram.user.dao.UserDAO;
import com.project.instagram.user.model.User;
@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	// 회원가입
	public int addUser(String loginId, String password, String name, String email) {
		return userDAO.insertUser(loginId, EncryptUtils.md5(password), name, email);
	}
	
	// 중복
	public Boolean isDuplicateLoginId(String loginId) {
		int count = userDAO.selectCountLoginId(loginId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 로그인
	public User getUser(String loginId, String password) {
		return userDAO.selectUser(loginId, EncryptUtils.md5(password));
	}
}
