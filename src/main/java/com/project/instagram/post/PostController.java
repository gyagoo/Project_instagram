package com.project.instagram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@GetMapping("/feed_view")
	public String feedView() {
		return "post/feed";
	}
	
	@GetMapping("/create_view")
	public String createView() {
		return "post/createView";
	}
}
