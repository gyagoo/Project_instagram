package com.project.instagram.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId,
			@Param("imagePath") MultipartFile imagePath,
			@Param("content") String content);
}
