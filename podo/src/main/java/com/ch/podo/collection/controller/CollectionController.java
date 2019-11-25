package com.ch.podo.collection.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.collection.model.service.CollectionService;

@Controller
public class CollectionController {
	
	@Autowired
	private CollectionService collectionService;
	
	@RequestMapping("myPageSelectCollection")
	public ModelAndView myPageSelectCollection(String id, ModelAndView mv) {
		System.out.println("컬렉");
		mv.addObject("collection", id).setViewName("member/myPage");
		return mv;
	}

}
