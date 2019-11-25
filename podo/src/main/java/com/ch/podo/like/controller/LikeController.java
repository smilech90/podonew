package com.ch.podo.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.like.model.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private LikeService likeService;
	
	@RequestMapping("myPageSelectLike.do")
	public ModelAndView myPageSelectLike(String id, ModelAndView mv) {
		System.out.println("라잌");
		mv.addObject("like", id).setViewName("member/myPage");
		return mv;
	}
}
